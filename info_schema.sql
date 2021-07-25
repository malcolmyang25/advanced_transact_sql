--list the table(view) and column of schema
SELECT tab.table_catalog,
       tab.table_schema,
       tab.table_type,
       tab.table_name,
       col.column_name,
       col.ordinal_position,
       col.data_type
FROM datacap.INFORMATION_SCHEMA.COLUMNS col
LEFT JOIN datacap.INFORMATION_SCHEMA.tables tab
ON col.table_name=tab.table_name;
