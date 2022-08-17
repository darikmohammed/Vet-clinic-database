CREATE TABLE INVOICES (
    ID INT GENERATED ALWAYS AS IDENTITY, 
    TOTAL_AMOUNT DECIMAL NOT NULL,
    GENERATED_AT TIMESTAMP,
    PAYED_AT TIMESTAMP,
    MEDICAL_HISTORY_ID INT, 

    PRIMARY KEY (ID);
);

CREATE TABLE INVOICE_ITEMS(
    ID INT GENERATED ALWAYS AS IDENTITY, 
    UNIT_PRICE DECIMAL NOT NULL, 
    QUANTITY INT NOT NULL,
    TOTAL_PRICE DECIMAL NOT NULL,
    INVOICE_ID INT NOT NULL,
    TREATMENT_ID INT NOT NULL,

    PRIMARY KEY (ID);
);

CREATE TABLE PATIENTS (
ID INT GENERATED ALWAYS AS IDENTITY,
NAME VARCHAR(255) NOT NULL,
DATE_OF_BIRTH DATE NOT NULL,

PRIMARY KEY(ID)
);

CREATE TABLE MEDICAL_HISTORIES (
    ID INT GENERATED ALWAYS AS IDENTITY,
    ADMITTED_AT TIMESTAMP,
    PATIENT_ID INT NOT NULL,
    STATUS VARCHAR(120),

    PRIMARY KEY(ID)
);

CREATE TABLE TREATMENTS (
    ID INT GENERATED ALWAYS AS IDENTITY, 
    TYPE VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL, 

    PRIMARY KEY(ID)
)


