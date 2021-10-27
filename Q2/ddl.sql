CREATE TABLE Customer (
  id INTEGER PRIMARY KEY,
  firstName VARCHAR(50),
  lastName VARCHAR(50),
  email VARCHAR(20),
  phone CHAR(10),
  streetAddress VARCHAR(50),
  city VARCHAR(10),
  state VARCHAR(5),
  postCode CHAR(6),
  country VARCHAR(10),
  userId VARCHAR(20),
  password VARCHAR(30)
);

CREATE TABLE PaymentMethod(
  id INTEGER PRIMARY KEY,
  type VARCHAR(10),
  number CHAR(16),
  expiryDate DATE,
  cusId INTEGER,
  FOREIGN KEY (cusId) REFERENCES Customer(id)
);

CREATE TABLE Warehouse(
  id INTEGER PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Category(
  id INTEGER PRIMARY KEY,
  name VARCHAR(10)
);

CREATE TABLE Product(
  id INTEGER PRIMARY KEY,
  name VARCHAR(10),
  price DECIMAL(9,2),
  imageURL VARCHAR(30),
  image BLOB,
  description VARCHAR(5),
  categoryid INTEGER,
  FOREIGN KEY (categoryid) REFERENCES Category(id)
);

CREATE TABLE Review(
  id INTEGER PRIMARY KEY,
  rating INTEGER CHECK (rating BETWEEN 1 AND 5),
  comment VARCHAR(50),
  date DATE,
  cusId INTEGER,
  prodId INTEGER,
  FOREIGN KEY (cusId) REFERENCES Customer(id),
  FOREIGN KEY (prodId) REFERENCES Product(id)
);

CREATE TABLE Shipment(
  id INTEGER PRIMARY KEY,
  date DATE,
  description VARCHAR(50),
  whId INTEGER,
  FOREIGN KEY (whId) REFERENCES Warehouse(id)
);

CREATE TABLE OrderSummary(
  id INTEGER PRIMARY KEY,
  date DATE,
  totalAmount DECIMAL(9,2),
  shipToAddress VARCHAR(50),
  shipToCity VARCHAR(10),
  shipToState VARCHAR(5),
  shipToCountry VARCHAR(10),
  shipToPostCode VARCHAR(6),
  custId INTEGER,
  shipId INTEGER,
  FOREIGN KEY (custId) REFERENCES Customer(id),
  FOREIGN KEY (shipId) REFERENCES Shipment(id)
);

CREATE TABLE OrderProduct(
  quantity INTEGER,
  price DECIMAL(9,2),
  prodId INTEGER,
  orderId INTEGER,
  PRIMARY KEY (prodId, orderId),
  FOREIGN KEY (prodId) REFERENCES Product(id),
  FOREIGN KEY (orderId) REFERENCES OrderSummary(id)
);



CREATE TABLE ProductInventory(
  quantity INTEGER,
  prodId INTEGER,
  whId INTEGER,
  PRIMARY KEY (prodId, whId),
  FOREIGN KEY (prodId) REFERENCES Product(id),
  FOREIGN KEY (whId) REFERENCES Warehouse(id)
);



CREATE TABLE InCart(
  quantity INTEGER,
  price DECIMAL(9,2),
  prodId INTEGER,
  custId INTEGER,
  PRIMARY KEY (prodId, custId),
  FOREIGN KEY (prodId) REFERENCES Product(id),
  FOREIGN KEY (custId) REFERENCES Customer(id)
);



