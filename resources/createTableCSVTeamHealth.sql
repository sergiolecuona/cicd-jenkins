CREATE EXTERNAL TABLE IF NOT EXISTS fillesagiledb.csvteamhealth (
  `TEAMHEALTH` string,
  `Q319` decimal(10,2),
  `Q219` decimal(10,2),
  `OBJ` decimal(10,2) 
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = ';',
  'field.delim' = ';'
) LOCATION 's3://files-agile/'
TBLPROPERTIES ('has_encrypted_data'='false',
'skip.header.line.count'='1');