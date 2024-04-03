/*DBMS PROJECT*/
create database dbmsproject;
use dbmsproject;

/*01 product*/
create table product (product_ID int primary key,product_name varchar(100),supplier_ID int,
unit_price decimal(10, 2),quantity_in_stock int,reorder_level int,expiry_date date,
category varchar(100),foreign key (supplier_ID) references supplier(supplier_ID));
create index inventory_id on product(product_id);
insert into product values(101, 'Widget A', 1, 25.99, 100, 20, '2024-12-31', 'Electronics');
insert into product values(102, 'Gadget B', 2, 15.75, 200, 30, '2025-06-30', 'Tools');
insert into product values(103, 'Tool C', 3, 30.50, 150, 25, '2024-10-31', 'Electronics');
insert into product values(104, 'Appliance D', 4, 50.25, 80, 15, '2025-03-31', 'Appliances');
insert into product values(105, 'Device E', 5, 12.99, 120, 30, '2024-09-30', 'Electronics');
insert into product values(106, 'Gizmo F', 6, 35.50, 90, 20, '2025-01-31', 'Tools');
insert into product values(107, 'Equipment G', 7, 20.75, 130, 25, '2024-11-30', 'Electronics');
insert into product values(108, 'Machine H', 8, 18.00, 110, 30, '2025-02-28', 'Machinery');
insert into product values(109, 'Component I', 9, 40.25, 70, 20, '2024-08-31', 'Electronics');
insert into product values(110, 'Tool J', 10, 22.50, 140, 25, '2025-04-30', 'Tools');
select*from product;

/*02 supplier*/
create table supplier (supplier_ID int primary key,supplier_name varchar(100),contact_info varchar(255),
address varchar(255),email varchar(100),phone_number varchar(20));
insert into supplier values(1, 'ABC Electronics', 'John Doe', '123 Main St, City, Country', 'john.doe@abc.com', '1234567890');
insert into supplier values(2, 'XYZ Manufacturing', 'Alice Smith', '456 Elm St, City, Country', 'alice.smith@xyz.com', '1987654321');
insert into supplier values(3, 'LMN Distributors', 'Michael Johnson', '789 Oak St, City, Country', 'michael.johnson@lmn.com', '1122334455');
insert into supplier values(4, 'PQR Supplies', 'Emily Brown', '101 Pine St, City, Country', 'emily.brown@pqr.com', '1555666777');
insert into supplier values(5, 'RST Industries', 'David Wilson', '321 Maple St, City, Country', 'david.wilson@rst.com', '1444333222');
insert into supplier values(6, 'UVW Corporation', 'Sarah Martinez', '543 Cedar St, City, Country', 'sarah.martinez@uvw.com', '1777888999');
insert into supplier values(7, 'GHI Enterprises', 'Robert Taylor', '987 Birch St, City, Country', 'robert.taylor@ghi.com', '1999888777');
insert into supplier values(8, 'MNO Solutions', 'Jennifer Garcia', '654 Spruce St, City, Country', 'jennifer.garcia@mno.com', '1666777888');
insert into supplier values(9, 'DEF Supplies', 'William Anderson', '210 Walnut St, City, Country', 'william.anderson@def.com', '1888777666');
insert into supplier values(10, 'STU Technologies', 'Jessica Thomas', '876 Cherry St, City, Country', 'jessica.thomas@stu.com', '1223344556');
select*from supplier;

/*03 inventory*/
create table inventory (inventory_ID int primary key,product_ID int,location_ID int,quantity_on_hand int,last_updated date,
    foreign key(product_ID) references product(product_ID),foreign key(location_ID) references location(location_ID));
