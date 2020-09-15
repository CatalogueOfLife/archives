INSERT INTO `temp_search_table` (`id`, `name_element`, `name`, `rank`, `name_status`, `name_status_suffix`, `group`, `source_database`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa
(
    SELECT -- select all the names from genus and higher
        t1.`id` AS `id`,
        sne_1.`name_element` AS `name_element`,
        sne_1.`name_element` AS `name`,
        rank.`rank` AS `rank`,
        "" AS `name_status`,
        "" AS `name_status_suffix`,
        IF (tne_1.`parent_id` IS NULL,sne_1.`name_element`,
            IF (tne_2.`parent_id` IS NULL,sne_2.`name_element`,
            IF (tne_3.`parent_id` IS NULL,sne_3.`name_element`,
            IF (tne_4.`parent_id` IS NULL,sne_4.`name_element`,
            IF (tne_5.`parent_id` IS NULL,sne_5.`name_element`,
            IF (tne_6.`parent_id` IS NULL,sne_6.`name_element`,
            IF (tne_7.`parent_id` IS NULL,sne_7.`name_element`,
            IF (tne_8.`parent_id` IS NULL,sne_8.`name_element`,
            IF (tne_9.`parent_id` IS NULL,sne_9.`name_element`,
            ""
        ))))))))) AS `kingdom`,
        db.name AS `source_database`,
        db.`id` AS `source_database_id`,
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- optional join on source databases
    LEFT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

    LEFT JOIN `taxon_name_element` AS `tne_4` ON
        tne_3.`parent_id` = tne_4.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_4` ON
        tne_4.`scientific_name_element_id` = sne_4.`id`

    LEFT JOIN `taxon_name_element` AS `tne_5` ON
        tne_4.`parent_id` = tne_5.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_5` ON
        tne_5.`scientific_name_element_id` = sne_5.`id`

    LEFT JOIN `taxon_name_element` AS `tne_6` ON
        tne_5.`parent_id` = tne_6.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_6` ON
        tne_6.`scientific_name_element_id` = sne_6.`id`

    LEFT JOIN `taxon_name_element` AS `tne_7` ON
        tne_6.`parent_id` = tne_7.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_7` ON
        tne_7.`scientific_name_element_id` = sne_7.`id`

    LEFT JOIN `taxon_name_element` AS `tne_8` ON
        tne_7.`parent_id` = tne_8.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_8` ON
        tne_8.`scientific_name_element_id` = sne_8.`id`

    LEFT JOIN `taxon_name_element` AS `tne_9` ON
        tne_8.`parent_id` = tne_9.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_9` ON
        tne_9.`scientific_name_element_id` = sne_9.`id`

    -- selecting only from genus and higher
    WHERE
        `taxonomic_rank_id` IN (54,76,6,72,17,112,20)

    -- taxonomic rank ids
    -- 54  kingdom
    -- 76  phylum
    -- 6   class
    -- 72  order
    -- 17  family
    -- 112 superfamily
    -- 20  genus
    -- 83  species
    -- 19  form
    -- 104 subspecies
    -- 49  infraspecies
    -- 129 variety
)
UNION
(
    SELECT -- select all the specific epitets from species
        t1.`id` AS `id`,
        sne_1.`name_element` AS `name_element`,
        CONCAT_WS(" ",sne_2.`name_element`,sne_1.`name_element`) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        "" AS `name_status_suffix`,
        IF (tne_1.`parent_id` IS NULL,sne_1.`name_element`,
            IF (tne_2.`parent_id` IS NULL,sne_2.`name_element`,
            IF (tne_3.`parent_id` IS NULL,sne_3.`name_element`,
            IF (tne_4.`parent_id` IS NULL,sne_4.`name_element`,
            IF (tne_5.`parent_id` IS NULL,sne_5.`name_element`,
            IF (tne_6.`parent_id` IS NULL,sne_6.`name_element`,
            IF (tne_7.`parent_id` IS NULL,sne_7.`name_element`,
            IF (tne_8.`parent_id` IS NULL,sne_8.`name_element`,
            IF (tne_9.`parent_id` IS NULL,sne_9.`name_element`,
            ""
        ))))))))) AS `kingdom`,
        db.name AS `source_database`,
        db.`id` AS `source_database_id`,
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`
    
    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

    LEFT JOIN `taxon_name_element` AS `tne_4` ON
        tne_3.`parent_id` = tne_4.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_4` ON
        tne_4.`scientific_name_element_id` = sne_4.`id`

    LEFT JOIN `taxon_name_element` AS `tne_5` ON
        tne_4.`parent_id` = tne_5.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_5` ON
        tne_5.`scientific_name_element_id` = sne_5.`id`

    LEFT JOIN `taxon_name_element` AS `tne_6` ON
        tne_5.`parent_id` = tne_6.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_6` ON
        tne_6.`scientific_name_element_id` = sne_6.`id`

    LEFT JOIN `taxon_name_element` AS `tne_7` ON
        tne_6.`parent_id` = tne_7.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_7` ON
        tne_7.`scientific_name_element_id` = sne_7.`id`

    LEFT JOIN `taxon_name_element` AS `tne_8` ON
        tne_7.`parent_id` = tne_8.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_8` ON
        tne_8.`scientific_name_element_id` = sne_8.`id`

    LEFT JOIN `taxon_name_element` AS `tne_9` ON
        tne_8.`parent_id` = tne_9.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_9` ON
        tne_9.`scientific_name_element_id` = sne_9.`id`

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`

    -- selecting only from genus and higher
    WHERE
        `taxonomic_rank_id` = 83
)
UNION
(
    SELECT -- select all the genus from species
        t1.`id` AS `id`,
        sne_2.`name_element` AS `name_element`,
        CONCAT_WS(" ",sne_2.`name_element`,sne_1.`name_element`) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        "" AS `name_status_suffix`,
        IF (tne_1.`parent_id` IS NULL,sne_1.`name_element`,
            IF (tne_2.`parent_id` IS NULL,sne_2.`name_element`,
            IF (tne_3.`parent_id` IS NULL,sne_3.`name_element`,
            IF (tne_4.`parent_id` IS NULL,sne_4.`name_element`,
            IF (tne_5.`parent_id` IS NULL,sne_5.`name_element`,
            IF (tne_6.`parent_id` IS NULL,sne_6.`name_element`,
            IF (tne_7.`parent_id` IS NULL,sne_7.`name_element`,
            IF (tne_8.`parent_id` IS NULL,sne_8.`name_element`,
            IF (tne_9.`parent_id` IS NULL,sne_9.`name_element`,
            ""
        ))))))))) AS `kingdom`,
        db.name AS `source_database`,
        db.`id` AS `source_database_id`,
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`
    
    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

    LEFT JOIN `taxon_name_element` AS `tne_4` ON
        tne_3.`parent_id` = tne_4.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_4` ON
        tne_4.`scientific_name_element_id` = sne_4.`id`

    LEFT JOIN `taxon_name_element` AS `tne_5` ON
        tne_4.`parent_id` = tne_5.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_5` ON
        tne_5.`scientific_name_element_id` = sne_5.`id`

    LEFT JOIN `taxon_name_element` AS `tne_6` ON
        tne_5.`parent_id` = tne_6.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_6` ON
        tne_6.`scientific_name_element_id` = sne_6.`id`

    LEFT JOIN `taxon_name_element` AS `tne_7` ON
        tne_6.`parent_id` = tne_7.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_7` ON
        tne_7.`scientific_name_element_id` = sne_7.`id`

    LEFT JOIN `taxon_name_element` AS `tne_8` ON
        tne_7.`parent_id` = tne_8.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_8` ON
        tne_8.`scientific_name_element_id` = sne_8.`id`

    LEFT JOIN `taxon_name_element` AS `tne_9` ON
        tne_8.`parent_id` = tne_9.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_9` ON
        tne_9.`scientific_name_element_id` = sne_9.`id`

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`

    -- selecting only from genus and higher
    WHERE
        `taxonomic_rank_id` = 83
)
UNION
(
    SELECT -- select all subspecific epitets from subspecies
        t1.`id` AS `id`,
        sne_1.`name_element` AS `name_element`,
        CONCAT_WS(" ",sne_3.`name_element`,sne_2.`name_element`,sne_1.`name_element`) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        "" AS `name_status_suffix`,
        IF (tne_1.`parent_id` IS NULL,sne_1.`name_element`,
            IF (tne_2.`parent_id` IS NULL,sne_2.`name_element`,
            IF (tne_3.`parent_id` IS NULL,sne_3.`name_element`,
            IF (tne_4.`parent_id` IS NULL,sne_4.`name_element`,
            IF (tne_5.`parent_id` IS NULL,sne_5.`name_element`,
            IF (tne_6.`parent_id` IS NULL,sne_6.`name_element`,
            IF (tne_7.`parent_id` IS NULL,sne_7.`name_element`,
            IF (tne_8.`parent_id` IS NULL,sne_8.`name_element`,
            IF (tne_9.`parent_id` IS NULL,sne_9.`name_element`,
            ""
        ))))))))) AS `kingdom`,
        db.name AS `source_database`,
        db.`id` AS `source_database_id`,
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`
    
    -- mandatory join on name elements for species
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_4` ON
        tne_3.`parent_id` = tne_4.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_4` ON
        tne_4.`scientific_name_element_id` = sne_4.`id`

    LEFT JOIN `taxon_name_element` AS `tne_5` ON
        tne_4.`parent_id` = tne_5.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_5` ON
        tne_5.`scientific_name_element_id` = sne_5.`id`

    LEFT JOIN `taxon_name_element` AS `tne_6` ON
        tne_5.`parent_id` = tne_6.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_6` ON
        tne_6.`scientific_name_element_id` = sne_6.`id`

    LEFT JOIN `taxon_name_element` AS `tne_7` ON
        tne_6.`parent_id` = tne_7.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_7` ON
        tne_7.`scientific_name_element_id` = sne_7.`id`

    LEFT JOIN `taxon_name_element` AS `tne_8` ON
        tne_7.`parent_id` = tne_8.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_8` ON
        tne_8.`scientific_name_element_id` = sne_8.`id`

    LEFT JOIN `taxon_name_element` AS `tne_9` ON
        tne_8.`parent_id` = tne_9.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_9` ON
        tne_9.`scientific_name_element_id` = sne_9.`id`

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`

    -- selecting only from genus and higher
    WHERE
        `taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,83)
)
UNION
(
    SELECT -- select all specific epitets from subspecies
        t1.`id` AS `id`,
        sne_2.`name_element` AS `name_element`,
        CONCAT_WS(" ",sne_3.`name_element`,sne_2.`name_element`,sne_1.`name_element`) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        "" AS `name_status_suffix`,
        IF (tne_1.`parent_id` IS NULL,sne_1.`name_element`,
            IF (tne_2.`parent_id` IS NULL,sne_2.`name_element`,
            IF (tne_3.`parent_id` IS NULL,sne_3.`name_element`,
            IF (tne_4.`parent_id` IS NULL,sne_4.`name_element`,
            IF (tne_5.`parent_id` IS NULL,sne_5.`name_element`,
            IF (tne_6.`parent_id` IS NULL,sne_6.`name_element`,
            IF (tne_7.`parent_id` IS NULL,sne_7.`name_element`,
            IF (tne_8.`parent_id` IS NULL,sne_8.`name_element`,
            IF (tne_9.`parent_id` IS NULL,sne_9.`name_element`,
            ""
        ))))))))) AS `kingdom`,
        db.name AS `source_database`,
        db.`id` AS `source_database_id`,
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`
    
    -- mandatory join on name elements for species
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_4` ON
        tne_3.`parent_id` = tne_4.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_4` ON
        tne_4.`scientific_name_element_id` = sne_4.`id`

    LEFT JOIN `taxon_name_element` AS `tne_5` ON
        tne_4.`parent_id` = tne_5.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_5` ON
        tne_5.`scientific_name_element_id` = sne_5.`id`

    LEFT JOIN `taxon_name_element` AS `tne_6` ON
        tne_5.`parent_id` = tne_6.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_6` ON
        tne_6.`scientific_name_element_id` = sne_6.`id`

    LEFT JOIN `taxon_name_element` AS `tne_7` ON
        tne_6.`parent_id` = tne_7.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_7` ON
        tne_7.`scientific_name_element_id` = sne_7.`id`

    LEFT JOIN `taxon_name_element` AS `tne_8` ON
        tne_7.`parent_id` = tne_8.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_8` ON
        tne_8.`scientific_name_element_id` = sne_8.`id`

    LEFT JOIN `taxon_name_element` AS `tne_9` ON
        tne_8.`parent_id` = tne_9.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_9` ON
        tne_9.`scientific_name_element_id` = sne_9.`id`

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`

    -- selecting only from genus and higher
    WHERE
        `taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,83)
)
UNION
(
    SELECT -- select all genus from subspecies
        t1.`id` AS `id`,
        sne_3.`name_element` AS `name_element`,
        CONCAT_WS(" ",sne_3.`name_element`,sne_2.`name_element`,sne_1.`name_element`) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        "" AS `name_status_suffix`,
        IF (tne_1.`parent_id` IS NULL,sne_1.`name_element`,
            IF (tne_2.`parent_id` IS NULL,sne_2.`name_element`,
            IF (tne_3.`parent_id` IS NULL,sne_3.`name_element`,
            IF (tne_4.`parent_id` IS NULL,sne_4.`name_element`,
            IF (tne_5.`parent_id` IS NULL,sne_5.`name_element`,
            IF (tne_6.`parent_id` IS NULL,sne_6.`name_element`,
            IF (tne_7.`parent_id` IS NULL,sne_7.`name_element`,
            IF (tne_8.`parent_id` IS NULL,sne_8.`name_element`,
            IF (tne_9.`parent_id` IS NULL,sne_9.`name_element`,
            ""
        ))))))))) AS `kingdom`,
        db.name AS `source_database`,
        db.`id` AS `source_database_id`,
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`
    
    -- mandatory join on name elements for species
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_4` ON
        tne_3.`parent_id` = tne_4.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_4` ON
        tne_4.`scientific_name_element_id` = sne_4.`id`

    LEFT JOIN `taxon_name_element` AS `tne_5` ON
        tne_4.`parent_id` = tne_5.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_5` ON
        tne_5.`scientific_name_element_id` = sne_5.`id`

    LEFT JOIN `taxon_name_element` AS `tne_6` ON
        tne_5.`parent_id` = tne_6.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_6` ON
        tne_6.`scientific_name_element_id` = sne_6.`id`

    LEFT JOIN `taxon_name_element` AS `tne_7` ON
        tne_6.`parent_id` = tne_7.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_7` ON
        tne_7.`scientific_name_element_id` = sne_7.`id`

    LEFT JOIN `taxon_name_element` AS `tne_8` ON
        tne_7.`parent_id` = tne_8.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_8` ON
        tne_8.`scientific_name_element_id` = sne_8.`id`

    LEFT JOIN `taxon_name_element` AS `tne_9` ON
        tne_8.`parent_id` = tne_9.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_9` ON
        tne_9.`scientific_name_element_id` = sne_9.`id`

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`

    -- selecting only from genus and higher
    WHERE
        `taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,83)
)
-- Filling synonyms
UNION
(
    SELECT -- select all genus from infraspecies
        s1.`id` AS `id`,
        sysne_1.`name_element` AS `name_element`,
        (
            SELECT
                CONCAT_WS(" ",sysne_g.`name_element`,sysne_s.`name_element`,
                    sysne_ss.`name_element`)
            FROM `synonym` AS `s2`
            RIGHT JOIN `synonym_name_element` AS `sne_g` ON
                s2.`id` = sne_g.`synonym_id` AND
                sne_g.`taxonomic_rank_id` IN (54,76,6,72,17,112,20)
            RIGHT JOIN `scientific_name_element` AS `sysne_g` ON
                sne_g.`scientific_name_element_id` = sysne_g.`id`
            LEFT JOIN `synonym_name_element` AS `sne_s` ON
                s2.`id` = sne_s.`synonym_id` AND
                sne_s.`taxonomic_rank_id` = 83
            LEFT JOIN `scientific_name_element` AS `sysne_s` ON
                sne_s.`scientific_name_element_id` = sysne_s.`id`
            LEFT JOIN `synonym_name_element` AS `sne_ss` ON
                s2.`id` = sne_ss.`synonym_id` AND
                sne_ss.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,83)
            LEFT JOIN `scientific_name_element` AS `sysne_ss` ON
                sne_ss.`scientific_name_element_id` = sysne_ss.`id`
            WHERE
                s2.`id` = s1.`id`
        ) AS `name`,
        (
            SELECT
                IF(sne_ss.`id` IS NOT NULL,
                    rank_ss.`rank`,
                    IF(sne_s.`id` IS NOT NULL,
                        rank_s.`rank`,
                        rank_g.`rank`
                    )
                )
            FROM `synonym` AS `s2`
            RIGHT JOIN `synonym_name_element` AS `sne_g` ON
                s2.`id` = sne_g.`synonym_id` AND
                sne_g.`taxonomic_rank_id` IN (54,76,6,72,17,112,20)
            RIGHT JOIN `taxonomic_rank` AS `rank_g` ON
                sne_g.`taxonomic_rank_id` = rank_g.`id`
            LEFT JOIN `synonym_name_element` AS `sne_s` ON
                s2.`id` = sne_s.`synonym_id` AND
                sne_s.`taxonomic_rank_id` = 83
            LEFT JOIN `taxonomic_rank` AS `rank_s` ON
                sne_s.`taxonomic_rank_id` = rank_s.`id`
            LEFT JOIN `synonym_name_element` AS `sne_ss` ON
                s2.`id` = sne_ss.`synonym_id` AND
                sne_ss.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,83)
            LEFT JOIN `taxonomic_rank` AS `rank_ss` ON
                sne_ss.`taxonomic_rank_id` = rank_ss.`id`
            WHERE
                s2.`id` = s1.`id`
        ) AS `rank`,
        sns1.`id` AS `name_status`,
        CONCAT_WS(" ",IF(t_3.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112),
            sne_3.`name_element`,""),sne_2.`name_element`,sne_1.`name_element`)
            AS `name_status_suffix`,
        IF (tne_1.`parent_id` IS NULL,sne_1.`name_element`,
            IF (tne_2.`parent_id` IS NULL,sne_2.`name_element`,
            IF (tne_3.`parent_id` IS NULL,sne_3.`name_element`,
            IF (tne_4.`parent_id` IS NULL,sne_4.`name_element`,
            IF (tne_5.`parent_id` IS NULL,sne_5.`name_element`,
            IF (tne_6.`parent_id` IS NULL,sne_6.`name_element`,
            IF (tne_7.`parent_id` IS NULL,sne_7.`name_element`,
            IF (tne_8.`parent_id` IS NULL,sne_8.`name_element`,
            IF (tne_9.`parent_id` IS NULL,sne_9.`name_element`,
            ""
        ))))))))) AS `kingdom`,
        db.name AS `source_database`,
        db.`id` AS `source_database_id`,
        t_1.`id` AS accepted_taxon_id
    FROM
        `synonym` AS `s1`

    RIGHT JOIN `synonym_name_element` AS `syne_1` ON
        s1.`id` = syne_1.`synonym_id`

    -- mandatory join on scientific name status
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        s1.`scientific_name_status_id` = sns1.`id`

    -- mandatory join on taxon
    RIGHT JOIN `taxon` AS `t_1` ON
        s1.`taxon_id` = t_1.`id`
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t_1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on source database
    RIGHT JOIN `source_database` AS `db` ON
        t_1.`source_database_id` = db.`id`

    -- mandatory join on scientific name elements
    RIGHT JOIN `scientific_name_element` AS `sysne_1` ON
        syne_1.`scientific_name_element_id` = sysne_1.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`
    LEFT JOIN `taxon` AS `t_2` ON
        tne_2.`taxon_id` = t_2.`id`

    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`
    LEFT JOIN `taxon` AS `t_3` ON
        tne_3.`taxon_id` = t_3.`id`

    LEFT JOIN `taxon_name_element` AS `tne_4` ON
        tne_3.`parent_id` = tne_4.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_4` ON
        tne_4.`scientific_name_element_id` = sne_4.`id`

    LEFT JOIN `taxon_name_element` AS `tne_5` ON
        tne_4.`parent_id` = tne_5.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_5` ON
        tne_5.`scientific_name_element_id` = sne_5.`id`

    LEFT JOIN `taxon_name_element` AS `tne_6` ON
        tne_5.`parent_id` = tne_6.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_6` ON
        tne_6.`scientific_name_element_id` = sne_6.`id`

    LEFT JOIN `taxon_name_element` AS `tne_7` ON
        tne_6.`parent_id` = tne_7.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_7` ON
        tne_7.`scientific_name_element_id` = sne_7.`id`

    LEFT JOIN `taxon_name_element` AS `tne_8` ON
        tne_7.`parent_id` = tne_8.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_8` ON
        tne_8.`scientific_name_element_id` = sne_8.`id`

    LEFT JOIN `taxon_name_element` AS `tne_9` ON
        tne_8.`parent_id` = tne_9.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_9` ON
        tne_9.`scientific_name_element_id` = sne_9.`id`

    WHERE s1.`id` IS NOT NULL
);