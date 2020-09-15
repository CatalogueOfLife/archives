INSERT INTO `denormalized_search_distribution` (`distribution`,`accepted_species_id`,`name`,`author`,`rank`,`kingdom`,`source_database_id`,`db_name`)

SELECT

rg.name AS distribution,
ds.taxon_detail_id AS accepted_species_id,
CONCAT(
IF(t1.`taxonomic_rank_id` = 20, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 20, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 20, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 20, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 20, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 20, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 20, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 20, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 20, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 20, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 20, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 20, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 20, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 20, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 20, sne15.`name_element`,""
))))))))))))))),
IF(t1.`taxonomic_rank_id` = 96, CONCAT(" (",sne1.`name_element`,")"),
 IF(t2.`taxonomic_rank_id` = 96, CONCAT(" (",sne2.`name_element`,")"),
  IF(t3.`taxonomic_rank_id` = 96, CONCAT(" (",sne3.`name_element`,")"),
   IF(t4.`taxonomic_rank_id` = 96, CONCAT(" (",sne4.`name_element`,")"),
    IF(t5.`taxonomic_rank_id` = 96, CONCAT(" (",sne5.`name_element`,")"),
     IF(t6.`taxonomic_rank_id` = 96, CONCAT(" (",sne6.`name_element`,")"),
      IF(t7.`taxonomic_rank_id` = 96, CONCAT(" (",sne7.`name_element`,")"),
       IF(t8.`taxonomic_rank_id` = 96, CONCAT(" (",sne8.`name_element`,")"),
        IF(t9.`taxonomic_rank_id` = 96, CONCAT(" (",sne9.`name_element`,")"),
         IF(t10.`taxonomic_rank_id` = 96, CONCAT(" (",sne10.`name_element`,")"),
          IF(t11.`taxonomic_rank_id` = 96, CONCAT(" (",sne11.`name_element`,")"),
           IF(t12.`taxonomic_rank_id` = 96, CONCAT(" (",sne12.`name_element`,")"),
            IF(t13.`taxonomic_rank_id` = 96, CONCAT(" (",sne13.`name_element`,")"),
             IF(t14.`taxonomic_rank_id` = 96, CONCAT(" (",sne14.`name_element`,")"),
              IF(t15.`taxonomic_rank_id` = 96, CONCAT(" (",sne15.`name_element`,")"),""
))))))))))))))),
IF(t1.`taxonomic_rank_id` = 83, CONCAT(" ",sne1.`name_element`),
 IF(t2.`taxonomic_rank_id` = 83, CONCAT(" ",sne2.`name_element`),
  IF(t3.`taxonomic_rank_id` = 83, CONCAT(" ",sne3.`name_element`),
   IF(t4.`taxonomic_rank_id` = 83, CONCAT(" ",sne4.`name_element`),
    IF(t5.`taxonomic_rank_id` = 83, CONCAT(" ",sne5.`name_element`),
     IF(t6.`taxonomic_rank_id` = 83, CONCAT(" ",sne6.`name_element`),
      IF(t7.`taxonomic_rank_id` = 83, CONCAT(" ",sne7.`name_element`),
       IF(t8.`taxonomic_rank_id` = 83, CONCAT(" ",sne8.`name_element`),
        IF(t9.`taxonomic_rank_id` = 83, CONCAT(" ",sne9.`name_element`),
         IF(t10.`taxonomic_rank_id` = 83, CONCAT(" ",sne10.`name_element`),
          IF(t11.`taxonomic_rank_id` = 83, CONCAT(" ",sne11.`name_element`),
           IF(t12.`taxonomic_rank_id` = 83, CONCAT(" ",sne12.`name_element`),
            IF(t13.`taxonomic_rank_id` = 83, CONCAT(" ",sne13.`name_element`),
             IF(t14.`taxonomic_rank_id` = 83, CONCAT(" ",sne14.`name_element`),
              IF(t15.`taxonomic_rank_id` = 83, CONCAT(" ",sne15.`name_element`),""
))))))))))))))),
IF(t1.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne1.`name_element`),
 IF(t2.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne2.`name_element`),
  IF(t3.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne3.`name_element`),
   IF(t4.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne4.`name_element`),
    IF(t5.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne5.`name_element`),
     IF(t6.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne6.`name_element`),
      IF(t7.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne7.`name_element`),
       IF(t8.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne8.`name_element`),
        IF(t9.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne9.`name_element`),
         IF(t10.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne10.`name_element`),
          IF(t11.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne11.`name_element`),
           IF(t12.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne12.`name_element`),
            IF(t13.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne13.`name_element`),
             IF(t14.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne14.`name_element`),
              IF(t15.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne15.`name_element`),""
)))))))))))))))
) AS name,
aus.string AS author,
t1.`taxonomic_rank_id` AS rank,
IF(t1.`taxonomic_rank_id` = 54, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 54, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 54, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 54, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 54, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 54, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 54, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 54, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 54, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 54, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 54, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 54, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 54, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 54, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 54, sne15.`name_element`,""
))))))))))))))) AS kingdom,
t1.source_database_id AS source_database_id,
sd.abbreviated_name AS db_name

