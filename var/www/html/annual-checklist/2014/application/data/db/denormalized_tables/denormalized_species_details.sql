INSERT INTO `denormalized_species_details`
(
`taxon_id`,
`kingdom_id`,
`kingdom_name`,
`phylum_id`,
`phylum_name`,
`class_id`,
`class_name`,
`order_id`,
`order_name`,
`superfamily_id`,
`superfamily_name`,
`family_id`,
`family_name`,
`genus_id`,
`genus_name`,
`subgenus_id`,
`subgenus_name`,
`species_id`,
`species_name`,
`infraspecies_id`,
`infraspecies_name`,
`infraspecific_marker`,
`author`,
`status`,
`additional_data`,
`source_database_id`,
`source_database_short_name`,
`source_database_release_date`,
`scrutiny_date`,
`specialist`
)

SELECT
    td.`taxon_id` AS taxon_id,
    
IF(t1.`taxonomic_rank_id` = 54, t1.`id`,
 IF(t2.`taxonomic_rank_id` = 54, t2.`id`,
  IF(t3.`taxonomic_rank_id` = 54, t3.`id`,
   IF(t4.`taxonomic_rank_id` = 54, t4.`id`,
    IF(t5.`taxonomic_rank_id` = 54, t5.`id`,
     IF(t6.`taxonomic_rank_id` = 54, t6.`id`,
      IF(t7.`taxonomic_rank_id` = 54, t7.`id`,
       IF(t8.`taxonomic_rank_id` = 54, t8.`id`,
        IF(t9.`taxonomic_rank_id` = 54, t9.`id`,
         IF(t10.`taxonomic_rank_id` = 54, t10.`id`,
          IF(t11.`taxonomic_rank_id` = 54, t11.`id`,
           IF(t12.`taxonomic_rank_id` = 54, t12.`id`,
            IF(t13.`taxonomic_rank_id` = 54, t13.`id`,
             IF(t14.`taxonomic_rank_id` = 54, t14.`id`,
              IF(t15.`taxonomic_rank_id` = 54, t15.`id`,""
))))))))))))))) AS kingdom_id,
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
))))))))))))))) AS kingdom_name,
IF(t1.`taxonomic_rank_id` = 76, t1.`id`,
 IF(t2.`taxonomic_rank_id` = 76, t2.`id`,
  IF(t3.`taxonomic_rank_id` = 76, t3.`id`,
   IF(t4.`taxonomic_rank_id` = 76, t4.`id`,
    IF(t5.`taxonomic_rank_id` = 76, t5.`id`,
     IF(t6.`taxonomic_rank_id` = 76, t6.`id`,
      IF(t7.`taxonomic_rank_id` = 76, t7.`id`,
       IF(t8.`taxonomic_rank_id` = 76, t8.`id`,
        IF(t9.`taxonomic_rank_id` = 76, t9.`id`,
         IF(t10.`taxonomic_rank_id` = 76, t10.`id`,
          IF(t11.`taxonomic_rank_id` = 76, t11.`id`,
           IF(t12.`taxonomic_rank_id` = 76, t12.`id`,
            IF(t13.`taxonomic_rank_id` = 76, t13.`id`,
             IF(t14.`taxonomic_rank_id` = 76, t14.`id`,
              IF(t15.`taxonomic_rank_id` = 76, t15.`id`,""
))))))))))))))) AS phylum_id,
IF(t1.`taxonomic_rank_id` = 76, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 76, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 76, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 76, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 76, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 76, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 76, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 76, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 76, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 76, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 76, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 76, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 76, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 76, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 76, sne15.`name_element`,""
))))))))))))))) AS phylum_name,
IF(t1.`taxonomic_rank_id` = 6, t1.`id`,
 IF(t2.`taxonomic_rank_id` = 6, t2.`id`,
  IF(t3.`taxonomic_rank_id` = 6, t3.`id`,
   IF(t4.`taxonomic_rank_id` = 6, t4.`id`,
    IF(t5.`taxonomic_rank_id` = 6, t5.`id`,
     IF(t6.`taxonomic_rank_id` = 6, t6.`id`,
      IF(t7.`taxonomic_rank_id` = 6, t7.`id`,
       IF(t8.`taxonomic_rank_id` = 6, t8.`id`,
        IF(t9.`taxonomic_rank_id` = 6, t9.`id`,
         IF(t10.`taxonomic_rank_id` = 6, t10.`id`,
          IF(t11.`taxonomic_rank_id` = 6, t11.`id`,
           IF(t12.`taxonomic_rank_id` = 6, t12.`id`,
            IF(t13.`taxonomic_rank_id` = 6, t13.`id`,
             IF(t14.`taxonomic_rank_id` = 6, t14.`id`,
              IF(t15.`taxonomic_rank_id` = 6, t15.`id`,""
))))))))))))))) AS class_id,
IF(t1.`taxonomic_rank_id` = 6, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 6, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 6, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 6, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 6, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 6, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 6, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 6, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 6, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 6, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 6, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 6, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 6, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 6, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 6, sne15.`name_element`,""
))))))))))))))) AS class_name,
IF(t1.`taxonomic_rank_id` = 72, t1.`id`,
 IF(t2.`taxonomic_rank_id` = 72, t2.`id`,
  IF(t3.`taxonomic_rank_id` = 72, t3.`id`,
   IF(t4.`taxonomic_rank_id` = 72, t4.`id`,
    IF(t5.`taxonomic_rank_id` = 72, t5.`id`,
     IF(t6.`taxonomic_rank_id` = 72, t6.`id`,
      IF(t7.`taxonomic_rank_id` = 72, t7.`id`,
       IF(t8.`taxonomic_rank_id` = 72, t8.`id`,
        IF(t9.`taxonomic_rank_id` = 72, t9.`id`,
         IF(t10.`taxonomic_rank_id` = 72, t10.`id`,
          IF(t11.`taxonomic_rank_id` = 72, t11.`id`,
           IF(t12.`taxonomic_rank_id` = 72, t12.`id`,
            IF(t13.`taxonomic_rank_id` = 72, t13.`id`,
             IF(t14.`taxonomic_rank_id` = 72, t14.`id`,
              IF(t15.`taxonomic_rank_id` = 72, t15.`id`,""
))))))))))))))) AS order_id,
IF(t1.`taxonomic_rank_id` = 72, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 72, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 72, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 72, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 72, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 72, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 72, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 72, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 72, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 72, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 72, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 72, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 72, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 72, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 72, sne15.`name_element`,""
))))))))))))))) AS order_name,
IF(t1.`taxonomic_rank_id` = 112, t1.`id`,
 IF(t2.`taxonomic_rank_id` = 112, t2.`id`,
  IF(t3.`taxonomic_rank_id` = 112, t3.`id`,
   IF(t4.`taxonomic_rank_id` = 112, t4.`id`,
    IF(t5.`taxonomic_rank_id` = 112, t5.`id`,
     IF(t6.`taxonomic_rank_id` = 112, t6.`id`,
      IF(t7.`taxonomic_rank_id` = 112, t7.`id`,
       IF(t8.`taxonomic_rank_id` = 112, t8.`id`,
        IF(t9.`taxonomic_rank_id` = 112, t9.`id`,
         IF(t10.`taxonomic_rank_id` = 112, t10.`id`,
          IF(t11.`taxonomic_rank_id` = 112, t11.`id`,
           IF(t12.`taxonomic_rank_id` = 112, t12.`id`,
            IF(t13.`taxonomic_rank_id` = 112, t13.`id`,
             IF(t14.`taxonomic_rank_id` = 112, t14.`id`,
              IF(t15.`taxonomic_rank_id` = 112, t15.`id`,""
))))))))))))))) AS superfamily_id,
IF(t1.`taxonomic_rank_id` = 112, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 112, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 112, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 112, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 112, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 112, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 112, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 112, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 112, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 112, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 112, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 112, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 112, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 112, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 112, sne15.`name_element`,""
))))))))))))))) AS superfamily_name,
IF(t1.`taxonomic_rank_id` = 17, t1.`id`,
 IF(t2.`taxonomic_rank_id` = 17, t2.`id`,
  IF(t3.`taxonomic_rank_id` = 17, t3.`id`,
   IF(t4.`taxonomic_rank_id` = 17, t4.`id`,
    IF(t5.`taxonomic_rank_id` = 17, t5.`id`,
     IF(t6.`taxonomic_rank_id` = 17, t6.`id`,
      IF(t7.`taxonomic_rank_id` = 17, t7.`id`,
       IF(t8.`taxonomic_rank_id` = 17, t8.`id`,
        IF(t9.`taxonomic_rank_id` = 17, t9.`id`,
         IF(t10.`taxonomic_rank_id` = 17, t10.`id`,
          IF(t11.`taxonomic_rank_id` = 17, t11.`id`,
           IF(t12.`taxonomic_rank_id` = 17, t12.`id`,
            IF(t13.`taxonomic_rank_id` = 17, t13.`id`,
             IF(t14.`taxonomic_rank_id` = 17, t14.`id`,
              IF(t15.`taxonomic_rank_id` = 17, t15.`id`,""
))))))))))))))) AS family_id,
IF(t1.`taxonomic_rank_id` = 17, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 17, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 17, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 17, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 17, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 17, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 17, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 17, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 17, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 17, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 17, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 17, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 17, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 17, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 17, sne15.`name_element`,""
))))))))))))))) AS family_name,
IF(t1.`taxonomic_rank_id` = 20, t1.`id`,
 IF(t2.`taxonomic_rank_id` = 20, t2.`id`,
  IF(t3.`taxonomic_rank_id` = 20, t3.`id`,
   IF(t4.`taxonomic_rank_id` = 20, t4.`id`,
    IF(t5.`taxonomic_rank_id` = 20, t5.`id`,
     IF(t6.`taxonomic_rank_id` = 20, t6.`id`,
      IF(t7.`taxonomic_rank_id` = 20, t7.`id`,
       IF(t8.`taxonomic_rank_id` = 20, t8.`id`,
        IF(t9.`taxonomic_rank_id` = 20, t9.`id`,
         IF(t10.`taxonomic_rank_id` = 20, t10.`id`,
          IF(t11.`taxonomic_rank_id` = 20, t11.`id`,
           IF(t12.`taxonomic_rank_id` = 20, t12.`id`,
            IF(t13.`taxonomic_rank_id` = 20, t13.`id`,
             IF(t14.`taxonomic_rank_id` = 20, t14.`id`,
              IF(t15.`taxonomic_rank_id` = 20, t15.`id`,""
))))))))))))))) AS genus_id,
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
))))))))))))))) AS genus_name,
IF(t1.`taxonomic_rank_id` = 96, t1.`id`,
 IF(t2.`taxonomic_rank_id` = 96, t2.`id`,
  IF(t3.`taxonomic_rank_id` = 96, t3.`id`,
   IF(t4.`taxonomic_rank_id` = 96, t4.`id`,
    IF(t5.`taxonomic_rank_id` = 96, t5.`id`,
     IF(t6.`taxonomic_rank_id` = 96, t6.`id`,
      IF(t7.`taxonomic_rank_id` = 96, t7.`id`,
       IF(t8.`taxonomic_rank_id` = 96, t8.`id`,
        IF(t9.`taxonomic_rank_id` = 96, t9.`id`,
         IF(t10.`taxonomic_rank_id` = 96, t10.`id`,
          IF(t11.`taxonomic_rank_id` = 96, t11.`id`,
           IF(t12.`taxonomic_rank_id` = 96, t12.`id`,
            IF(t13.`taxonomic_rank_id` = 96, t13.`id`,
             IF(t14.`taxonomic_rank_id` = 96, t14.`id`,
              IF(t15.`taxonomic_rank_id` = 96, t15.`id`,""
))))))))))))))) AS subgenus_id,
IF(t1.`taxonomic_rank_id` = 96, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 96, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 96, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 96, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 96, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 96, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 96, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 96, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 96, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 96, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 96, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 96, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 96, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 96, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 96, sne15.`name_element`,""
))))))))))))))) AS subgenus_name,
IF(t1.`taxonomic_rank_id` = 83, t1.`id`,
 IF(t2.`taxonomic_rank_id` = 83, t2.`id`,
  IF(t3.`taxonomic_rank_id` = 83, t3.`id`,
   IF(t4.`taxonomic_rank_id` = 83, t4.`id`,
    IF(t5.`taxonomic_rank_id` = 83, t5.`id`,
     IF(t6.`taxonomic_rank_id` = 83, t6.`id`,
      IF(t7.`taxonomic_rank_id` = 83, t7.`id`,
       IF(t8.`taxonomic_rank_id` = 83, t8.`id`,
        IF(t9.`taxonomic_rank_id` = 83, t9.`id`,
         IF(t10.`taxonomic_rank_id` = 83, t10.`id`,
          IF(t11.`taxonomic_rank_id` = 83, t11.`id`,
           IF(t12.`taxonomic_rank_id` = 83, t12.`id`,
            IF(t13.`taxonomic_rank_id` = 83, t13.`id`,
             IF(t14.`taxonomic_rank_id` = 83, t14.`id`,
              IF(t15.`taxonomic_rank_id` = 83, t15.`id`,""
))))))))))))))) AS species_id,
IF(t1.`taxonomic_rank_id` = 83, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 83, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 83, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 83, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 83, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 83, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 83, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 83, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 83, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 83, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 83, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 83, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 83, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 83, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 83, sne15.`name_element`,""
))))))))))))))) AS species_name,
IF(t1.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t1.`id`,
 IF(t2.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t2.`id`,
  IF(t3.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t3.`id`,
   IF(t4.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t4.`id`,
    IF(t5.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t5.`id`,
     IF(t6.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t6.`id`,
      IF(t7.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t7.`id`,
       IF(t8.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t8.`id`,
        IF(t9.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t9.`id`,
         IF(t10.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t10.`id`,
          IF(t11.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t11.`id`,
           IF(t12.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t12.`id`,
            IF(t13.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t13.`id`,
             IF(t14.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t14.`id`,
              IF(t15.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), t15.`id`,""
))))))))))))))) AS infraspecies_id,
IF(t1.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne15.`name_element`,""
))))))))))))))) AS infraspecies_name,
    "" AS infraspecific_marker,
    aus.`string` AS author,
    td.`scientific_name_status_id` AS status,
    td.`additional_data` AS additional_data,
    db.`id` AS source_database_id,
    db.`abbreviated_name` AS source_database_short_name,
    db.`release_date` AS source_database_release_date,
    sc.`scrutiny_date` AS scrutiny_date,
    sp.`name` AS specialist
    
