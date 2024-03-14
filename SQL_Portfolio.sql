----- Let's Joy Cafe -----

-- Created Table
CREATE TABLE menus (
  MenuId int,
  Name text,
  UnitPrice real
);
  
INSERT INTO menus VALUES
  (1, "Pearl Milk Tea", 80),
  (2, "Brown Sugar Pearl With Milk", 90),
  (3, "Thai Iced Tea Latte", 80),
  (4, "Iced Matcha Latte", 100),
  (5, "Iced Hojicha Tea Latte", 100),
  (6, "Iced Chocolate", 100);

CREATE TABLE branches (
  BranchId int,
  Province text
);

INSERT INTO branches VALUES 
  (1, "Bangkok"),
  (2, "Chiang Mai"),
  (3, "Phuket");

CREATE TABLE customers (
  CustomerId int,
  Name text,
  Phone text
);

INSERT INTO customers VALUES
	(1, "Cedric Diggory", "089-224-3515"),
    (2, "Minerva McGonagall", "083-414-4312"),
    (3, "Draco Malfoy", "089-642-4326"),
    (4, "Sirius Black", "081-361-8428"),
    (5, "Fleur Delacour", "083-594-5515"),
    (6, "Luna Lovegood", "081-361-8919"),
    (7, "Newt Scamander", "083-919-9218"),
    (8, "Alastor Moody", "086-653-0339");

CREATE TABLE invoices (
  InvoiceId int,
  CustomerId int,
  InvoiceDate date,
  BranchId int,
  NetTotalPrice real
);

INSERT INTO invoices VALUES
	(1, 7, "2024-01-05", 1, 100),
    (2, 4, "2024-01-08", 2, 180),
    (3, 1, "2024-01-11", 1, 170),
    (4, 5, "2024-01-20", 3, 100),
    (5, 6, "2024-01-22", 3, 270),
    (6, 2, "2024-01-28", 2, 170),
    (7, 7, "2024-02-01", 1, 100),
    (8, 7, "2024-02-07", 1, 100),
    (9, 2, "2024-02-15", 2, 200),
    (10, 3, "2024-02-18", 1, 100),
    (11, 8, "2024-02-22", 3, 270),
    (12, 8, "2024-02-29", 2, 100);

CREATE TABLE invoice_items (
  InvoiceItemId int,
  InvoiceId int,
  MenuId int,
  UnitPrice real,
  Quantity int,
  TotalPrice real
);

INSERT INTO invoice_items VALUES
	(1, 1, 6, 100, 1, 100),
    (2, 2, 3, 80, 1, 80),
    (2, 2, 4, 100, 1, 100),
    (3, 3, 1, 80, 1, 80),
    (3, 3, 2, 90, 1, 90),
    (4, 4, 4, 100, 1, 100),
    (5, 5, 1, 80, 1, 80),
    (5, 5, 2, 90, 1, 90),
    (5, 5, 5, 100, 1, 100),
    (6, 6, 1, 80, 1, 80),
    (7, 7, 4, 100, 1, 100),
    (8, 8, 5, 100, 1, 100),
    (9, 9, 4, 100, 1, 100),
    (9, 9, 6, 100, 1, 100),
    (10, 10,6, 100, 1, 100),
    (11, 11, 1, 80, 1,80),
    (11, 11, 2, 90, 1, 90),
    (11, 11, 4, 100, 1, 100),
    (12, 12, 4, 100, 1, 100);

-- Query
-- Total income for all branches in January, 2024.
SELECT
	BranchId,
    SUM(NetTotalPrice) AS SUM_INCOME
FROM invoices
WHERE invoicedate BETWEEN "2024-01-01" AND "2024-01-31"
GROUP BY BranchId;

-- The number of Iced Matcha Latte sold in Chiang Mai (January - February, 2024).
SELECT
	Province,
    Name,
	SUM(Quantity) AS Total_Quantity
FROM branches
JOIN invoices ON branches.BranchId = invoices.BranchId
JOIN invoice_items ON invoices.InvoiceId = invoice_items.InvoiceId
JOIN menus ON invoice_items.MenuId = menus.MenuId
WHERE Province = "Chiang Mai" AND Name = "Iced Matcha Latte";

-- The number of all items sold in Chiang Mai (January - February, 2024).
WITH Sale_Province AS (
  SELECT
  	Province,
    Name,
    Quantity
  FROM branches
  JOIN invoices ON branches.BranchId = invoices.BranchId
  JOIN invoice_items ON invoices.InvoiceId = invoice_items.InvoiceId
  JOIN menus ON invoice_items.MenuId = menus.MenuId
)
SELECT
	Province,
    Name,
    SUM(Quantity) AS Total_Quantity
FROM Sale_Province
WHERE Province = "Chiang Mai"
GROUP BY Name
ORDER BY Total_Quantity DESC;

-- Specify the province for all customers. 
SELECT * FROM customers
JOIN invoices ON customers.CustomerId = invoices.CustomerId
JOIN branches ON invoices.BranchId = branches.BranchId
GROUP BY Name
ORDER BY CustomerId

-- Filter only customers from Bangkok.
SELECT Name, Phone, Province From (
  SELECT * FROM customers
  JOIN invoices ON customers.CustomerId = invoices.CustomerId
  JOIN branches ON invoices.BranchId = branches.BranchId
  GROUP BY Name
  ORDER BY CustomerId
)
WHERE Province = "Bangkok";

-- The number of customers for all Provinces.
SELECT Province, COUNT(Province) AS Customer_Quantity From (
  SELECT * FROM customers
  JOIN invoices ON customers.CustomerId = invoices.CustomerId
  JOIN branches ON invoices.BranchId = branches.BranchId
  GROUP BY Name
)
GROUP BY Province;
