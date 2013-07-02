DROP TABLE people;
DROP TABLE houses;

CREATE TABLE houses
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  sigil VARCHAR(255),
  motto VARCHAR(255)
);

CREATE TABLE people
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  weapon VARCHAR(255),
  age INT,
  living BOOLEAN DEFAULT TRUE,
  image TEXT,
  house_id INT REFERENCES houses(id)
);

-- add three houses
INSERT INTO houses (name, sigil, motto) VALUES ('Stark', 'file://localhost/Users/Wes/code/GoT/Sigils/Stark.jpg', 'Winter is Coming');

INSERT INTO houses (name, sigil, motto) VALUES ('Lannister', 'file://localhost/Users/Wes/code/GoT/Sigils/Lannister.jpg', 'Hear Me Roar!');

INSERT INTO houses (name, sigil, motto) VALUES ('Baratheon', 'file://localhost/Users/Wes/code/GoT/Sigils/Baratheon.jpg', 'Ours is the Fury');

-- add 5 people
INSERT INTO people (name, weapon, age, living, image, house_id) VALUES ('Ned Stark', 'Ice', 38, false, 'empty', 1)
INSERT INTO people (name, weapon, age, living, image, house_id) VALUES ('Bran', 'Worg', 8, true, 'http://static.tvfanatic.com/images/gallery/bran-stark-photo.jpg', 1);
INSERT INTO people (name, weapon, age, living, image, house_id) VALUES ('Jon', 'Longclaw', 19, true, 'http://images3.wikia.nocookie.net/__cb20130325182730/gameofthrones/images/8/8b/Jon-Snow-S3.jpg', 1);
INSERT INTO people (name, weapon, age, living, image, house_id) VALUES ('Jamie', 'House', 29, true, 'http://images6.fanpop.com/image/photos/33800000/Jaime-Lannister-jaime-lannister-33803609-500-619.jpg', 2);

