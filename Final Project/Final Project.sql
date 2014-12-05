CREATE TABLE people(
   pid	   	char(200)    NOT NULL,
   firstName	VARCHAR(200) NOT NULL,
   lastName	VARCHAR(200) NOT NULL,
   dateOfBirth  DATE	     NOT NULL,
   address	VARCHAR(200) NOT NULL,
   zipCode	VARCHAR(5)   NOT NULL,
   phoneNumber  VARCHAR(12)  NOT NULL,
   email	VARCHAR(200) NOT NULL,
   gender       VARCHAR(6)   NOT NULL CHECK (gender IN ('Male', 'Female')),
   PRIMARY KEY (pid)
);


CREATE TABLE customer(
   cid    char(200)   NOT NULL,
   pid    char(200)   NOT NULL REFERENCES people(pid),
   PRIMARY KEY (cid)
);

CREATE TABLE employee(
   eid           char(200)        NOT NULL,
   pid           char(200)        NOT NULL REFERENCES people(pid),
   SSN           VARCHAR(9)  NOT NULL,
   DateEmployed  DATE        NOT NULL,
   PRIMARY KEY (eid)
);

CREATE TABLE employeeAssingments(
   eid           char(200)     NOT NULL REFERENCES employee(eid),
   departid	 char(200)     NOT NULL REFERENCES departments(departid),
   jobTitleid    char(200)     NOT NULL REFERENCES jobTitles(jobtitleid),
   PRIMARY KEY (eid, departid)
);

CREATE TABLE jobTitles(
   jobTitleid	char(200)     NOT NULL,
   jobName	VARCHAR(200)  NOT NULL,
   jobDescrip   VARCHAR(200)  NOT NULL,
   PRIMARY KEY (jobTitleid)
);

CREATE TABLE departments(
   departid	  char(200)    NOT NULL,
   departStoreid  char(200)    NOT NULL REFERENCES departmentStores(departStoreid),
   departName	  VARCHAR(200) NOT NULL,
   PRIMARY KEY(departid)
);


CREATE TABLE departmentStores(
   departStoreid    char(200)    NOT NULL,
   departStoreName  VARCHAR(200) NOT NULL,
   departTown       VARCHAR(200) NOT NULL,
   departState      VARCHAR(2)   NOT NULL,
   departPhone      VARCHAR(12)  NOT NULL,
   departHours      VARCHAR(200) NOT NULL,
   PRIMARY KEY(departStoreid)
);

CREATE TABLE rewards(
   cid         char(200)      NOT NULL REFERENCES customer(cid),
   enrollDate  DATE 	 NOT NULL,
   PRIMARY KEY(cid)
);


CREATE TABLE productOrders(
   productOrderid    char(200)   NOT NULL,
   orderid           char(200)   NOT NULL REFERENCES customerOrders(orderid),
   productid	     char(200)   NOT NULL REFERENCES products(productid),
   PRIMARY KEY(productOrderid)
);

CREATE TABLE products(
   productid       char(200)           NOT NULL,
   departid        char(200)           NOT NULL REFERENCES departments(departid),
   productName     VARCHAR(200)   NOT NULL, 
   productSize     text	          NOT NULL,
   productDescrip  VARCHAR(200)   NOT NULL,
   PRIMARY KEY(productid)
);


CREATE TABLE inventory(
   invid        char(200)      NOT NULL,
   productid 	char(200)      NOT NULL REFERENCES products(productid),
   quantity     INTEGER   NOT NULL,
   PRIMARY KEY(invid)
);

CREATE TABLE productsSupplied(
   supplyid          char(200)      NOT NULL REFERENCES suppliers(supplyid),
   invid             char(200)      NOT NULL REFERENCES inventory(invid),
   datePurchased     DATE      NOT NULL,
   quantityPurchased INTEGER   NOT NULL,
   totalPriceUSD     INTEGER   NOT NULL,
   PRIMARY KEY(supplyid, invid)
);

CREATE TABLE suppliers(
   supplyid          char(200)         NOT NULL,
   supplierFirstName VARCHAR(200) NOT NULL,
   supplierLastName  VARCHAR(200) NOT NULL,
   supplierPhoneNum  VARCHAR(12)  NOT NULL,
   supplierDetails   VARCHAR(200) NOT NULL,
   PRIMARY KEY(supplyid)
);