FROM `taxon_detail` AS td

LEFT JOIN `author_string` AS aus ON
    td.`author_string_id` = aus.`id`
    
LEFT JOIN `scrutiny` AS sc ON
    td.`scrutiny_id` = sc.`id`
    
LEFT JOIN `specialist` AS sp ON
    sc.`specialist_id` = sp.`id`
    
RIGHT JOIN `taxon` AS t1 ON
    td.`taxon_id` = t1.`id`

RIGHT JOIN `taxon_name_element` AS tne1 ON
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
    
RIGHT JOIN `source_database` AS db ON
    t1.`source_database_id` = db.`id`
    
WHERE td.`taxon_id` IS NOT NULL

;

UPDATE `denormalized_species_details` AS dss SET
`kingdom_lsid` = (SELECT `resource_identifier` AS kingdom_lsid
    FROM `uri` AS kingdom_uri, `uri_to_taxon` AS kingdom_utt
    WHERE kingdom_uri.`uri_scheme_id` = 9 AND
    kingdom_uri.`id` = kingdom_utt.`uri_id` AND
    kingdom_utt.`taxon_id` = dss.kingdom_id),
`phylum_lsid` = (SELECT `resource_identifier` AS phylum_lsid
    FROM `uri` AS phylum_uri, `uri_to_taxon` AS phylum_utt
    WHERE phylum_uri.`uri_scheme_id` = 9 AND
    phylum_uri.`id` = phylum_utt.`uri_id` AND
    phylum_utt.`taxon_id` = dss.phylum_id),