FROM `distribution` AS ds

LEFT JOIN `region` AS rg ON
ds.region_id = rg.id

LEFT JOIN `taxon_detail` AS td ON
ds.taxon_detail_id = td.taxon_id

LEFT JOIN `author_string` AS aus ON
td.author_string_id = aus.id

LEFT JOIN `taxon` AS t1 ON
td.taxon_id = t1.id

LEFT JOIN `source_database` AS sd ON
t1.source_database_id = sd.id

LEFT JOIN `taxon_name_element` AS tne1 ON
t1.`id` = tne1.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne1 ON
tne1.`scientific_name_element_id` = sne1.`id`

LEFT JOIN `taxon_name_element` AS tne2 ON
tne1.`parent_id` = tne2.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne2 ON
tne2.`scientific_name_element_id` = sne2.`id`

LEFT JOIN `taxon` AS t2 ON
tne2.`taxon_id` = t2.`id`

LEFT JOIN `taxon_name_element` AS tne3 ON
tne2.`parent_id` = tne3.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne3 ON
tne3.`scientific_name_element_id` = sne3.`id`

LEFT JOIN `taxon` AS t3 ON
tne3.`taxon_id` = t3.`id`

LEFT JOIN `taxon_name_element` AS tne4 ON
tne3.`parent_id` = tne4.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne4 ON
tne4.`scientific_name_element_id` = sne4.`id`

LEFT JOIN `taxon` AS t4 ON
tne4.`taxon_id` = t4.`id`

LEFT JOIN `taxon_name_element` AS tne5 ON
tne4.`parent_id` = tne5.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne5 ON
tne5.`scientific_name_element_id` = sne5.`id`

LEFT JOIN `taxon` AS t5 ON
tne5.`taxon_id` = t5.`id`

LEFT JOIN `taxon_name_element` AS tne6 ON
tne5.`parent_id` = tne6.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne6 ON
tne6.`scientific_name_element_id` = sne6.`id`

LEFT JOIN `taxon` AS t6 ON
tne6.`taxon_id` = t6.`id`

LEFT JOIN `taxon_name_element` AS tne7 ON
tne6.`parent_id` = tne7.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne7 ON
tne7.`scientific_name_element_id` = sne7.`id`

LEFT JOIN `taxon` AS t7 ON
tne7.`taxon_id` = t7.`id`

LEFT JOIN `taxon_name_element` AS tne8 ON
tne7.`parent_id` = tne8.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne8 ON
tne8.`scientific_name_element_id` = sne8.`id`

LEFT JOIN `taxon` AS t8 ON
tne8.`taxon_id` = t8.`id`

