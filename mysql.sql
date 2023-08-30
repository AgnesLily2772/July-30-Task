CREATE DATABASE IMDB;

CREATE TABLE movie (
movieId INT PRIMARY KEY auto_increment,
movieName VARCHAR(255) NOT NULL,
media ENUM('video','image') DEFAULT 'video',
genre ENUM('socio-fantasy','drama','action','thriller','sci-fi','comedy') DEFAULT 'drama'
);

INSERT INTO movie (movieName,media,genre) VALUES('Bahubhali','video','socio-fantasy');

INSERT INTO movie (movieName,media,genre) VALUES('RRR','image','drama');

INSERT INTO movie (movieName,media,genre) VALUES('Vikram','video','action');

INSERT INTO movie (movieName,media,genre) VALUES('Rocketry','video','sci-fi');

INSERT INTO movie (movieName,media,genre) VALUES('Jathiratnalu','image','comedy');

CREATE TABLE user(
userId INT PRIMARY KEY auto_increment,
username VARCHAR(255) NOT NULL,
moviename INT NOT NULL,
review ENUM('Average','good','verygood','excellent') DEFAULT 'good',
FOREIGN KEY (moviename) REFERENCES movie(movieId)
);

INSERT INTO user (username,moviename,review) VALUES('user1',1,'excellent');

INSERT INTO user (username,moviename,review) VALUES('user2',5,'Average');


INSERT INTO user (username,moviename,review) VALUES('user3',4,'verygood');


INSERT INTO user (username,moviename,review) VALUES('user4',2,'good');


INSERT INTO user (username,moviename,review) VALUES('user5',3,'verygood');


INSERT INTO user (username,moviename,review) VALUES('user6',3,'excellent');


-- DELETE FROM user WHERE userId=6;

CREATE TABLE artist(
artistId INT PRIMARY KEY auto_increment,
artistname VARCHAR(255) UNIQUE,
skills ENUM('acting','dancing','fighting','singer') DEFAULT 'acting'
);

INSERT INTO artist(artistname,skills) VALUES('prem','acting');

INSERT INTO artist(artistname,skills) VALUES('kumar','singer');

INSERT INTO artist(artistname,skills) VALUES('pk','dancing');

INSERT INTO artist(artistname,skills) VALUES('dpk','fighting');

INSERT INTO artist(artistname,skills) VALUES('prem','dancing');

CREATE TABLE role(
roleId INT PRIMARY KEY auto_increment,
rolename VARCHAR(255),
artistId INT ,
movieId INT,
FOREIGN KEY (artistId) REFERENCES artist(artistId),
FOREIGN KEY (movieId) REFERENCES movie(movieId)
);

INSERT INTO role (rolename,artistId,movieId) VALUES('hero',1,1);

INSERT INTO role (rolename,artistId,movieId) VALUES('villan',4,3);

INSERT INTO role (rolename,artistId,movieId) VALUES('heroine',3,4);

INSERT INTO role (rolename,artistId,movieId) VALUES('dancer',2,2);

INSERT INTO role (rolename,artistId,movieId) VALUES('fighter',2,2);

INSERT INTO role (rolename,artistId,movieId) VALUES('hero',4,3);

SELECT * FROM movie;

SELECT * FROM user;

SELECT * FROM artist;

SELECT * FROM role;

SELECT * FROM movie m left JOIN user u ON m.movieId = u.moviename;

SELECT * FROM artist a left JOIN role r ON a.artistId = r.artistId;

SELECT * FROM movie m INNER JOIN role r ON m.movieId = r.movieId;