`class_lsid` = (SELECT `resource_identifier` AS class_lsid
    FROM `uri` AS class_uri, `uri_to_taxon` AS class_utt
    WHERE class_uri.`uri_scheme_id` = 9 AND
    class_uri.`id` = class_utt.`uri_id` AND
    class_utt.`taxon_id` = dss.class_id),
`order_lsid` = (SELECT `resource_identifier` AS order_lsid
    FROM `uri` AS order_uri, `uri_to_taxon` AS order_utt
    WHERE order_uri.`uri_scheme_id` = 9 AND
    order_uri.`id` = order_utt.`uri_id` AND
    order_utt.`taxon_id` = dss.order_id),
`superfamily_lsid` = (SELECT `resource_identifier` AS superfamily_lsid
    FROM `uri` AS superfamily_uri, `uri_to_taxon` AS superfamily_utt
    WHERE superfamily_uri.`uri_scheme_id` = 9 AND
    superfamily_uri.`id` = superfamily_utt.`uri_id` AND
    superfamily_utt.`taxon_id` = dss.superfamily_id),
`family_lsid` = (SELECT `resource_identifier` AS family_lsid
    FROM `uri` AS family_uri, `uri_to_taxon` AS family_utt
    WHERE family_uri.`uri_scheme_id` = 9 AND
    family_uri.`id` = family_utt.`uri_id` AND
    family_utt.`taxon_id` = dss.family_id),
