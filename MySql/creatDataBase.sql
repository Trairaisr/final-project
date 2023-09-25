
CREATE DATABASE TravelIL DEFAULT CHARSET utf8mb4;

USE TravelIL;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
id int NOT NULL AUTO_INCREMENT,
username varchar(20) NOT NULL UNIQUE,
name varchar(20) NOT NULL,
lastname varchar(20) NOT NULL,
password varchar(12) NOT NULL,
email varchar(100) NOT NULL,
userType varchar(5) NOT NULL DEFAULT 'user',
PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO users (username, password, name, lastname, email, userType) VALUES (
"Admin1",
"do1re2me3",
"Yosi",
"H-Janashvili",
"test1@gmail.com",
"admin"
);
INSERT INTO users (username, password, name, lastname, email, userType) VALUES (
"Admin2",
"cats",
"Vladi",
"simpson",
"test2@gmail.com",
"admin"
);
INSERT INTO users (username, password, name, lastname, email, userType) VALUES (
"testname",
"cats",
"mitzi",
"simpson",
"test2@gmail.com",
"user"
);

DROP TABLE IF EXISTS vacations;

CREATE TABLE vacations (
id int NOT NULL AUTO_INCREMENT,
destination varchar(30) NOT NULL,
description varchar(300) NOT NULL,
image varchar(200) NOT NULL,
startDate datetime NOT NULL,
endDate datetime NOT NULL,
price double NOT NULL,
followers int NOT NULL DEFAULT 0,
PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO vacations (destination, description, image, startDate, endDate, price) VALUES 
("Jerusalem",
 "A historical journy though one of the most important cities in the world, rich in culture like no other.",
 "https://img.wallpapersafari.com/desktop/1920/1080/4/4/eDjEWF.jpeg",
 "2024-01-01",
 "2024-01-13",
 "689"),
 ("Tbilisi",
 "Tbilisi is a city bursting with vibrant culture and landmark attractions. From ancient churches and old-world architecture to an abundance of tasty cuisine and wine bars, there's a lot of things to do and see in Tbilisi.",
 "https://e0.pxfuel.com/wallpapers/332/840/desktop-wallpaper-tbilisi.jpg",
 "2023-11-30",
 "2023-12-12",
 "780"),
  ("Washington",
 "No matter how you spend your time in the nation’s capital, you're sure to leave with lifelong memories.",
 "https://wallpaperaccess.com/full/395381.jpg",
 "2023-9-17",
 "2023-10-02",
 "1300"),
 ("Tokyo",
 "Come and visit the capital of japan on it blooming winter right on christmas",
 "https://www.tokyo-midtown.com/jp/event/xmas/resources/img/top/ogp.jpg",
 "2023-12-15",
 "2024-01-07",
 "1850"),
("Amsterdam",
 "Amsterdam. Capital of the Netherlands. With its famously scenic canals, rich history and iconic cultural scene, Amsterdam is one of the world's most vibrant cities. This page offers top tips to see our capital city like a local",
 "https://a.cdn-hotels.com/gdcs/production191/d1221/ddd9be50-8b27-45ba-a070-b197c75bbb6e.jpg",
 "2023-07-29",
 "2023-08-21",
 "999"),
 ("London",
 "Welcome to London! Discover the best of London. Find things to do in London, from iconic sightseeing spots and fun-filled days out to top restaurants, theatre and unmissable London events. If you’re not able to visit just yet, plan ahead to make the most of your next visit.",
 "https://images.musement.com/cover/0002/49/london-jpeg_header-148518.jpeg",
 "2023-08-01",
 "2023-09-01",
 "1300"),
   ("Paris",
 "Paris lives up to its hype: A city with unbelievable food and culture, plus stunning views everywhere you turn. With 18 arrondissements, it’s a lot to see in one trip, but each neighborhood has a personality all its own. You can’t miss it.",
 "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/75/b0/36.jpg",
 "2023-7-17",
 "2023-7-22",
 "360"),
   ("Berlin",
 "Berlin in Spring awaits you. Visit the great museums & sights and then relax in a café. Look forward to concerts & shows, stroll through the shops and discover with us all the diversity of the most wonderful season in Berlin.",
 "https://cdn.britannica.com/49/179449-138-9F4EC401/Overview-Berlin.jpg",
 "2023-07-01",
 "2023-07-17",
 "800"),
   ("Oslo",
 "Oslo will make you ""scream"" with excitement and wonder. Fill your time in Oslo with all sorts of activities. Oslo has got just the thing for you, whether you're an art aficionado, a nature lover or a shuffleboard champion.",
 "https://a.cdn-hotels.com/gdcs/production106/d1597/5303351b-a7d2-4775-994a-348002ea13d2.jpg",
 "2023-07-17",
 "2023-08-02",
 "499"),
  ("Madrid",
 "Madrid, cheerful and vibrant at all hours, is famous for being an open city with all kinds of people from anywhere in the world.
In addition to its famous museums, busy streets dotted with all kinds of shops, restaurants with world cuisine and unbeatable nightlife, Madrid will surprise you",
 "https://media.istockphoto.com/id/514769480/photo/madrid-spain-on-gran-via.jpg?s=612x612&w=0&k=20&c=5PDxqwnxYmudMHIs3ZkRJRE64153nnw-hJTH2zdryzc=",
 "2023-9-15",
 "2023-10-01",
 "850"),
 ("Stockholm",
 "An open city for different perspectives and new ideas. A vibrant destination where innovations in music, design, fashion and technology are born. A place for you.",
"https://imageio.forbes.com/specials-images/imageserve/615f2c3ed2ddbece4386bcaa/A-waterfront-scene-in-Stockholm-Old-Town/960x0.jpg",
 "2023-08-01",
 "2023-08-23",
 "670");
 ("Ottawa",
 "Ottawa is Canada's capital city and has long been known as an important hub for commerce and travel. In fact, Ottawa's name comes from the Algonquin word adawe, meaning “to trade.” Today Ottawa is the perfect place to experience Canadiana all in one city.",
"https://www.getyourguide.com/magazine/wp-content/migrated-content/uploads/2019/04/Header-2019.05.09-8-reasons-Canada-is-perfect-for-nature-lovers-GetYourGuide--1200x675.jpg",
 "2023-12-28",
 "2024-01-11",
 "1199");


DROP TABLE IF EXISTS followers;

CREATE TABLE followers (
id int NOT NULL AUTO_INCREMENT,
userId int NOT NULL,
vacationId int NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (userId) REFERENCES users (id),
FOREIGN KEY (vacationId) REFERENCES vacations (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

