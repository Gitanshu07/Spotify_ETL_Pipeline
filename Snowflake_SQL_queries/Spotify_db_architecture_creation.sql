CREATE OR REPLACE DATABASE SPOTIFY_DB;

CREATE OR REPLACE SCHEMA SPOTIFY_SCHEMA;

CREATE OR REPLACE SCHEMA SPOTIFY_PIPES;

CREATE OR REPLACE SCHEMA EXTERNAL_STAGES;

CREATE OR REPLACE SPOTIFY_DB.SPOTIFY_SCHEMA.tblALBUM (
    album_id VARCHAR(50),
    album_name VARCHAR(50),
    album_release_date DATE,
    album_release_date INT,
    album_url VARCHAR(50)
);

CREATE OR REPLACE SPOTIFY_DB.SPOTIFY_SCHEMA.tblARTIST (
    artist_id VARCHAR(50),
    artist_name VARCHAR(50),
    external_url VARCHAR(100)
);

CREATE OR REPLACE SPOTIFY_DB.SPOTIFY_SCHEMA.tblSONGS (
    song_id VARCHAR(50),
    song_name VARCHAR(50),
    song_duration VARCHAR(50),
    song_url VARCHAR(50),
    song_popularity INT,
    song_added DATE,
    album_id,
    FOREIGN KEY (album_id) REFERENCES ALBUM (album_id) ON DELETE CASCADE,
    artist_id,
    FOREIGN KEY (artist_id) REFERENCES ARTIST (artist_id) ON DELETE CASCADE
);




