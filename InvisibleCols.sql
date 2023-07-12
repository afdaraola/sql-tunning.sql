/*

Some miscellaneous facts about invisible columns include the following.

Virtual columns can be made invisible.
A table can be partitioned by an invisible column, either during or after table creation.
External, cluster and temporary tables can not have invisible columns.
User-defined types can not contain invisible attributes.
You can not make system generated hidden columns visible.


*/


DROP TABLE tab1 PURGE;

CREATE TABLE tab1 (
  a NUMBER,
  b NUMBER,
  c NUMBER INVISIBLE
);

COLUMN column_name FORMAT A15

SELECT column_id,
       column_name,
       hidden_column
FROM   user_tab_cols
WHERE  table_name = 'TAB1'
ORDER BY column_id;

 COLUMN_ID COLUMN_NAME	   HID
---------- --------------- ---
	 1 A		   NO
	 2 B		   NO
	   C		   YES