LEFT JOIN `taxon_name_element` AS tne9 ON
tne8.`parent_id` = tne9.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne9 ON
tne9.`scientific_name_element_id` = sne9.`id`

LEFT JOIN `taxon` AS t9 ON
tne9.`taxon_id` = t9.`id`

LEFT JOIN `taxon_name_element` AS tne10 ON
tne9.`parent_id` = tne10.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne10 ON
tne10.`scientific_name_element_id` = sne10.`id`

LEFT JOIN `taxon` AS t10 ON
tne10.`taxon_id` = t10.`id`

LEFT JOIN `taxon_name_element` AS tne11 ON
tne10.`parent_id` = tne11.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne11 ON
tne11.`scientific_name_element_id` = sne11.`id`

LEFT JOIN `taxon` AS t11 ON
tne11.`taxon_id` = t11.`id`

LEFT JOIN `taxon_name_element` AS tne12 ON
tne11.`parent_id` = tne12.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne12 ON
tne12.`scientific_name_element_id` = sne12.`id`

LEFT JOIN `taxon` AS t12 ON
tne12.`taxon_id` = t12.`id`

LEFT JOIN `taxon_name_element` AS tne13 ON
tne12.`parent_id` = tne13.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne13 ON
tne13.`scientific_name_element_id` = sne13.`id`

LEFT JOIN `taxon` AS t13 ON
tne13.`taxon_id` = t13.`id`

LEFT JOIN `taxon_name_element` AS tne14 ON
tne13.`parent_id` = tne14.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne14 ON
tne14.`scientific_name_element_id` = sne14.`id`

LEFT JOIN `taxon` AS t14 ON
tne14.`taxon_id` = t14.`id`

LEFT JOIN `taxon_name_element` AS tne15 ON
tne14.`parent_id` = tne15.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne15 ON
tne15.`scientific_name_element_id` = sne15.`id`

LEFT JOIN `taxon` AS t15 ON
tne15.`taxon_id` = t15.`id`

;

INSERT INTO `denormalized_search_distribution` (`distribution`,`accepted_species_id`,`name`,`author`,`rank`,`kingdom`,`source_database_id`,`db_name`)

SELECT

