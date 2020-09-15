INSERT INTO `temp_taxon_tree` (`taxon_id`, `name`, `rank`, `parent_id`, `lsid`, `number_of_children`)
SELECT
    t_1.`id` AS `taxon_id`,
    IF(t_1.`taxonomic_rank_id` IN (54,76,6,72,17,112,20),sne_1.`name_element`,
        IF(t_1.`taxonomic_rank_id` = 83,CONCAT_WS(' ',sne_2.`name_element`,sne_1.`name_element`),
            CONCAT_WS(' ',sne_3.`name_element`,sne_2.`name_element`,sne_1.`name_element`)
        )
    ) AS `name`,
    rank.`rank` AS `rank`,
    tne_1.`parent_id` AS `parent_id`,
    IF(MAX(uri.`resource_identifier`) LIKE 'urn:lsid:%',MAX(uri.`resource_identifier`),NULL)AS `lsid`,
    COUNT(children.`parent_id`) AS `number_of_children`
FROM
    `taxon` AS `t_1`

RIGHT JOIN `taxonomic_rank` AS `rank` ON
    t_1.`taxonomic_rank_id` = rank.`id`

RIGHT JOIN `taxon_name_element` AS `tne_1` ON
    t_1.`id` = tne_1.`taxon_id`
RIGHT JOIN `scientific_name_element` AS `sne_1` ON
    tne_1.`scientific_name_element_id` = sne_1.`id`
LEFT JOIN `taxon` AS `t_2` ON
    tne_1.`parent_id` = t_2.`id`
LEFT JOIN `taxon_name_element` AS `tne_2` ON
    t_2.`id` = tne_2.`taxon_id`
LEFT JOIN `scientific_name_element` AS `sne_2` ON
    tne_2.`scientific_name_element_id` = sne_2.`id`
LEFT JOIN `taxon` AS `t_3` ON
    tne_2.`parent_id` = t_3.`id`
LEFT JOIN `taxon_name_element` AS `tne_3` ON
    t_3.`id` = tne_3.`taxon_id`
LEFT JOIN `scientific_name_element` AS `sne_3` ON
    tne_3.`scientific_name_element_id` = sne_3.`id`

LEFT JOIN `taxon_name_element` AS `children` ON
    t_1.`id` = children.`parent_id`

LEFT JOIN `uri_to_taxon` AS `utt` ON
    t_1.`id` = utt.`taxon_id`
LEFT JOIN `uri` AS `uri` ON
    utt.`uri_id` = uri.`id`

WHERE t_1.`id` IS NOT NULL
GROUP BY t_1.`id`;