CREATE TABLE customerOrders(
   orderid   char(200) NOT NULL,
   cid       char(200) NOT NULL REFERENCES customer(cid),
   payMethod text NOT NULL CHECK (payMethod IN ('Cash', 'Credit', 'Check', 'Debit')),
   orderDate DATE   NOT NULL,
   PRIMARY KEY(orderid)
);

--People--
INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p01', 'Rosemary', 'Bulgarelli', '1992-01-18', 'P.O. Box 232', '24425', '541-353-7202','rosemary.bulgarelli!@hotmail.com', 'Female' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p02', 'Olivia', 'Roberts', '1952-12-02', '123 Merry Lane', '21235', '541-123-7202','olivia.roberts@gmail.com', 'Female' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p03', 'Julianna', 'Pokerson', '1963-09-25', '456 Christmas Lane', '24255', '422-353-7202','julianna.pokerson@gmail.com', 'Female' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p04', 'Katheryn', 'Roberts', '2010-10-10', '789 Elf Train', '14523', '541-354-5602','katheryn.roberts@hotmail.com', 'Female' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p05', 'Emily', 'Cook', '1892-02-17', '145 Person Lane', '24578', '551-353-7102','emily.cook@hotmail.com', 'Female' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p06', 'Katie', 'Kroll', '1625-06-25', '1 ABC Road', '05486', '552-543-7202','katie.kroll!@hotmail.com', 'Female' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p07', 'Carter', 'Johnson', '1995-01-01', '54 Carlidge road', '48205', '541-124-7205','carter.johnson@gmail.com', 'Male' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p08', 'Josh', 'Giller', '1999-02-19', '63 Talk Street', '15425', '444-353-7770','josh.giller@yahoo.com', 'Male' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p09', 'Brittany', 'Dodger ', '1985-11-20', '72 Reading Rainbow', '24565', '123-456-7891','brittany.dodger@aol.com', 'Female' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p10', 'Taylor', 'Nixon', '1992-06-12', '981 Greamoor Terrace', '45231', '541-015-7555','taylor.nixon@bing.com', 'Female' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p11', 'Phil', 'Harriet', '1990-9-25', '3 Potluck Dinner Road', '74235', '541-012-7202','phil.harriet@hotmail.com', 'Male' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p12', 'Tom', 'Ashe', '1997-12-17', '123 Abc Lane', '47962', '221-353-2222','tom.ashe@gmail.com', 'Male' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p13', 'Jerry', 'Snitches', '1985-05-04', '24 Cross Circle', '14752', '152-475-7202','jerry.snitches@yahoo.com', 'Male' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p14', 'Ryan', 'McMuffin', '1985-06-25', '928 Forest Lane', '78945', '999-985-7202','ryan.mcmuffin@gmail.com', 'Male' );

INSERT INTO people( pid, firstName, lastName, dateOfBirth, address, zipCode, phoneNumber, email, gender)
  VALUES('p15', 'Michael', 'Hanes', '2000-04-12', '345 Talk Lane', '12345', '991-952-7202','michael.hanes@gmail.com', 'Male');

  select *
  from people
  ORDER BY pid ASC

  
--Employee--
INSERT INTO employee(eid, pid, SSN, dateEmployed)
   VALUES('e01', 'p02', '123456789', '2010-01-01');

INSERT INTO employee(eid, pid, SSN, dateEmployed)
   VALUES('e02', 'p08', '542586245', '2012-02-04');

INSERT INTO employee(eid, pid, SSN, dateEmployed)
   VALUES('e03', 'p10', '783461255', '2014-09-12') ;  

INSERT INTO employee(eid, pid, SSN, dateEmployed)
   VALUES('e04', 'p07', '564312089', '2004-10-31');

INSERT INTO employee(eid, pid, SSN, dateEmployed)
   VALUES('e05', 'p04', '731642895', '2011-05-25');

INSERT INTO employee(eid, pid, SSN, dateEmployed)
   VALUES('e06', 'p15', '234679158', '2002-07-14');

