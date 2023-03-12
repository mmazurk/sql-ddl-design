-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists TEXT[] NOT NULL,
  album TEXT NOT NULL,
  producers TEXT[] NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
  ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
  ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
  ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
  ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

-- Again, this needs to be broken into multiple tables

-- song
-- -
-- song_id int pk
-- album_id int fk >- album.album_id
-- song_title varchar(15)
-- release_date date
-- duration int

-- album
-- -
-- album_id int pk
-- artist_id int fk >- artist.artist_id
-- album_title text
-- release_date date
-- length int

-- artist
-- -
-- artist_id int pk
-- producer_id int fk >- producer.producer_id
-- firstname text
-- lastname text
-- age int

-- producer
-- -
-- producer_id int pk
-- name varchar(20) unique


CREATE TABLE "song" (
    "song_id" int   NOT NULL,
    "album_id" int   NOT NULL,
    "song_title" varchar(15)   NOT NULL,
    "release_date" date   NOT NULL,
    "duration" int   NOT NULL,
    CONSTRAINT "pk_song" PRIMARY KEY (
        "song_id"
     )
);

CREATE TABLE "album" (
    "album_id" int   NOT NULL,
    "artist_id" int   NOT NULL,
    "album_title" text   NOT NULL,
    "release_date" date   NOT NULL,
    "length" int   NOT NULL,
    CONSTRAINT "pk_album" PRIMARY KEY (
        "album_id"
     )
);

CREATE TABLE "artist" (
    "artist_id" int   NOT NULL,
    "producer_id" int   NOT NULL,
    "firstname" text   NOT NULL,
    "lastname" text   NOT NULL,
    "age" int   NOT NULL,
    CONSTRAINT "pk_artist" PRIMARY KEY (
        "artist_id"
     )
);

CREATE TABLE "producer" (
    "producer_id" int   NOT NULL,
    "name" varchar(20)   NOT NULL,
    CONSTRAINT "pk_producer" PRIMARY KEY (
        "producer_id"
     ),
    CONSTRAINT "uc_producer_name" UNIQUE (
        "name"
    )
);

ALTER TABLE "song" ADD CONSTRAINT "fk_song_album_id" FOREIGN KEY("album_id")
REFERENCES "album" ("album_id");

ALTER TABLE "album" ADD CONSTRAINT "fk_album_artist_id" FOREIGN KEY("artist_id")
REFERENCES "artist" ("artist_id");

ALTER TABLE "artist" ADD CONSTRAINT "fk_artist_producer_id" FOREIGN KEY("producer_id")
REFERENCES "producer" ("producer_id");

