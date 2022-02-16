CREATE TABLE `users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `surName` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `joinDate` date NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1

CREATE TABLE `products` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `colour` varchar(15) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1

CREATE TABLE `orders` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `orderDate` date NOT NULL,
  `estDeliveryDate` date NOT NULL,
  `orderVal` decimal(6,2) NOT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `UserId_idx` (`UserId`),
  CONSTRAINT `FK_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1

CREATE TABLE `orderline` (
  `OrderlineId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  PRIMARY KEY (`OrderlineId`),
  KEY `FK_OrderId_idx` (`OrderId`),
  KEY `FK_ProductId_idx` (`ProductId`),
  CONSTRAINT `FK_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`OrderId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1

USE eshop;

INSERT INTO products (title, description, price, colour)
VALUES ("Hairdryer", "This is a fabolous hairdryer, made from stainless steel.", "150.99", "grey");

INSERT INTO products (title, description, price, colour)
VALUES ("Chair", "This is a sturdy chair, made from gold.", "999.99", "gold");

INSERT INTO products (title, description, price, colour)
VALUES ("Candle", "Basic scented candle", "5", "red");

INSERT INTO products (title, description, price, colour)
VALUES ("Mug", "Basic hello world mug", "3", "black");

INSERT INTO products (title, description, price, colour)
VALUES ("TV", "Samsung 50' TV", "499", "silver");

INSERT INTO users (firstName, surName, dob, joinDate)
VALUES ("Jamie", "Smith", "1995-10-22", "2022-01-02");

INSERT INTO users (firstName, surName, dob, joinDate)
VALUES ("Cristiano", "Ronaldo", "1988-10-02", "2021-12-03");

INSERT INTO users (firstName, surName, dob, joinDate)
VALUES ("Lionel", "Messi", "1989-10-03", "2021-11-07");

INSERT INTO users (firstName, surName, dob, joinDate)
VALUES ("Mikel", "Arteta", "1982-02-10", "2022-01-22");

INSERT INTO users (firstName, surName, dob, joinDate)
VALUES ("Gabriel", "Martinelli", "1999-11-03", "2020-01-05");

UPDATE products SET colour = "red" WHERE productId = 2;

SELECT * FROM users;
SELECT * FROM products;

INSERT INTO orders (userId, orderDate, estDeliveryDate, orderVal)
VALUES ("1", "2022-02-05", "2022-02-07", "1005");

INSERT INTO orderline (orderId, productId)
VALUES ("1", "3");

INSERT INTO orderline (orderId, productId)
VALUES ("1", "4");

INSERT INTO orders (userId, orderDate, estDeliveryDate, orderVal)
VALUES ("2", "2022-02-05", "2022-02-07", "151");

INSERT INTO orderline (orderId, productId)
VALUES ("2", "1");

INSERT INTO orders (userId, orderDate, estDeliveryDate, orderVal)
VALUES ("3", "2022-01-06", "2022-01-10", "3");

INSERT INTO orderline (orderId, productId)
VALUES ("3", "5");

INSERT INTO orders (userId, orderDate, estDeliveryDate, orderVal)
VALUES ("4", "2022-01-06", "2022-01-10", "15");

INSERT INTO orderline (orderId, productId)
VALUES ("4", "4");
INSERT INTO orderline (orderId, productId)
VALUES ("4", "4");
INSERT INTO orderline (orderId, productId)
VALUES ("4", "4");

INSERT INTO orders (userId, orderDate, estDeliveryDate, orderVal)
VALUES ("5", "2022-02-16", "2022-02-20", "1499");

INSERT INTO orderline (orderId, productId)
VALUES ("5", "3");
INSERT INTO orderline (orderId, productId)
VALUES ("5", "6");

SELECT * FROM Products;
SELECT * FROM Orders;


SELECT * FROM Orders WHERE orderId = "1";
SELECT * FROM orderline WHERE orderId = "4";

SELECT title FROM products WHERE productid = "3";

SELECT p.title, O.orderId FROM Orders O 
JOIN orderline OL ON O.orderId = OL.orderId
JOIN products P ON P.productID = OL.productId
WHERE O.orderId = 4;

SELECT u.firstName, u.surName, p.title, O.orderId FROM Users U 
JOIN orders O ON U.UserId = O.UserId
JOIN orderline OL ON O.orderId = OL.orderId
JOIN products P ON P.productID = OL.productId
WHERE O.orderId = 5;

SELECT * FROM products;
DELETE FROM orderline WHERE orderId = 5 AND productId = 6;

SET SQL_SAFE_UPDATES = 0;
UPDATE products SET price = "150.99"
WHERE title = "Hairdryer";

UPDATE products SET price = "999.99"
WHERE productId = 3;

UPDATE products SET price = "459.99"
WHERE productId = 6;

SELECT * FROM users;
DELETE FROM users WHERE userId = 5;