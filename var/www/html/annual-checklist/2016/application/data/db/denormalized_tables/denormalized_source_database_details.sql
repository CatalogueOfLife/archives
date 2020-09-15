INSERT INTO `denormalized_source_database_details`
(`id`, `full_name`, `short_name`, `version`, `release_date`, `authors_editors`,
`english_name`, `number_of_species`, `number_of_infraspecific_taxon`,
`number_of_synonyms`, `number_of_common_names`, `abstract`, `organization`)

SELECT
    sd.`id` AS id,
    sd.`name` AS full_name,
    sd.`abbreviated_name` AS short_name,
    sd.`version` AS version,
    sd.`release_date` AS release_date,
    sd.`authors_and_editors` AS authors_editors,
    sd.`group_name_in_english` AS english_name,
    (SELECT COUNT(*) AS `total` FROM `source_database` AS sd2 RIGHT JOIN `taxon` AS `t` ON sd2.id = t.source_database_id WHERE (sd2.id = sd.id AND t.taxonomic_rank_id = 83)) AS number_of_species,
    (SELECT COUNT(*) AS `total` FROM `source_database` AS sd3 RIGHT JOIN `taxon` AS `t` ON sd3.id = t.source_database_id WHERE (sd3.id = sd.id AND t.taxonomic_rank_id NOT IN (54,76,6,72,112,17,20,96,83))) AS number_of_infraspecific_taxon,
    (SELECT COUNT(*) AS `total` FROM `source_database` RIGHT JOIN `taxon` AS `t` ON source_database.id = t.source_database_id RIGHT JOIN `synonym` AS `s` ON t.id = s.taxon_id WHERE source_database.id = sd.id) AS number_of_synonyms,
    (SELECT COUNT(*) AS `total` FROM `source_database` AS sd4 RIGHT JOIN `taxon` AS `t` ON sd4.id = t.source_database_id RIGHT JOIN `common_name` AS `cn` ON t.id = cn.taxon_id WHERE (sd4.id = sd.id)) AS number_of_common_names,
    sd.`abstract` AS abstract,
    sd.`organisation` AS organization

FROM
    `source_database` AS sd
;

UPDATE `denormalized_source_database_details` SET `total_number` = 
`number_of_species` + `number_of_infraspecific_taxon` + `number_of_synonyms` +
`number_of_common_names`

;

CREATE TABLE IF NOT EXISTS `denormalized_source_database_taxonomic_coverage` (
`source_database_id` INT( 10 ) NOT NULL ,
`kingdom` VARCHAR( 255 ) NOT NULL ,
`phylum` VARCHAR( 255 ) NOT NULL ,
`class` VARCHAR( 255 ) NOT NULL ,
`order` VARCHAR( 255 ) NOT NULL ,
`kingdom_id` INT( 10 ) NOT NULL ,
`phylum_id` INT( 10 ) NOT NULL ,
`class_id` INT( 10 ) NOT NULL ,
`order_id` INT( 10 ) NOT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci

;

INSERT INTO `denormalized_source_database_taxonomic_coverage`
(`source_database_id`, `kingdom`, `phylum`, `class`, `order`, `kingdom_id`,
`phylum_id`, `class_id`, `order_id`)

SELECT
`source_database`.`id` AS `source_database_id`,
`sne_k`.`name_element` AS `kingdom`,
`sne_p`.`name_element` AS `phylum`,
`sne_c`.`name_element` AS `class`,
`sne_o`.`name_element` AS `order`,
`tne_k`.`taxon_id` AS `kingdom_id`,
`tne_p`.`taxon_id` AS `phylum_id`,
`tne_c`.`taxon_id` AS `class_id`,
`tne_o`.`taxon_id` AS `order_id`

FROM
`source_database`

RIGHT JOIN `taxon` AS `t` ON
source_database.id = t.source_database_id AND
t.taxonomic_rank_id = 20

RIGHT JOIN `taxon_name_element` AS `tne_g` ON
t.id = tne_g.taxon_id

RIGHT JOIN `taxon_name_element` AS `tne_f` ON
tne_g.parent_id = tne_f.taxon_id

LEFT JOIN `taxon_name_element` AS `tne_sf` ON
tne_f.parent_id = tne_sf.taxon_id

LEFT JOIN `taxon` AS `t_sf` ON
tne_sf.taxon_id = t_sf.id AND
t_sf.taxonomic_rank_id = 112

RIGHT JOIN `taxon_name_element` AS `tne_o` ON
(tne_f.parent_id = tne_o.taxon_id AND
t_sf.id IS NULL) OR
(tne_sf.parent_id = tne_o.taxon_id AND
t_sf.id IS NOT NULL)

RIGHT JOIN `scientific_name_element` AS `sne_o`
ON tne_o.scientific_name_element_id = sne_o.id

RIGHT JOIN `taxon_name_element` AS `tne_c` ON
tne_o.parent_id = tne_c.taxon_id

RIGHT JOIN `scientific_name_element` AS `sne_c` ON
tne_c.scientific_name_element_id = sne_c.id

RIGHT JOIN `taxon_name_element` AS `tne_p` ON
tne_c.parent_id = tne_p.taxon_id

RIGHT JOIN `scientific_name_element` AS `sne_p` ON
tne_p.scientific_name_element_id = sne_p.id

RIGHT JOIN `taxon_name_element` AS `tne_k` ON
tne_p.parent_id = tne_k.taxon_id

RIGHT JOIN `scientific_name_element` AS `sne_k` ON
tne_k.scientific_name_element_id = sne_k.id

WHERE `source_database`.`id` IS NOT NULL