insert into inventory values(11, 101, 31, 100, '2024-03-01');
insert into inventory values(12, 102, 32, 200, '2024-03-02');
insert into inventory values(13, 103, 33, 150, '2024-03-03');
insert into inventory values(14, 104, 34, 80, '2024-03-04');
insert into inventory values(15, 105, 35, 120, '2024-03-05');
insert into inventory values(16, 106, 36, 90, '2024-03-06');
insert into inventory values(17, 107, 37, 130, '2024-03-07');
insert into inventory values(18, 108, 38, 110, '2024-03-08');
insert into inventory values(19, 109, 39, 70, '2024-03-09');
insert into inventory values(20, 110, 40, 140, '2024-03-10');
select*from inventory;

/*04 transaction*/
create table transaction (transaction_ID int primary key,transaction_type varchar(100),
product_ID int,quantity int,
transaction_date date,employee_ID int);
insert into transaction values(41, 'Sale', 101, 2, '2024-03-01', 401);
insert into transaction values(42, 'Purchase', 102, 5, '2024-03-02', 402);
insert into transaction values(43, 'Sale', 103, 1, '2024-03-03', 403);
insert into transaction values(44, 'Purchase', 104, 3, '2024-03-04', 404);
insert into transaction values(45, 'Sale', 105, 4, '2024-03-05', 405);
insert into transaction values(46, 'Purchase', 106, 2, '2024-03-06', 406);
insert into transaction values(47, 'Sale', 107, 3, '2024-03-07', 407);
insert into transaction values(48, 'Purchase', 108, 6, '2024-03-08', 408);
insert into transaction values(49, 'Sale', 109, 1, '2024-03-09', 409);
insert into transaction values(50, 'Purchase', 110, 2, '2024-03-10', 410);
select*from transaction;

/*05 location*/
create table location (location_ID int primary key,location_name varchar(100),description text);
insert into location values(31, 'Warehouse A', 'Main warehouse for finished goods storage.');
insert into location values(32, 'Warehouse B', 'Secondary warehouse for overflow storage.');
insert into location values(33, 'Factory A', 'Main production facility for electronics.');
insert into location values(34, 'Factory B', 'Secondary production facility for packaging.');
insert into location values(35, 'Distribution Center A', 'Distribution center for local deliveries.');
insert into location values(36, 'Retail Store A', 'Company-owned retail store in downtown.');
insert into location values(37, 'Retail Store A', 'Company-owned retail store in downtown.');
insert into location values(38, 'Retail Store B', 'Company-owned retail store in suburban area.');
insert into location values(39, 'Office Building A', 'Headquarters office building.');
insert into location values(40, 'Office Building B', 'Branch office building in another city.');
select*from location;

/*06 production order*/
drop table production_order;

/*07 production lines*/
create table production_lines (line_ID int primary key,line_name varchar(100),description text);
insert into production_lines values(71, 'Assembly Line 1', 'Assembly line for small electronic devices.');
insert into production_lines values(72, 'Packaging Line 1', 'Packaging line for food products.');
insert into production_lines values(73, 'Manufacturing Line 1', 'Heavy-duty manufacturing line for automotive parts.');
insert into production_lines values(74, 'Bottling Line 1', 'Bottling line for beverages.');
insert into production_lines values(75, 'Assembly Line 2', 'Assembly line for consumer electronics.');
insert into production_lines values(76, 'Packaging Line 2', 'Packaging line for pharmaceutical products.');
insert into production_lines values(77, 'Manufacturing Line 2', 'Precision manufacturing line for medical devices.');
insert into production_lines values(78, 'Bottling Line 2', 'Bottling line for cosmetics.');
insert into production_lines values(79, 'Assembly Line 3', 'Assembly line for furniture components.');
insert into production_lines values(80, 'Packaging Line 3', 'Packaging line for household goods.');
select*from Production_lines;

