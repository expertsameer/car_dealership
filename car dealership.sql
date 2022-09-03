Create Table Car(
Serialno INT,
Car_Id INT Primary Key,
Make Varchar(20),
Model Varchar(25),
Colour Varchar(20),
[Year] INT,
Car_for_sale Varchar(2),
);
Create Table Salesperson(
Salesperson_Id INT Primary Key,
FIRST_NAME Varchar(20),
LAST_NAME Varchar(20),
);
Create Table Customer(
Customer_Id  INT Primary Key,
FIRST_NAME Varchar(20),
LAST_NAME Varchar(20),
Phone_Number INT,
[Address] Varchar(30),
City Varchar(20),
Province Varchar(20),
Country Varchar(20),
Postal_code INT,
);
Create Table Sales_Invoice(
Invoice_Number INT Primary Key,
[Date] INT,
CarId INT Foreign Key References Car (Car_Id),
CustomerId INT Foreign Key References Customer (Customer_Id),
SalespersonId INT Foreign Key References Salesperson (Salesperson_Id),
);


Create Table Service_Ticket(
ServiceTicket_Id INT Primary Key,
Service_Ticket_Number INT,
Car_ID INT Foreign Key References Car (Car_Id), 
Customer_Id INT Foreign Key References Customer (Customer_Id),
Date_Received Varchar(20),
Comments Varchar(30),
Date_Returned_to_Customer Varchar(20),
);
Create Table Machanics(
Machanics_Id INT Primary Key,
FIRST_NAME Varchar(20),
LAST_NAME Varchar(20),
);
Create Table Services1(
Service_Id INT Primary Key,
[Service_Name] Varchar(25),
Hourly_Rate INT,
);

Create Table Service_Machanics(
Service_MachanicsId INT Primary Key,
Service_Ticket_Id INT Foreign Key References Service_Ticket (ServiceTicket_Id),
Service_Id INT Foreign Key References Services1 (Service_Id),
Machanics_Id INT Foreign Key References Machanics (Machanics_Id),
[Hours] INT,
Comment Varchar,
Rate INT,
);
Create Table Parts(
Parts_Id INT Primary Key,
Part_Number INT,
Description Varchar(30),
Purchase_Price INT,
Retail_Price INT,
);

Create Table Parts_Used(
Parts_Used_Id INT Primary Key,
Parts_Id INT Foreign Key References Parts (Parts_Id),
Service_Ticket_Id INT Foreign Key References Service_Ticket (ServiceTicket_Id),
Number_Used INT,
Price INT,
);

Insert into Car Values(1,123,'Suzuki','Cultus','Black',2009,'N')
Insert into Car Values(2,124,'Honda','City','Blue',2021,'N')
Insert into Car Values(3,125,'Suzuki','hitex','White',2010,'Y')
Insert into Car Values(4,126,'Honda','City','Silver',2018,'N')
Insert into Car Values(5,127,'Suzuki','Vitz','Red',2010,'Y')
Insert into Car Values(6,128,'Honda','Corola','Yellow',2020,'Y')

Select * From Car

Insert into Salesperson Values(001,'Fawad','Siddique')
Insert into Salesperson Values(002,'Haris','Yasir')
Insert into Salesperson Values(003,'Sameer','Rafiq')
 
Select * From Salesperson
 
Insert into Customer Values(666,'Idrees','Muzzamil',722,'ShadmmanArea','Karchi','sindh','Pakistan',405)
Insert into Customer Values(661,'Hamza','Affan',765,'Ranchoreline','Hyderabad','Sindh','Pakistan',605)
Insert into Customer Values(662,'Yaqoob','Ahsan',567,'Nagan','Karachi','Sindh','Pakistan',705)
Select * From Customer

Insert into Sales_Invoice Values(234,22,125,662,2)
Insert into Sales_Invoice Values(235,24,127,666,3)
Insert into Sales_Invoice Values(236,28,128,661,1)
Select * From Sales_Invoice

Insert into Service_Ticket Values(9001,5,125,662,'APR','good','May')
Insert into Service_Ticket Values(9002,6,127,666,'MAR','fair','APR')
Insert into Service_Ticket Values(9003,10,128,661,'MAY','weldon','JUNE')
Select * From Service_Ticket

Insert into Machanics Values(555,'Salman','yasir')
Insert into Machanics Values(556,'Yaseen','Waqqar')
Insert into Machanics Values(557,'Ahmed','Alvi')
Insert into Machanics Values(558,'Sajid','Naeem')
Insert into Machanics Values(559,'Sarwar','Patel')
Select * From Machanics

Insert into Services1 Values(33,'Pucture',500)
Insert into Services1 Values(34,'Breakshoe',6000)
Insert into Services1 Values(35,'Hadle Problem',7000)
Insert into Services1 Values(36,'Tyre change',10000)
Insert into Services1 Values(37,'All in one service',20000)
Select * From Services1 

Insert into Service_Machanics Values(90,9002,37,558,2,'',40000)
Insert into Service_Machanics Values(91,9003,35,555,5,'',35000)
Insert into Service_Machanics Values(92,9001,33,559,3,'',1500)
Select * From Service_Machanics

Insert into Parts Values(42,4.2,'Screw Driver',1000,1500)
Insert into Parts Values(55,5.5,'Hammer',200,500)
Insert into Parts Values(15,10.5,'Tyre',20000,30000)
Insert into Parts Values(76,7.5,'Gas tube',15000,18000)
Insert into Parts Values(96,100,'cylinder',1300,1600)
Select * From Parts

Insert into Parts_Used Values(28,96,9002,100,1600)
Insert into Parts_Used Values(29,55,9002,5,500)
Insert into Parts_Used Values(30,15,9003,10,30000)
Select * From Parts_Used


Select * From Car
Select * From Salesperson
Select * From Customer
Select * From Sales_Invoice
Select * From Service_Ticket
Select * From Machanics
Select * From Services1 
Select * From Service_Machanics
Select * From Parts
Select * From Parts_Used

Alter procedure spGetCustomer
as
begin
select Customer_Id,FIRST_NAME,Phone_Number,City from Customer
end

spGetCustomer

Alter procedure spGetsalesmen
@Salesperson_Id Int,
@FIRST_NAME Varchar (20)
as
begin
select * from Salesperson where Salesperson_Id=@Salesperson_Id and FIRST_NAME=@FIRST_NAME;
end

execute spGetsalesmen 1,'Fawad';