/*
Partitioning Tables
Partitioning logically splits up a table into smaller tables according to the partition column(s). So rows with the same partition key are stored in the same physical location.

There are three types of partitioning available:

Range
List
Hash
To create a partitioned table, you need to:

Choose a partition method
State the partition columns
Define the initial partitions
The following statements create one table for each partitioning type:

*/

create table toys_range (
  toy_name varchar2(100)
) partition by range ( toy_name ) (
  partition p0 values less than ('b'),
  partition p1 values less than ('c')
);

create table toys_list (
  toy_name varchar2(100)
) partition by list ( toy_name ) (
  partition p0 values ('Sir Stripypants'),
  partition p1 values ('Miss Snuggles')
);

create table toys_hash (
  toy_name varchar2(100)
) partition by hash ( toy_name ) partitions 4;



--By default a partitioned table is heap-organized. But you can combine partitioning with some other properties. 
--For example, you can have a partitioned IOT:

create table toys_part_iot (
  toy_id   integer primary key,
  toy_name varchar2(100)
) organization index 
  partition by hash ( toy_id ) partitions 4;
  
  --The database sets the partitioned column of *_tables to YES if the table is partitioned. You can view details about the partitions in the *_tab_partitions tables:
  
  
 select table_name, partitioned 
from   user_tables
where  table_name in ( 'TOYS_HASH', 'TOYS_LIST', 'TOYS_RANGE', 'TOYS_PART_IOT' );

select table_name, partition_name
from   user_tab_partitions;