/*08 customer*/
create table customer (customer_ID int primary key,customer_name varchar(100),email varchar(100),phone_number varchar(20),address varchar(255));
insert into customer values(81, 'John Smith', 'john@example.com', '1234567890', '123 Main St, City, Country');
insert into customer values(82, 'Alice Johnson', 'alice@example.com', '1987654321', '456 Elm St, City, Country');
insert into customer values(83, 'Michael Brown', 'michael@example.com', '1122334455', '789 Oak St, City, Country');
insert into customer values(84, 'Emily Davis', 'emily@example.com', '1555666777', '101 Pine St, City, Country');
insert into customer values(85, 'David Wilson', 'david@example.com', '1444333222', '321 Maple St, City, Country');
insert into customer values(86, 'Sarah Martinez', 'sarah@example.com', '1777888999', '543 Cedar St, City, Country');
insert into customer values(87, 'Robert Taylor', 'robert@example.com', '1999888777', '987 Birch St, City, Country');
insert into customer values(88, 'Jennifer Garcia', 'jennifer@example.com', '1666777888', '654 Spruce St, City, Country');
insert into customer values(89, 'William Anderson', 'william@example.com', '1888777666', '210 Walnut St, City, Country');
insert into customer values(90, 'Jessica Thomas', 'jessica@example.com', '1223344556', '876 Cherry St, City, Country');
select*from Customer;

/*09 orders*/
create table orders (order_ID int primary key,customer_ID int,order_date date,delivery_date date,total_amount decimal(10, 2),
payment_status varchar(50),shipping_method varchar(100),tracking_number varchar(100));
insert into orders values(51, 81, '2024-03-01', '2024-03-05', 125.99, 'Paid', 'Express', 'TRK123456');
insert into orders values(52, 82, '2024-03-02', '2024-03-06', 182.50, 'Paid', 'Standard', 'TRK789012');
insert into orders values(53, 83, '2024-03-03', '2024-03-07', 75.25, 'Paid', 'Express', 'TRK345678');
insert into orders values(54, 84, '2024-03-04', '2024-03-08', 155.98, 'Paid', 'Standard', 'TRK901234');
insert into orders values(55, 85, '2024-03-05', '2024-03-09', 105.00, 'Paid', 'Express', 'TRK567890');
insert into orders values(56, 86, '2024-03-06', '2024-03-10', 320.75, 'Paid', 'Standard', 'TRK123456');
insert into orders values(57, 87, '2024-03-07', '2024-03-11', 220.00, 'Paid', 'Express', 'TRK789012');
insert into orders values(58, 88, '2024-03-08', '2024-03-12', 150.25, 'Paid', 'Standard', 'TRK345678');
insert into orders values(59, 89, '2024-03-09', '2024-03-13', 185.00, 'Paid', 'Express', 'TRK901234');
insert into orders values(60, 90, '2024-03-10', '2024-03-14', 75.50, 'Paid', 'Standard', 'TRK567890');
select*from orders;

/*10 order items*/
create table order_items (order_item_ID int primary key,order_ID int,product_ID int,quantity int,unit_price decimal(10, 2),
    foreign key (order_ID) references orders(order_ID),
    foreign key (product_ID) references product(product_ID));
insert into order_items values(901, 51, 101, 2, 25.99);
insert into order_items values(902, 51, 102, 1, 10.50);
insert into order_items values(903, 52, 103, 3, 15.75);
insert into order_items values(904, 52, 104, 2, 30.00);
insert into order_items values(905, 53, 105, 1, 50.25);
insert into order_items values(906, 54, 106, 4, 12.99);
insert into order_items values(907, 55, 107, 2, 35.50);
insert into order_items values(908, 56, 108, 1, 20.75);
insert into order_items values(909, 57, 109, 3, 18.00);
insert into order_items values(910, 58, 110, 2, 40.25);
select*from order_items;

/*11 order status*/
create table order_status (status_ID int primary key,order_ID int,status varchar(100),status_date date,
    foreign key (order_ID) references orders(order_ID));
insert into order_status values(21, 51, 'Processing', '2024-03-01');
insert into order_status values(22, 52, 'Shipped', '2024-03-02');
insert into order_status values(23, 53, 'Delivered', '2024-03-03');
insert into order_status values(24, 54, 'Processing', '2024-03-04');
insert into order_status values(25, 55, 'Processing', '2024-03-05');
insert into order_status values(26, 56, 'Shipped', '2024-03-06');
insert into order_status values(27, 57, 'Delivered', '2024-03-07');
insert into order_status values(28, 58, 'Processing', '2024-03-08');
insert into order_status values(29, 59, 'Shipped', '2024-03-09');
insert into order_status values(30, 60, 'Delivered', '2024-03-10');
select*from order_status;

