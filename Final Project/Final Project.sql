CREATE TABLE people(
   pid	   	text         NOT NULL,
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
   cid    text   NOT NULL,
   pid    text   NOT NULL REFERENCES people(pid),
   PRIMARY KEY (cid)
);

CREATE TABLE employee(
   eid           text        NOT NULL,
   pid           text        NOT NULL REFERENCES people(pid),
   SSN           VARCHAR(9)  NOT NULL,
   DateEmployed  DATE        NOT NULL,
   PRIMARY KEY (eid)
);

CREATE TABLE employeeAssingments(
   eid           text     NOT NULL REFERENCES employee(eid),
   departid	 text     NOT NULL REFERENCES departments(departid),
   jobTitleid    text     NOT NULL REFERENCES jobTitles(jobtitleid),
   PRIMARY KEY (eid, departid)
);

CREATE TABLE jobTitles(
   jobTitleid	text          NOT NULL,
   jobName	VARCHAR(200)  NOT NULL,
   jobDescrip   VARCHAR(200)  NOT NULL,
   PRIMARY KEY (jobTitleid)
);

CREATE TABLE departments(
   departid	  text         NOT NULL,
   departName	  VARCHAR(200) NOT NULL,
   PRIMARY KEY(departid)
);

CREATE TABLE departmentStores(
   departStoreid    text         NOT NULL,
   departStoreName  VARCHAR(200) NOT NULL,
   departTown       VARCHAR(200) NOT NULL,
   departState      VARCHAR(2)   NOT NULL,
   departPhone      VARCHAR(12)  NOT NULL,
   departHours      VARCHAR(200) NOT NULL,
   PRIMARY KEY(departStoreid)
);

CREATE TABLE rewards(
   cid         text      NOT NULL REFERENCES customer(cid),
   enrollDate  DATE 	 NOT NULL,
   PRIMARY KEY(cid)
);

CREATE TABLE productOrders(
   productOrderid    text   NOT NULL,
   orderid           text   NOT NULL REFERENCES customerOrders(orderid),
   productid	     text   NOT NULL REFERENCES products(productid),
   PRIMARY KEY(productOrderid)
);

CREATE TABLE products(
   productid       text           NOT NULL,
   departid        text           NOT NULL REFERENCES departments(departid),
   productName     VARCHAR(200)   NOT NULL, 
   productPriceUSD text    	 NOT NULL,
   productSize     text	         NOT NULL,
   productDescrip  VARCHAR(200)   NOT NULL,
   PRIMARY KEY(productid)
);


CREATE TABLE inventory(
   invid        text      NOT NULL,
   productid 	text      NOT NULL REFERENCES products(productid),
   quantity     INTEGER   NOT NULL,
   PRIMARY KEY(invid)
);

CREATE TABLE productsSupplied(
   supplyid          text      NOT NULL REFERENCES suppliers(supplyid),
   invid             text      NOT NULL REFERENCES inventory(invid),
   datePurchased     DATE      NOT NULL,
   quantityPurchased INTEGER   NOT NULL,
   totalPriceUSD     INTEGER   NOT NULL,
   PRIMARY KEY(supplyid, invid)
);

CREATE TABLE suppliers(
   supplyid          text         NOT NULL,
   supplierFirstName VARCHAR(200) NOT NULL,
   supplierLastName  VARCHAR(200) NOT NULL,
   supplierPhoneNum  VARCHAR(12)  NOT NULL,
   supplierDetails   VARCHAR(200) NOT NULL,
   PRIMARY KEY(supplyid)
);

CREATE TABLE customerOrders(
   orderid   text NOT NULL,
   cid       text NOT NULL REFERENCES customers(cid),
   payMethod text NOT NULL CHECK (payMethod IN ('Cash', 'Credit', 'Check', 'Debit')),
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
   VALUES('e01','dp1','j01');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e02','dp3','j03');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e03','dp2','j02');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e04','dp5','j05');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e05','dp4','j04');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e06','dp2','j03');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e07','dp3','j05');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e08','dp2','j01');

INSERT INTO employeeAssingments(eid, departid, jobTitleid)
   VALUES('e09','dp4','j02');

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
INSERT INTO departments(departid, departName)
  VALUES('dp1','Mens');

