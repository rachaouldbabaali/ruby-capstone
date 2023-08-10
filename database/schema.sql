-- create database for catalog
CREATE DATABASE IF NOT EXISTS catalog_of_things;

-- create table my_catalog
CREATE TABLE my_catalog(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  genre_id     INT NOT NULL,
  author_id    INT NOT NULL,
  label_id     INT NOT NULL,
  publish_date DATE NOT NULL,
  archived     BOOLEAN NOT NULL,
  CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES Labels (id),
  CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES Authors (id),
  CONSTRAINT genre_fk FOREIGN KEY (genre_id) REFERENCES Genres (id)
);

-- create table for music_albums
CREATE TABLE music_albums(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  archived BOOLEAN NOT NULL,

  genre_ID INT REFERENCES genre(ID)
);

-- create table for genres
CREATE TABLE genre(
  ID SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

-- Create authors table
create table authors(
  id serial not null primary key,
  name varchar(100),
  last_name varchar(100)
);

-- create games table
create table games(
  id serial not null primary key,
  multiplayer varchar(100),
  last_played date,
  publish_date date
);