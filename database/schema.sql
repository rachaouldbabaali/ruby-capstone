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

-- create table for books
CREATE TABLE books(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  publisher VARCHAR(30),
  cover_state VARCHAR(30),
  label_ID INT REFERENCES labels(ID)
);

-- create table for labels
CREATE TABLE labels(
  ID SERIAL PRIMARY KEY,
  title VARCHAR(30),
  color VARCHAR(30)
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