INSERT INTO departments(departid, departName)
  VALUES('dp2','Womens');

INSERT INTO departments(departid, departName)
  VALUES('dp3','Juniors');

INSERT INTO departments(departid, departName)
  VALUES('dp4','Childrens');

INSERT INTO departments(departid, departName)
  VALUES('dp5','Infants');

select*
from departments
ORDER BY departid ASC


-- Products --
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr1','dp1','Jeans','50.00','30','Light-wash');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr2','dp1','Button Down','45.00','Medium','Plaid');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr3','dp1','Socks','7.00','Large','Colorful pattern ');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr4','dp1','T-shirt','20.00','Small','California text on front of shirt');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr5','dp1','Shoes','70.00','8','Winter Boots');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr6','dp1','Jacket','100.00','Extra-Large','Suit Jacket');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr7','dp1','Pants','35.00','Large','Khaki dress pants');

INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr8','dp2','Jeans','45.00','Large','Acid-wash');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr9','dp2','Dress','30.00','Medium','Little Black Dress');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr10','dp2','Blouse','56.00','Small','Casual Pink with flowers');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr11','dp2','Tights','12.00','One-size','Cat print');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr12','dp2','Shoes','70.00','6 1/2','Studded High Heel');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr13','dp2','Long-Sleeve Shirt','25.00','Large','Panda pattern');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr14','dp2','Shoes','85.00','8','Hot Pink Hunter Boots');

INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr15','dp3','Tank-top','23.00','Medium','Sequence covered');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr16','dp3','Skirt','21.00','Large','Hot Pink skater style');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr17','dp3','Shirt','12.00','Small','Open back, lace top');   
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr18','dp3','Shirt','19.00','Extra-small','Lace');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr19','dp3','Shoes','34.00','8 1/2','Nude 6-inch heel');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr20','dp3','Shirt','27.00','Medium','Polka Dotted, Black, sheer');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr21','dp3','Pants','15.00','Large','Cotten pajamas');

INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr22','dp4','Jeans','26.00','Small','Regular Wash');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr23','dp4','Shirt','25.00','Large','Ice-cream design');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr24','dp4','Shirt','25.00','Extra-Large','Disney Car design');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr25','dp4','Shoes','35.00','4','Light-up, colorful');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr26','dp4','Skirt','10.00','Small','Pink-tutu');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr27','dp4','Backpack','15.00','One-Size','Red with superheros ');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr28','dp4','Shirt','5.00','Large','Black');

INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr29','dp5','Jeans','23.00','2-4 years','Dark-wash');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr30','dp5','Pants','45.00','0-2 years','Pink');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr31','dp5','Onezie','16.00','0-1 years','Its a girl');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr32','dp5','Shirt','15.00','2-3 years','Daddys little girl');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr33','dp5','Dress','30.00','3-4 years','Party Dress');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr34','dp5','Shoes','40.00','5 infant','White Dress Shoes');
INSERT INTO products(productid, departid, productName, productPriceUSD, productSize, productDescrip)
   VALUES('pr35','dp5','Onezie','20.00','1-2 years','Its a boy!');


select * 
from products
ORDER BY departid ASC

--Inventory--
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i01','pr1','50');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i02','pr2','100');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i03','pr3','45');   
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i04','pr4','25');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i05','pr5','100');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i06','pr6','200');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i07','pr7','10');
INSERT INTO inventory(invid, productid, quantity)
   VALUES('i08','pr9','120');
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
   VALUES('s01','i22','2014-12-03','50','90');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s01','i01','2014-12-03','50','90');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s01','i30','2014-12-03','50','90'); 

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s01','i07','2014-12-25','50','90');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s02','i10','2014-12-23','50','90');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s02','i02','2014-11-13','50','90');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s02','i13','2014-1-01','50','90');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s02','i32','2014-11-02','50','90');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s03','i03','2014-11-03','50','90');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s03','i27','2014-12-01','50','90');

INSERT INTO productsSupplied(supplyid, invid, datePurchased, quantityPurchased, totalPriceUSD)
   VALUES('s03','i11','2014-12-02','50','90');

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
  VALUES('pro1','001','pr2');

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro2','003','pr3');

INSERT INTO productOrders(productOrderid, orderid, productid)
  VALUES('pro3','002','pr9');  

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


-- Views --