/*12 employee*/
create table employee (employee_ID int primary key,first_name varchar(100),last_name varchar(100),
date_of_birth date,gender varchar(1),position varchar(100),department varchar(100),salary decimal(10,2),
hire_date date,supervisor_ID int);
insert into employee values(401, 'John', 'Doe', '1990-05-15', 'M', 'Manager', 'Operations', 60000.00, '2015-03-20', NULL);
insert into employee values(402, 'Jane', 'Smith', '1988-09-22', 'F', 'Senior Analyst', 'Finance', 55000.00, '2016-06-10', 501);
insert into employee values(403, 'Michael', 'Johnson', '1992-11-10', 'M', 'Software Engineer', 'Information Technology', 65000.00, '2017-02-15', 501);
insert into employee values(404, 'Emily', 'Brown', '1995-04-30', 'F', 'Marketing Specialist', 'Marketing', 50000.00, '2018-01-05', 502);
insert into employee values(405, 'David', 'Wilson', '1993-07-18', 'M', 'Customer Service Representative', 'Customer Service', 45000.00, '2019-04-22', 502);
insert into employee values(406, 'Sarah', 'Martinez', '1991-12-12', 'F', 'Sales Associate', 'Sales', 48000.00, '2019-08-15', 503);
insert into employee values(407, 'Robert', 'Taylor', '1987-03-25', 'M', 'HR Specialist', 'Human Resources', 52000.00, '2020-02-10', 501);
insert into employee values(408, 'Jennifer', 'Garcia', '1989-08-05', 'F', 'Legal Advisor', 'Legal', 60000.00, '2020-05-01', 503);
insert into employee values(409, 'William', 'Anderson', '1994-06-28', 'M', 'Quality Assurance Analyst', 'Quality Assurance', 55000.00, '2021-01-15', 504);
insert into employee values(410, 'Jessica', 'Thomas', '1990-02-14', 'F', 'Operations Coordinator', 'Operations', 52000.00, '2021-08-20', 505);
select*from employee;

/*13 departments*/
create table departments (department_ID int,department_name varchar(100));
insert into departments values(601, 'Human Resources');
insert into departments values(602, 'Finance');
insert into departments values(603, 'Marketing');
insert into departments values(604, 'Information Technology');
insert into departments values(605, 'Operations');
insert into departments values(606, 'Customer Service');
insert into departments values(607, 'Research and Development');
insert into departments values(608, 'Sales');
insert into departments values(609, 'Legal');
insert into departments values(610, 'Quality Assurance');
select*from departments;

/*14 quality check*/
create table quality_check (check_ID int,product_ID int,check_date date,inspector_ID int,
defect_found varchar(255),resolution varchar(255),status varchar(50),result varchar(50),remarks text);
insert into quality_check values (701, 101, '2024-03-19', 801, 'Scratched surface', 'Repaired', 'Completed', 'Pass', 'No further issues observed.');
insert into quality_check values (702, 102, '2024-03-20', 802, 'Missing parts', 'Replaced missing parts', 'Completed', 'Pass', 'Product now meets specifications.');
insert into quality_check values (703, 103, '2024-03-21', 803, 'Cracked casing', 'Repaired', 'Completed', 'Pass', 'Casing strengthened.');
insert into quality_check values (704, 104, '2024-03-22', 804, 'Uneven finish', 'Refinished', 'Completed', 'Pass', 'Surface now smooth.');
insert into quality_check values (705, 105, '2024-03-23', 805, 'Misaligned components', 'Adjusted alignment', 'Completed', 'Pass', 'Components now properly aligned.');
insert into quality_check values (706, 106, '2024-03-24', 806, 'Faulty wiring', 'Rewired', 'Completed', 'Pass', 'Electrical connections restored.');
insert into quality_check values (707, 107, '2024-03-25', 807, 'Loose screws', 'Tightened screws', 'Completed', 'Pass', 'Screws securely fastened.');
insert into quality_check values (708, 108, '2024-03-26', 808, 'Inconsistent color', 'Recoloring', 'Completed', 'Pass', 'Color consistency achieved.');
insert into quality_check values (709, 109, '2024-03-27', 809, 'Weak joints', 'Reinforced joints', 'Completed', 'Pass', 'Joints strengthened.');
insert into quality_check values (710, 110, '2024-03-28', 810, 'Inaccurate measurements', 'Adjusted measurements', 'Completed', 'Pass', 'Measurements now accurate.');
select*from Quality_check;