INSERT INTO employee(eid, pid, SSN, dateEmployed)
   VALUES('e07', 'p07', '613497258', '2002-07-14');

INSERT INTO employee(eid, pid, SSN, dateEmployed)
   VALUES('e08', 'p11', '467913649','2012-09-11');

INSERT INTO employee(eid, pid, SSN, dateEmployed)
   VALUES('e09', 'p12', '134679025', '2014-01-18');   

  select *
  from employee
  ORDER BY eid ASC


--Customer--
INSERT INTO customer(cid, pid)
   VALUES('c01', 'p01');

INSERT INTO customer(cid, pid)
   VALUES('c02', 'p01');  

INSERT INTO customer(cid, pid)
   VALUES('c03', 'p03');

INSERT INTO customer(cid, pid)
   VALUES('c04', 'p05');

INSERT INTO customer(cid, pid)
   VALUES('c05', 'p06');

INSERT INTO customer(cid, pid)
   VALUES('c06', 'p09');

INSERT INTO customer(cid, pid)
   VALUES('c07', 'p11');

  select *
  from customer
  ORDER BY cid ASC


--Rewards--

INSERT INTO rewards(cid, enrollDate)
   VALUES('c01', '2012-01-18');

INSERT INTO rewards(cid, enrollDate)
   VALUES('c04', '2013-07-16');   

INSERT INTO rewards(cid, enrollDate)
   VALUES('c07', '2014-12-21');

select *
from rewards
order by cid ASC
   
--Customer Orders--
	
INSERT INTO customerOrders(orderid, cid, payMethod, orderDate)
   VALUES('001','c01','Credit','2012-01-18');

INSERT INTO customerOrders(orderid, cid, payMethod, orderDate)
   VALUES('002','c02','Cash','2004-05-30');

INSERT INTO customerOrders(orderid, cid, payMethod, orderDate)
   VALUES('003','c03','Debit','2001-04-12');

INSERT INTO customerOrders(orderid, cid, payMethod, orderDate)
   VALUES('004','c04','Credit','2014-07-20');

INSERT INTO customerOrders(orderid, cid, payMethod, orderDate)
   VALUES('005','c05','Cash','2013-11-24');

INSERT INTO customerOrders(orderid, cid, payMethod, orderDate)
   VALUES('006','c06','Check','2007-08-28');

INSERT INTO customerOrders(orderid, cid, payMethod, orderDate)
   VALUES('007','c07','Debit','2014-12-03');

select *
from customerOrders
ORDER BY orderid ASC


--Employee Assingnment --
INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e01','dp01','j01');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e02','dp03','j03');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e03','dp19','j02');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e04','dp07','j05');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e05','dp10','j04');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e06','dp02','j03');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e07','dp19','j05');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e08','dp12','j01');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e09','dp04','j02');

select *
from employeeAssingments


--Job Titles--
INSERT INTO jobTitles(jobtitleid, jobName, jobDescrip)
   VALUES('j01', 'Sales','Responsible for selling products on the floor of the store');

INSERT INTO jobTitles(jobtitleid, jobName, jobDescrip)
   VALUES('j02', 'Manager','Responsible for all workers to be doing there job');

INSERT INTO jobTitles(jobtitleid, jobName, jobDescrip)
   VALUES('j03', 'Phone Worker','Responsible for answering the phone and any questions asked by customers');

INSERT INTO jobTitles(jobtitleid, jobName, jobDescrip)
   VALUES('j04', 'Tech','Responsible for keeping our website current');

INSERT INTO jobTitles(jobtitleid, jobName, jobDescrip)
   VALUES('j05', 'Custodial','Responsible for cleaning the store after it has closed');

select *
from jobTitles
ORDER BY jobtitleid ASC


-- Department Stores --
INSERT INTO departmentStores(departStoreid, departStoreName, departTown, departState, departPhone, departHours)
   VALUES('d01','Nordstrom','Palm Beach Gardens', 'FL','135-495-8542','8:00 AM - 9:00 PM');

INSERT INTO departmentStores(departStoreid, departStoreName, departTown, departState, departPhone, departHours)
   VALUES('d02','Nordstrom','King of Prussia', 'PA','540-123-4564','8:00 AM - 9:00 PM');

