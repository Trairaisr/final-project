/*
CREATE DATABASE TravelIL DEFAULT CHARSET utf8mb4;

USE TravelIL;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
id int NOT NULL AUTO_INCREMENT,
username varchar(20) NOT NULL,
name varchar(20) NOT NULL,
lastname varchar(20) NOT NULL,
password varchar(12) NOT NULL,
email varchar(100) NOT NULL,
userType varchar(5) NOT NULL DEFAULT 'user',
PRIMARY KEY(id),
INDEX username(username)
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
 ("Tbili",
 "Tbilisi is a city bursting with vibrant culture and landmark attractions. From ancient churches and old-world architecture to an abundance of tasty cuisine and wine bars, there's a lot of things to do and see in Tbilisi.",
 "https://e0.pxfuel.com/wallpapers/332/840/desktop-wallpaper-tbilisi.jpg",
 "2023-11-30",
 "2023-12-12",
 "780"),
  ("Washington",
 "No matter how you spend your time in the nation’s capital, you're sure to leave with lifelong memories.",
 "https://wallpaperplay.com/walls/full/2/f/2/297583.jpg",
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
 "Amsterdam. Capital of the Netherlands. With its famously scenic canals, rich history and iconic cultural scene, Amsterdam is one of the world's most vibrant cities. This page offers top tips to see our capital city like a local. Read about the city's hidden gems, sustainable travel tips and off-the-beaten-track adventures.",
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
 "https://static.leonardo-hotels.com/image/istock_000074120341_double_b096fa001206dc2a3e7807728a52bee0_96db40b1ec66771576ace3694452b5ba_2048x1322_desktop_2_74ba8b7f38123780ebf8809e9b81d49b_2048x1322_desktop_2.webp",
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
 "data:image/jpeg;base64,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",
 "2023-08-01",
 "2023-08-23",
 "670");


DROP TABLE IF EXISTS followers;

CREATE TABLE followers (
id int NOT NULL AUTO_INCREMENT,
userId int NOT NULL,
vacationId int NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (userId) REFERENCES users (id),
FOREIGN KEY (vacationId) REFERENCES vacations (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
*/