/*15. •	Inspectors*/
create table inspectors (inspector_ID int primary key,inspector_name varchar(100));
insert into inspectors values (801, 'John Doe');
insert into inspectors values (802, 'Jane Smith');
insert into inspectors values (803, 'Michael Johnson');
insert into inspectors values (804, 'Emily Brown');
insert into inspectors values (805, 'David Wilson');
insert into inspectors values (806, 'Sarah Martinez');
insert into inspectors values (807, 'Robert Taylor');
insert into inspectors values (808, 'Jennifer Garcia');
insert into inspectors values (809, 'William Anderson');
insert into inspectors values (810, 'Jessica Thomas');
select*from Inspectors;

/*16. report*/
create table reports(report_ID int, report_type varchar(10),generation_date date, parameters varchar(10), 
metrices varchar(10), analysis_result varchar(10), user_ID int, department_ID int);
insert into reports values('1','Inventory','2024-03-18','Stock','Sales','Sufficient','1001','1');
insert into reports values('2','Sales','2024-03-18','Products','Revenue','Good','1001','2');
insert into reports values('3','Production','2024-03-19','Orders','Efficiency','High','1002','2');
insert into reports values('4','Inventory','2024-03-20','Products','Sales','Stable','1002','1');
insert into reports values('5','Sales','2024-03-21','Customers','Revenue','Increasing','1003','2');
insert into reports values('6','Production','2024-03-22','Orders','Efficiency','Improving','1003','2');
insert into reports values('7','Inventory','2024-03-23','Products','Stock','Adequate','1004','1');
insert into reports values('8','Sales','2024-03-24','Products','Revenue','Decreasing','1004','2');
insert into reports values('9','Production','2024-03-25','Orders','Efficiency','Stable','1005','2');
insert into reports values('10','Inventory','2024-03-26','Products','Sales','Decreasing','1005','1');
select*from reports;


/*1. Simple query to retrieve all products in the 
'Electronics' category:*/
SELECT * FROM product WHERE category = 'Electronics';

/*2. Join to get the product name and supplier name for each product:*/
SELECT p.product_name, s.supplier_name 
FROM product p 
JOIN supplier s ON p.supplier_ID = s.supplier_ID;

/*3 Group by category to count the number of products 
in each category:*/
SELECT category, COUNT(*) as num_products 
FROM product 
GROUP BY category;

/*4. Subquery to find products with unit price greater 
than the average unit price:*/
SELECT * 
FROM product 
WHERE unit_price > (SELECT AVG(unit_price) FROM product);

/*5. Using LIKE to find products with names containing 'Gadget':*/
SELECT * 
FROM product 
WHERE product_name LIKE '%Gadget%';

/*6. Using BETWEEN to find products with reorder level between 
20 and 30:*/
SELECT * 
FROM product 
WHERE reorder_level BETWEEN 20 AND 30;

/*7. Using IN to find products supplied by specific suppliers:*/
SELECT * 
FROM product 
WHERE supplier_ID IN (1, 3, 5);

/*8. Join to get product details along with location descriptions:*/
SELECT p.*, l.description 
FROM product p 
JOIN inventory i ON p.product_ID = i.product_ID 
JOIN location l ON i.location_ID = l.location_ID;

