--gde to izmenil data types potomu 4to delal na https://paiza.io/projects/zS7QGIGub1zpoh633-mRAw?language=mysql
--a tam ne rabotaet varchar2, number

create table Orders(id integer, Description varchar(30), Number integer, End_date DATE);

INSERT INTO Orders VALUES (1, "My first order", 99998, '2018-03-20'),(2, "My second order", 99999, NULL);


create table Order_lines(id integer, Number integer, Item_ID integer, Order_ID integer, Quantity integer);
INSERT INTO Order_lines VALUES (1,1,2,2,1),(2,2,1,2,2),(3,1,1,1,1),(4,2,3,1,1),(5,3,2,1,2);



create table Items(id integer, Description varchar(30), Weight integer, Price integer);
INSERT INTO Items VALUES (1,"Mouse",200,10),(2,"Keyboard",500,2),(3,"Mobile phone",300,90);

-- a Order description, Line number, Item description, total order line price, total order line weight.
select  Orders.Description as Order_Description, Order_lines.Number, Items.Description as Item_Description, Items.Weight*Order_lines.Quantity as Total_weight, Items.Price*Order_lines.Quantity as Total_price FROM Orders, Order_lines,Items WHERE (Orders.id = Order_lines.Order_ID) and (Order_lines.Item_ID = Items.id);

-- b Order description, total order price and total order quantity.
select Orders.id, Orders.Description,  SUM(Items.Price*Order_lines.Quantity) as Price_total, SUM(Order_lines.Quantity) as Total_items FROM Orders, Order_lines,Items  WHERE (Orders.id = Order_lines.Order_ID   and Order_lines.Item_ID = Items.id) GROUP BY id, description;

-- c Order description for most expensive order, it’s price.
select Orders.id, Orders.Description  FROM Orders, Order_lines,Items  WHERE (Orders.id = Order_lines.Order_ID   and Order_lines.Item_ID = Items.id) GROUP BY id, description ORDER BY SUM(Items.Price*Order_lines.Quantity) DESC LIMIT 1;


-- d order description, total amount of order lines, total amount of DIFFERENT items.
select Orders.id, Orders.Description,  COUNT(Order_lines.Number) as Total_Order_lines, COUNT(DISTINCT(Order_lines.Item_ID)) as Total_different_items FROM Orders, Order_lines,Items  WHERE (Orders.id = Order_lines.Order_ID   and Order_lines.Item_ID = Items.id) GROUP BY id, description;
-- INSERT INTO Order_lines VALUES (6,4,3,1,1);
select Orders.id, Orders.Description,  COUNT(Order_lines.Number) as Total_Order_lines, COUNT(DISTINCT(Order_lines.Item_ID)) as Total_different_items FROM Orders, Order_lines,Items  WHERE (Orders.id = Order_lines.Order_ID   and Order_lines.Item_ID = Items.id) GROUP BY id, description;

-- 2nd page

CREATE TABLE employee (first_name VARCHAR(2000), last_name VARCHAR(2000), salary Float, bonus Float);
INSERT INTO employee VALUES ("namenamename1","surname",1000,100);
INSERT INTO employee VALUES ("namenamename2","surname",10000,100);
INSERT INTO employee VALUES ("namenamename3","surname",300,100);
INSERT INTO employee VALUES ("namenamename4","surname",3000,100);
INSERT INTO employee VALUES ("namenamename5","surname",3999,100);
INSERT INTO employee VALUES ("namenamename6","surname",4000,100);
INSERT INTO employee VALUES ("namenamename7","surname",4001,100);
INSERT INTO employee VALUES ("namenamename8","surname",10000,100);
INSERT INTO employee VALUES ("namenamename9","surname",100000,100);
INSERT INTO employee VALUES ("namenamename10","surname",3000,100);
INSERT INTO employee VALUES ("namenamename11","surname",2000,100);
INSERT INTO employee VALUES ("namenamename12","surname",1000,100);



-- 500 --> x - 10%
-- 500-4000 --> x - 22%
-- 4000 --> x - 22% - 0.4*x - 1600 --> 0.39*x + 1600 

DELIMITER $$

CREATE FUNCTION get_tax(
	salary float, bonus float
	)
RETURNS float
DETERMINISTIC
BEGIN
    DECLARE taxable_salary float;
	SET taxable_salary = salary+bonus-100;
	
    IF taxable_salary > 4000 THEN
        SET taxable_salary =  taxable_salary*0.39 + 1600;
    ELSEIF (taxable_salary >= 500 AND 
			taxable_salary <= 4000) THEN
        SET taxable_salary = taxable_salary * 0.78;
    ELSEIF taxable_salary < 500 THEN
        SET taxable_salary = taxable_salary * 0.9;
    END IF;
	-- return the customer level
	RETURN (taxable_salary);
END$$
DELIMITER ;
-- task 2a
Select first_name, salary as brutto, get_tax(salary,bonus) as netto_salary from employee;

-- b // ne ponimaju formulirovku 2 zadanija, sdelaju na java kak mne videtsja 4to trebuetsja, no uveren 4to 4to to ne praviljno