INSERT INTO departmentStores(departStoreid, departStoreName, departTown, departState, departPhone, departHours)
   VALUES('d03','Nordstrom','Boston', 'MA','123-456-7894','8:00 AM - 9:00 PM');

INSERT INTO departmentStores(departStoreid, departStoreName, departTown, departState, departPhone, departHours)
   VALUES('d04','Nordstrom','New York City', 'NY','456-452-1254','8:00 AM - 9:00 PM');

select *
from departmentStores
ORDER BY departStoreid ASC


--Departments--   
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp01','d01','Mens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp02','d01','Womens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp03','d01','Juniors');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp04','d01','Childrens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp05','d01','Infants');

INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp06','d02','Mens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp07','d02','Womens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp08','d02','Juniors');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp09','d02','Childrens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp10','d02','Infants');
  
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp11','d03','Mens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp12','d03','Womens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp13','d03','Juniors');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp14','d03','Childrens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp15','d03','Infants');
  
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp16','d04','Mens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp17','d04','Womens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp18','d04','Juniors');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp19','d04','Childrens');
INSERT INTO departments(departid, departStoreid, departName)
  VALUES('dp20','d04','Infants');

select*
from departments
ORDER BY departName ASC


-- Products --
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr01','dp01','Jeans','30','Light-wash');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr02','dp01','Button Down','Medium','Plaid');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr03','dp06','Socks','Large','Colorful pattern ');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr04','dp11','T-shirt','Small','California text on front of shirt');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr05','dp16','Shoes','8','Winter Boots');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr06','dp01','Jacket','Extra-Large','Suit Jacket');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr07','dp06','Pants','Large','Khaki dress pants');

INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr08','dp12','Jeans','Large','Acid-wash');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr09','dp07','Dress','Medium','Little Black Dress');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr10','dp02','Blouse','Small','Casual Pink with flowers');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr11','dp17','Tights','One-size','Cat print');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr12','dp12','Shoes','6 1/2','Studded High Heel');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr13','dp07','Long-Sleeve Shirt','Large','Panda pattern');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr14','dp02','Shoes','8','Hot Pink Hunter Boots');

INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr15','dp18','Tank-top','Medium','Sequence covered');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr16','dp08','Skirt','Large','Hot Pink skater style');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr17','dp03','Shirt','Small','Open back, lace top');   
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr18','dp13','Shirt','Extra-small','Lace');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr19','dp18','Shoes','8 1/2','Nude 6-inch heel');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr20','dp08','Shirt','Medium','Polka Dotted, Black, sheer');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr21','dp03','Pants','Large','Cotten pajamas');

INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr22','dp09','Jeans','Small','Regular Wash');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr23','dp04','Shirt','Large','Ice-cream design');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr24','dp19','Shirt','Extra-Large','Disney Car design');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr25','dp14','Shoes','4','Light-up, colorful');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr26','dp09','Skirt','Small','Pink-tutu');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr27','dp04','Backpack','One-Size','Red with superheros ');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr28','dp19','Shirt','Large','Black');

INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr29','dp05','Jeans','2-4 years','Dark-wash');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr30','dp10','Pants','0-2 years','Pink');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr31','dp15','Onezie','0-1 years','Its a girl');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr32','dp20','Shirt','2-3 years','Daddys little girl');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr33','dp05','Dress','3-4 years','Party Dress');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr34','dp10','Shoes','5 infant','White Dress Shoes');
INSERT INTO products(productid, departid, productName, productSize, productDescrip)
   VALUES('pr35','dp15','Onezie','1-2 years','Its a boy!');

select * 
from products
ORDER BY productid ASC

--Inventory--
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i01','pr01','50');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i02','pr02','100');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i03','pr03','45');   
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i04','pr04','25');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i05','pr05','100');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i06','pr06','200');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i07','pr07','10');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i08','pr09','120');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i09','pr10','60');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i10','pr11','75');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i11','pr12','90');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i12','pr13','100');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i13','pr14','50');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i14','pr15','40');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i15','pr16','20');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i16','pr17','5');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i17','pr18','70');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i18','pr19','110');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i19','pr20','210');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i20','pr21','500');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i21','pr22','80');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i22','pr23','90');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i23','pr24','60');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i24','pr25','45');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i25','pr26','65');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i26','pr27','95');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i27','pr28','20');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i28','pr29','30');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i29','pr30','40');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i30','pr31','60');   
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i31','pr32','250');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i32','pr33','300');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i33','pr34','45');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i34','pr34','85');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i35','pr35','95');