/*9. Join to get the total quantity sold for each product:*/
SELECT p.product_name, SUM(quantity) as total_sold 
FROM product p 
JOIN transaction t ON p.product_ID = t.product_ID 
WHERE t.transaction_type = 'Sale' 
GROUP BY p.product_name;

/*10. Using NOT to find products not in the 'Electronics' category:*/
SELECT * 
FROM product 
WHERE category NOT IN ('Electronics');

/*11. Using ORDER BY to sort products by unit price in 
descending order:*/
SELECT * 
FROM product 
ORDER BY unit_price DESC;

/*12. Using LIMIT to get the top 5 products with the highest 
unit prices:*/
SELECT * 
FROM product 
ORDER BY unit_price DESC 
LIMIT 5;

/*13. Using UNION to combine results of two similar queries: */
(SELECT product_name FROM product WHERE category = 'Electronics')
UNION
(SELECT product_name FROM product WHERE category = 'Tools');

/*14. Using JOIN to get product details and transaction details:*/
SELECT p.product_name, t.transaction_type, t.quantity 
FROM product p 
JOIN transaction t ON p.product_ID = t.product_ID;

/*15. Using GROUP BY to find the total quantity of each 
transaction type:*/
SELECT transaction_type, SUM(quantity) as total_quantity 
FROM transaction 
GROUP BY transaction_type;

/*16. Using HAVING to filter out transaction types with total quantity 
less than 10:*/
SELECT transaction_type, SUM(quantity) as total_quantity 
FROM transaction 
GROUP BY transaction_type 
HAVING total_quantity >= 10;

/*17. Using RANK() to rank products by unit price:*/
SELECT product_name, unit_price, RANK() OVER 
(ORDER BY unit_price) as price_rank 
FROM product;

/*18. Using PARTITION BY to get the average unit price per category:*/
SELECT product_name, category, unit_price, 
       AVG(unit_price) OVER (PARTITION BY category) as 
       avg_price_per_category 
FROM product;

/*19. Using TOP-N queries to get the top 3 
products with the highest quantity in stock:*/
SELECT * 
FROM product 
ORDER BY quantity_in_stock DESC 
LIMIT 3;

/*20. Using EXISTS to find products with existing 
inventory records:*/
SELECT * FROM product p 
WHERE EXISTS (
    SELECT 1 
    FROM inventory i 
WHERE i.product_ID = p.product_ID);

/*21. Inner Join with Filtering:*/
SELECT p.product_name, t.transaction_type, t.quantity 
FROM product p 
INNER JOIN transaction t ON p.product_ID = t.product_ID 
WHERE t.quantity > 2;

/*22. Left Join with Null Values:*/
SELECT p.product_name, t.transaction_type, t.quantity 
FROM product p 
LEFT JOIN transaction t ON p.product_ID = t.product_ID;

/*23. Right Join with Null Values:*/
SELECT p.product_name, t.transaction_type, t.quantity 
FROM product p 
RIGHT JOIN transaction t ON p.product_ID = t.product_ID;

/*24. Self-Join to Find Related Products:*/
SELECT p1.product_name, p2.product_name as related_product
FROM product p1 
JOIN product p2 ON p1.category = p2.category AND 
p1.product_ID != p2.product_ID;

/*25. Cross Join to Generate Combinations:*/
SELECT p.product_name, s.supplier_name 
FROM product p 
CROSS JOIN supplier s;

/*26. **Joining with Multiple Conditions:*/
SELECT p.product_name, i.quantity_on_hand 
FROM product p 
JOIN inventory i ON p.product_ID = i.product_ID 
AND i.quantity_on_hand > 100;

/*27. Joining with Subquery:*/
SELECT p.product_name, t.transaction_type, t.quantity 
FROM product p 
JOIN (
    SELECT * FROM transaction WHERE transaction_date = '2024-03-01'
) t ON p.product_ID = t.product_ID;