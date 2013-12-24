CREATE TABLE words (word STRING ) ROW FORMAT DELIMITED LINES TERMINATED BY '\n' STORED AS TEXTFILE;
LOAD DATA LOCAL INPATH '/Users/asharif/development/hello_hive/input' OVERWRITE INTO TABLE words;

add FILE hello_hive.py;

INSERT OVERWRITE TABLE words
SELECT
TRANSFORM (word) USING 'python hello_hive.py'
AS (word)
FROM words;

SELECT * FROM words;
