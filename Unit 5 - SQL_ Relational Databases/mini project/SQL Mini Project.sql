--Creation of tables

CREATE TABLE CLAIMS(
    Claim_ID_Number VARCHAR(100) NOT NULL PRIMARY KEY,
    Claim_Receipt_DATE DATE NOT NULL,
    Claim_Description VARCHAR(255),
    Claimant_Birth_DATE DATE NOT NULL,
    Law_Suit_Indicator VARCHAR(10),
    Claimant_First_Name VARCHAR(255) NOT NULL,
    Claimant_Last_Name VARCHAR(255) NOT NULL,
    Policy_Number VARCHAR(50),
    Claimant_Occupation VARCHAR(255),
    Loss_DATE DATE NOT NULL,
    Claim_Amount INT,
    Claim_Paid_Amount INT,
    Claim_Paid_DATE DATE null)

CREATE TABLE CUSTOMERS(
    Customer_ID_Number VARCHAR(50) PRIMARY KEY,
    Customer_First_Name VARCHAR(100) NOT NULL,
    Customer_Last_Name VARCHAR(100) NOT NULL,
    Customer_Type VARCHAR(100),
    Business_Name VARCHAR (255),
    Address_Street_Name_Line_One VARCHAR(255) NOT NULL,
    Address_Street_Name_Line_Two VARCHAR(255),
    Address_City VARCHAR(255) NOT NULL,
    Address_State VARCHAR(255) NOT NULL,
    Address_Postal_Code CHAR(5) NOT NULL,
    Address_Type VARCHAR(255),
    Customer_Birth_DATE DATE,
    Risk_Score INT);


CREATE TABLE POLICYDETAILS(
    Policy_Number CHAR(255),
    Policy_Effective_DATE DATE NOT NULL,
    Policy_Expiration_DATE DATE NOT NULL,
    Policy_Limit INT NOT NULL,
    Policy_Type VARCHAR(50) NOT NULL,
    Currency_Type VARCHAR(10) NOT NULL,
    Premium_Cost INT,
    Customer_ID_Number INT);

CREATE TABLE RESERVES(
    Customer_ID_Number INT,
    Policy_Number VARCHAR(255),
    Reserved_Amount INT NOT NULL,
    Reserved_Date DATE NOT NULL);

--Population of data

COPY CLAIMS(
    Claim_ID_Number,
    Claim_Receipt_Date,
    Claim_Description,
    Claimant_Birth_DATE,
    Law_Suit_Indicator,
    Claimant_First_Name,
    Claimant_First_Name,
    Policy_Number,
    Claimant_Occupation,
    Loss_DATE,
    Claim_Amount,
    Claim_Paid_Amount,
    Claim_Paid_DATE)
from 'Users/Shared/Insurance_Sample Data.csv'
delimiter ',' CSV header

COPY RESERVES(
    Policy_Number,
    Reserved_Amount,
    Reserved_Date)
from 'Users/Shared/Insurance_Reserves.csv'
delimiter ',' CSV header

--Form any 5 SQL to extract information from the tables using join,where, and other conditional operators.

SELECT * FROM CUSTOMERS
WHERE Risk_Score>40;

SELECT Customer_ID_Number,Reserved_Date
FROM RESERVES
WHERE Reserved_Date = '3/15/2020';

SELECT COUNT(Policy_Type) FROM POLICYDETAILS
WHERE Policy_Type='Property';

SELECT * FROM CUSTOMERS 
WHERE Customer_Type='Individual';

SELECT SUM(Claim_Paid_Amount)
FROM CLAIMS
WHERE Claimant_First_Name='Aditya'