-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 06, 2023 at 04:03 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wms`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--


  CREATE TABLE customer

  (UID varchar(20) primary key,
  CID varchar(20) NOT NULL,
  Cname varchar(30) NOT NULL,
  Email varchar(30) NOT NULL,
  NIC varchar(12) NOT NULL,
  UID VARCHAR NOT NULL FOREIGN KEY REFERENCES User (UID));

Select * from Customer

-- --------------------------------------------------------

CREATE TABLE customer_address

  (CNO varchar(20) NOT NULL Foreign Key REFERENCES Customer (CNO),
  City varchar(30) NOT NULL,
  Postalcode varchar(10) NOT NULL,
  Street_address varchar(30) NOT NULL);
 
Select * from customer_address
-- --------------------------------------------------------

CREATE TABLE customer_contact_number
 
 (CNO varchar(20) NOT NULL Foreign key REFERENCES Customer (CNO),
  Contact_number int(10) NOT NULL);

-- --------------------------------------------------------
Select * from customer_contact_number


CREATE TABLE customer_invoice 

 (CCID varchar(20) Primary key,
  Date date NOT NULL,
  Total_amount_payable varchar(30) NOT NULL,
  SONO varchar (20) Foreign Key REFERENCES Sales order (SONO));
-- --------------------------------------------------------
Select * from customer_invoice


CREATE TABLE delivery_note

(  DNID varchar(20) NOT NULL primary key,
  Date date NOT NULL,
  SONO varchar(20) NOT NULL Foreign Key REFERENCES Sales order (SONO));

Select * from delivery_note
-- --------------------------------------------------------

CREATE TABLE finished_product

( EPID varchar(20) Primary key,
  Brand_name varchar(20) NOT NULL,
  FPname varchar(30) NOT NULL,
  Manufacture_date date NOT NULL,
  Expiry_date date NOT NULL,
  Description varchar(100) NOT NULL,
  Dosage_form varchar(30) NOT NULL,) ;

-- --------------------------------------------------------
Select * from finished_product

CREATE TABLE finish_product_stock

( SID varchar(20) primary key,
  Unit_price varchar(30) NOT NULL,
  Date date NOT NULL,
  Stock_quantity varchar(30) NOT NULL,
 

-- --------------------------------------------------------
Select * from finish_product_stock


CREATE TABLE good_recived_note 

(GRNID varchar(20) primary key,
  Date date NOT NULL,
  POID varchar(20) NOT NULL Foreign Key REFERENCES purchase_order (POID));


-- --------------------------------------------------------
Select * from good_recived_note

CREATE TABLE purchase_order 

(POID varchar(20) primary key,
  Date date NOT NULL,
  SNO varchar(20) NOT NULL Foreign Key REFERENCES supplier (SID),
  UNO varchar(20) NOT NULL Foreign Key REFERENCES storekeeper (UNO),); 

-- --------------------------------------------------------
Select * from purchase_order


CREATE TABLE purchase_order_shipaddress

( POID varchar(20) NOT NULL Foreign Key REFERENCES purchase_order (POID),
  Street_address varchar(30) NOT NULL,
  City varchar(20) NOT NULL,
  Postalcode varchar(10) NOT NULL ) ;

-- --------------------------------------------------------
Select * from purchase_order_shipaddress


CREATE TABLE purchase_return

( PRID varchar(20) primary key,
  Date date NOT NULL,
  PONO varchar(20) NOT NULL Foreign Key REFERENCES purchase_order(POID)); 

-- --------------------------------------------------------
Select * from purchase_return


CREATE TABLE raw_material

 (RMID varchar(20) NOT NULL primary key,
  RMname varchar(30) NOT NULL,
  Status varchar(20) NOT NULL,
  Substance_type varchar(20) NOT NULL);
 

INSERT INTO raw_material (RMID, RMname, Status, Substance_type) VALUES
(0007,  Penicillium mold, Bulk, asasasa),
(0008, Ephedra sinica, Bulk, sadsadada);

Select * from raw_material
-- --------------------------------------------------------

CREATE TABLE raw_material_stock

( RMSID varchar(20) NOT NULL primary key,
  Unit_price varchar(30) NOT NULL,
  Date date NOT NULL,
  Quantity varchar(30) NOT NULL);
  

INSERT INTO raw_material_stock (RMSID, Unit_price, Date, Quantity) VALUES
(0011, 20000, 2023-02-25, 20),
(0012, 30000, 2023-02-24, 20);

Select * from raw_material_stock
-- --------------------------------------------------------


CREATE TABLE sales_order 

 (UNO varchar(20) 
  SOID varchar(20) NOT NULL primary key,
  Date_of_order date NOT NULL,
  CNO varchar(20) NOT NULL Foreign Key REFERENCES Customer(CID));
 
Select * from sales_order

-- --------------------------------------------------------

CREATE TABLE sales_order_ship_address

 (SONO varchar(20) NOT NULL Foreign Key REFERENCES sales_order (SOID),
  Postal_code varchar(10) NOT NULL,
  City varchar(20) NOT NULL,
  Street_address varchar(30) NOT NULL) ;

Select * from sales_order_ship_address

-- --------------------------------------------------------

CREATE TABLE sales_return

 ( SRID varchar(20) Primary key,
   Returned_quantity varchar(20) NOT NULL,
   Date date (8) NOT NULL,
   SONO varchar(20) NOT NULL Foreign Key REFERENCES sales_order (SOID));

   Select * from sales_return

-- --------------------------------------------------------

CREATE TABLE storekeeper

 (UNO varchar(20) NOT NULL Foreign Key REFERENCES sales_order(UNO);
  Level varchar(30) NOT NULL) ;

   Select * from storekeeper

-- --------------------------------------------------------


CREATE TABLE supplier 

( SID varchar(20) NOT NULL primary Key,
  Sname varchar(30) NOT NULL,
  Email varchar(20) NOT NULL,
  Contact_number varchar(10) NOT NULL,);



INSERT INTO supplier (SID, Sname, Email, Contact_number) VALUES
(0005, John, shehan2015@gmail.com, 0762023248);

   Select * from supplier

-- --------------------------------------------------------


CREATE TABLE supplier_address 

( SNO varchar(20) NOT NULL Foreign Key REFERENCES supplier (SID),
  Postal_code varchar(10) NOT NULL,
  City varchar(20) NOT NULL,
  Street_address varchar(20) NOT NULL) 

   Select * from supplier_address
-- --------------------------------------------------------


CREATE TABLE supplier_invoice

 (SIID varchar(20) NOT NULL primary key,
  Date date NOT NULL,
  Total_amount_payable varchar(30) NOT NULL,
  POID varchar(20) NOT NULL Foreign Key REFERENCES purchase_order (POID)) ;

   Select * from supplier_address

-- --------------------------------------------------------


CREATE TABLE user 

(UID varchar(20) NOT NULL,
  User_name varchar(30) NOT NULL,
  Password varchar(20) NOT NULL,
  NIC varchar(12) NOT NULL,
  Email varchar(30) NOT NULL,
  First_name varchar(30) NOT NULL,
  Last_name varchar(30) NOT NULL,
  Status varchar(20) NOT NULL,
  PRIMARY KEY (`UID`))

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `User_name`, `Password`, `NIC`, `Email`, `First_name`, `Last_name`, `Status`) VALUES
('0001', 'Admin', 'Admin123', '995380730V', 'ruwaniranasinghe2019@gmail.com', 'Ruwani', 'Ranasinghe', 'Internal'),
('0002', 'Shehan', 'Shehan123', '995380735V', 'shehan2013@gmail.com', 'Shehan', 'John', 'Intern'),
('0004', 'Ravishka', 'Ravishka123', '957363636V', 'ravishka2015@gmail.com', 'Ravishka', 'Galabada', 'Internal'),
('0003', 'Sanara', 'Sanara123', '9856356353V', 'sanara2013@gmail.com', 'Sanara', 'karunadasa', 'Internal');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE IF NOT EXISTS `user_address` (
  `UNO` varchar(20) NOT NULL,
  `Street_address` varchar(30) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Postalcode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_number`
--

DROP TABLE IF EXISTS `user_contact_number`;
CREATE TABLE IF NOT EXISTS `user_contact_number` (
  `UNO` varchar(20) NOT NULL,
  `Contact_number` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_manager`
--

DROP TABLE IF EXISTS `warehouse_manager`;
CREATE TABLE IF NOT EXISTS `warehouse_manager` (
  `UNO` varchar(20) NOT NULL,
  `Type` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
