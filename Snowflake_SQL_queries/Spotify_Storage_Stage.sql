CREATE OR REPLACE STORAGE INTEGRATION S3_INT
    TYPE = EXTERNAL_STAGE
    STORGE_PROVIDER = S3
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::234169008754:role/snowflake-s3-connection'
    STORAGE_ALLOWED_LOCATIONS = ('s3://spotify-etl-pipeline-project/transformed-data/album-data',           's3://spotify-etl-pipeline-project/transformed-data/artist-data', 's3://spotify-etl-pipeline-project/transformed-data/songs-data')
    COMMENT = 'ESTABLISHING CONNECTION B/W S3 AND SNOWFLAKE'

DESC INTEGRATION S3_INT;

CREATE OR REPLACE FILE FORMAT MANAGE_DB.file_formats.CSV_FILE_FORMAT
TYPE = CSV,
FIELD_DELIMITER = ',',
NULL_IF = ('NULL', 'null'),
EMPTY_FIELD_AS_NULL = TRUE,
SKIP_HEADER = 1;

CREATE OR REPLACE STAGE SPOTIFY_DB.EXTERNAL_STAGES.ALBUM_STAGE
URL = 's3://spotify-etl-pipeline-project/transformed-data/album-data'
STORAGE_INTEGRATION = S3_INT
FILE_FORMAT = CSV_FILE_FORMAT;

CREATE OR REPLACE STAGE SPOTIFY_DB.EXTERNAL_STAGES.ARTIST_STAGE
URL = 's3://spotify-etl-pipeline-project/transformed-data/album-data'
STORAGE_INTEGRATION = S3_INT
FILE_FORMAT = CSV_FILE_FORMAT;

CREATE OR REPLACE STAGE SPOTIFY_DB.EXTERNAL_STAGES.SONGS_STAGE
URL = 's3://spotify-etl-pipeline-project/transformed-data/album-data'
STORAGE_INTEGRATION = S3_INT
FILE_FORMAT = CSV_FILE_FORMAT;