ds.free_text AS distribution,
ds.taxon_detail_id AS accepted_species_id,
CONCAT(
IF(t1.`taxonomic_rank_id` = 20, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 20, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 20, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 20, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 20, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 20, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 20, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 20, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 20, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 20, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 20, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 20, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 20, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 20, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 20, sne15.`name_element`,""
))))))))))))))),
IF(t1.`taxonomic_rank_id` = 96, CONCAT(" (",sne1.`name_element`,")"),
 IF(t2.`taxonomic_rank_id` = 96, CONCAT(" (",sne2.`name_element`,")"),
  IF(t3.`taxonomic_rank_id` = 96, CONCAT(" (",sne3.`name_element`,")"),
   IF(t4.`taxonomic_rank_id` = 96, CONCAT(" (",sne4.`name_element`,")"),
    IF(t5.`taxonomic_rank_id` = 96, CONCAT(" (",sne5.`name_element`,")"),
     IF(t6.`taxonomic_rank_id` = 96, CONCAT(" (",sne6.`name_element`,")"),
      IF(t7.`taxonomic_rank_id` = 96, CONCAT(" (",sne7.`name_element`,")"),
       IF(t8.`taxonomic_rank_id` = 96, CONCAT(" (",sne8.`name_element`,")"),
        IF(t9.`taxonomic_rank_id` = 96, CONCAT(" (",sne9.`name_element`,")"),
         IF(t10.`taxonomic_rank_id` = 96, CONCAT(" (",sne10.`name_element`,")"),
          IF(t11.`taxonomic_rank_id` = 96, CONCAT(" (",sne11.`name_element`,")"),
           IF(t12.`taxonomic_rank_id` = 96, CONCAT(" (",sne12.`name_element`,")"),
            IF(t13.`taxonomic_rank_id` = 96, CONCAT(" (",sne13.`name_element`,")"),
             IF(t14.`taxonomic_rank_id` = 96, CONCAT(" (",sne14.`name_element`,")"),
              IF(t15.`taxonomic_rank_id` = 96, CONCAT(" (",sne15.`name_element`,")"),""
))))))))))))))),
IF(t1.`taxonomic_rank_id` = 83, CONCAT(" ",sne1.`name_element`),
 IF(t2.`taxonomic_rank_id` = 83, CONCAT(" ",sne2.`name_element`),
  IF(t3.`taxonomic_rank_id` = 83, CONCAT(" ",sne3.`name_element`),
   IF(t4.`taxonomic_rank_id` = 83, CONCAT(" ",sne4.`name_element`),
    IF(t5.`taxonomic_rank_id` = 83, CONCAT(" ",sne5.`name_element`),
     IF(t6.`taxonomic_rank_id` = 83, CONCAT(" ",sne6.`name_element`),
      IF(t7.`taxonomic_rank_id` = 83, CONCAT(" ",sne7.`name_element`),
       IF(t8.`taxonomic_rank_id` = 83, CONCAT(" ",sne8.`name_element`),
        IF(t9.`taxonomic_rank_id` = 83, CONCAT(" ",sne9.`name_element`),
         IF(t10.`taxonomic_rank_id` = 83, CONCAT(" ",sne10.`name_element`),
          IF(t11.`taxonomic_rank_id` = 83, CONCAT(" ",sne11.`name_element`),
           IF(t12.`taxonomic_rank_id` = 83, CONCAT(" ",sne12.`name_element`),
            IF(t13.`taxonomic_rank_id` = 83, CONCAT(" ",sne13.`name_element`),
             IF(t14.`taxonomic_rank_id` = 83, CONCAT(" ",sne14.`name_element`),
              IF(t15.`taxonomic_rank_id` = 83, CONCAT(" ",sne15.`name_element`),""
))))))))))))))),
IF(t1.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne1.`name_element`),
 IF(t2.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne2.`name_element`),
  IF(t3.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne3.`name_element`),
   IF(t4.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne4.`name_element`),
    IF(t5.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne5.`name_element`),
     IF(t6.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne6.`name_element`),
      IF(t7.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne7.`name_element`),
       IF(t8.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne8.`name_element`),
        IF(t9.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne9.`name_element`),
         IF(t10.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne10.`name_element`),
          IF(t11.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne11.`name_element`),
           IF(t12.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne12.`name_element`),
            IF(t13.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne13.`name_element`),
             IF(t14.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne14.`name_element`),
              IF(t15.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne15.`name_element`),""
)))))))))))))))
) AS name,
aus.string AS author,
t1.`taxonomic_rank_id` AS rank,
IF(t1.`taxonomic_rank_id` = 54, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 54, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 54, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 54, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 54, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 54, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 54, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 54, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 54, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 54, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 54, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 54, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 54, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 54, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 54, sne15.`name_element`,""
))))))))))))))) AS kingdom,
t1.source_database_id AS source_database_id,
sd.abbreviated_name AS db_name

FROM `distribution_free_text` AS ds

LEFT JOIN `taxon_detail` AS td ON
ds.taxon_detail_id = td.taxon_id

LEFT JOIN `author_string` AS aus ON
td.author_string_id = aus.id

LEFT JOIN `taxon` AS t1 ON
td.taxon_id = t1.id

LEFT JOIN `source_database` AS sd ON
t1.source_database_id = sd.id

LEFT JOIN `taxon_name_element` AS tne1 ON
t1.`id` = tne1.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne1 ON
tne1.`scientific_name_element_id` = sne1.`id`