select *
from inventory

-- Products Supplies --
INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s01','i22','2014-12-03','100','1000');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s01','i01','2014-12-03','50','2500');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s01','i30','2014-12-03','25','750'); 

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s01','i07','2014-12-25','45','2025');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s02','i10','2014-12-23','60','2400');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s02','i02','2014-11-13','15','750');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s02','i13','2014-1-01','35','2275');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s02','i32','2014-11-02','90','1350');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s03','i03','2014-11-03','75','1500');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s03','i27','2014-12-01','55','2475');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s03','i11','2014-12-02','80','3600');

select *
from productsSupplied

--Suppliers--
INSERT INTO suppliers(supplyid, supplierFirstName, supplierLastName, supplierPhoneNum, supplierDetails)
   VALUES('s01','James','Parker','795-582-1235','Supplies Bottoms');

INSERT INTO suppliers(supplyid, supplierFirstName, supplierLastName, supplierPhoneNum, supplierDetails)
   VALUES('s02','Zach','Goat','134-875-2015','Supplies Tops');   

INSERT INTO suppliers(supplyid, supplierFirstName, supplierLastName, supplierPhoneNum, supplierDetails)
   VALUES('s03','Polar','Express','62-654-8520','Supplies Accessories');

select *
from suppliers

-- Product Orders --
INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro1','001','pr02');

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro2','003','pr03');

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro3','002','pr09');  

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro4','004','pr17');

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro5','005','pr24');

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro6','007','pr19');

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro7','006','pr13');

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro8','004','pr12');

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro9','002','pr25');

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro10','001','pr21');              

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro11','007','pr32');

select *
from productOrders


-- Reports --
	
select prod.productName AS "Department", prod.productDescrip AS "Product Description", depart.departName AS "Department Name"
from products prod, departments depart
where prod.departid=depart.departid 				
ORDER BY departName ASC;
                        						
						
select depart.departid, depart.DepartName AS "Department Name"
from productOrders prOr, products prod, departments depart
where prOr.productid=prod.productid
  and prod.departid=depart.departid 
	GROUP BY depart.departid
	ORDER BY count(departName) DESC
 limit 2


-- Employee View --
CREATE VIEW EmployeeLocation as
select distinct empA.eid AS "Employee ID" , depart.departName AS "Department Name", job.jobName AS "Job Title", job.JobDescrip AS "Job Description", departStore.departStoreName AS "Store Name", departStore.departState AS "Store Location"
from employeeAssingments empA, departments depart, jobTitles job, departmentStores departStore
where empA.departid=depart.departid
  and empA.jobTitleid=job.jobTitleid
  and depart.departStoreid = departStore.departStoreid

-- Inventory View --
CREATE VIEW InventoryView as
select prod.productName AS "Product Name", prod.productid AS "Product ID", inventory.invid AS "Inventory ID", inventory.quantity AS "Inventory Quantity"
from products prod, inventory, productsSupplied prodSup
where prod.productid=inventory.productid 
and inventory.invid=prodSup.invid	

-- Stored Procedure --

CREATE OR REPLACE FUNCTION updateInventories(integer) returns integer as 
$$
DECLARE 
	supplyid          char(4) :=$1;
	quantityPurchased integer :=$2;
	totalPrice	  integer :=$3;
BEGIN
     IF supplyid is NULL or supplyid<0
     THEN
	return 0;
     END IF;

     SELECT
	totalPrice = prodSup.quantityPurchased/prodSup.totalPrice;
end;
$$
language plpgsql;    
	
	














--Stored Procedure --

--Trigger--

CREATE OR REPLACE FUNCTION updateInventorys
AFTER UPDATE ON inventory 
FOR EACH ROW EXECUTE updateInventories
  




