`genus_lsid` = (SELECT `resource_identifier` AS genus_lsid
    FROM `uri` AS genus_uri, `uri_to_taxon` AS genus_utt
    WHERE genus_uri.`uri_scheme_id` = 9 AND
    genus_uri.`id` = genus_utt.`uri_id` AND
    genus_utt.`taxon_id` = dss.genus_id),
`subgenus_lsid` = (SELECT `resource_identifier` AS subgenus_lsid
    FROM `uri` AS subgenus_uri, `uri_to_taxon` AS subgenus_utt
    WHERE subgenus_uri.`uri_scheme_id` = 9 AND
    subgenus_uri.`id` = subgenus_utt.`uri_id` AND
    subgenus_utt.`taxon_id` = dss.subgenus_id),
`species_lsid` = (SELECT `resource_identifier` AS species_lsid
    FROM `uri` AS species_uri, `uri_to_taxon` AS species_utt
    WHERE species_uri.`uri_scheme_id` = 9 AND
    species_uri.`id` = species_utt.`uri_id` AND
    species_utt.`taxon_id` = dss.species_id),
`infraspecies_lsid` = (SELECT `resource_identifier` AS infraspecies_lsid
    FROM `uri` AS infraspecies_uri, `uri_to_taxon` AS infraspecies_utt
    WHERE infraspecies_uri.`uri_scheme_id` = 9 AND
    infraspecies_uri.`id` = infraspecies_utt.`uri_id` AND
    infraspecies_utt.`taxon_id` = dss.infraspecies_id)
    
;