LEFT JOIN `taxon_name_element` AS tne2 ON
tne1.`parent_id` = tne2.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne2 ON
tne2.`scientific_name_element_id` = sne2.`id`

LEFT JOIN `taxon` AS t2 ON
tne2.`taxon_id` = t2.`id`

LEFT JOIN `taxon_name_element` AS tne3 ON
tne2.`parent_id` = tne3.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne3 ON
tne3.`scientific_name_element_id` = sne3.`id`

LEFT JOIN `taxon` AS t3 ON
tne3.`taxon_id` = t3.`id`

LEFT JOIN `taxon_name_element` AS tne4 ON
tne3.`parent_id` = tne4.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne4 ON
tne4.`scientific_name_element_id` = sne4.`id`

LEFT JOIN `taxon` AS t4 ON
tne4.`taxon_id` = t4.`id`

LEFT JOIN `taxon_name_element` AS tne5 ON
tne4.`parent_id` = tne5.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne5 ON
tne5.`scientific_name_element_id` = sne5.`id`

LEFT JOIN `taxon` AS t5 ON
tne5.`taxon_id` = t5.`id`

LEFT JOIN `taxon_name_element` AS tne6 ON
tne5.`parent_id` = tne6.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne6 ON
tne6.`scientific_name_element_id` = sne6.`id`

LEFT JOIN `taxon` AS t6 ON
tne6.`taxon_id` = t6.`id`

LEFT JOIN `taxon_name_element` AS tne7 ON
tne6.`parent_id` = tne7.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne7 ON
tne7.`scientific_name_element_id` = sne7.`id`

LEFT JOIN `taxon` AS t7 ON
tne7.`taxon_id` = t7.`id`

LEFT JOIN `taxon_name_element` AS tne8 ON
tne7.`parent_id` = tne8.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne8 ON
tne8.`scientific_name_element_id` = sne8.`id`

LEFT JOIN `taxon` AS t8 ON
tne8.`taxon_id` = t8.`id`

LEFT JOIN `taxon_name_element` AS tne9 ON
tne8.`parent_id` = tne9.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne9 ON
tne9.`scientific_name_element_id` = sne9.`id`

LEFT JOIN `taxon` AS t9 ON
tne9.`taxon_id` = t9.`id`

LEFT JOIN `taxon_name_element` AS tne10 ON
tne9.`parent_id` = tne10.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne10 ON
tne10.`scientific_name_element_id` = sne10.`id`

LEFT JOIN `taxon` AS t10 ON
tne10.`taxon_id` = t10.`id`

LEFT JOIN `taxon_name_element` AS tne11 ON
tne10.`parent_id` = tne11.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne11 ON
tne11.`scientific_name_element_id` = sne11.`id`

LEFT JOIN `taxon` AS t11 ON
tne11.`taxon_id` = t11.`id`

LEFT JOIN `taxon_name_element` AS tne12 ON
tne11.`parent_id` = tne12.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne12 ON
tne12.`scientific_name_element_id` = sne12.`id`

LEFT JOIN `taxon` AS t12 ON
tne12.`taxon_id` = t12.`id`

LEFT JOIN `taxon_name_element` AS tne13 ON
tne12.`parent_id` = tne13.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne13 ON
tne13.`scientific_name_element_id` = sne13.`id`

LEFT JOIN `taxon` AS t13 ON
tne13.`taxon_id` = t13.`id`

LEFT JOIN `taxon_name_element` AS tne14 ON
tne13.`parent_id` = tne14.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne14 ON
tne14.`scientific_name_element_id` = sne14.`id`

LEFT JOIN `taxon` AS t14 ON
tne14.`taxon_id` = t14.`id`

LEFT JOIN `taxon_name_element` AS tne15 ON
tne14.`parent_id` = tne15.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne15 ON
tne15.`scientific_name_element_id` = sne15.`id`

LEFT JOIN `taxon` AS t15 ON
tne15.`taxon_id` = t15.`id`

;
