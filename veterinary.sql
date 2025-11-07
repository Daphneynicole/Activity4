--Veterinary Clinic Database Schema--
CREATE TABLE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors(
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices( 
    invoiceid INT PRIMARY KEY, 
    ownerid INT, 
    doctorid INT, 
    petid INT, 
    amount DECIMAL(10,2), 
    invoice_date DATE, 
    FOREIGN KEY (ownerid) 
    REFERENCES owners(ownerid), 
    FOREIGN KEY (doctorid) 
    REFERENCES doctors(doctorid), 
    FOREIGN KEY (petid) 
    REFERENCES pets(petid) );

    CREATE TABLE medicalrecords(
    recordid INT PRIMARY KEY,
    animalid INT,
    doctorid INT,
    visitdate DATE,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctorid(doctorid)
    );

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid) VALUES
(1, 'Buddy', 'Dog', 'Labrador Retriever', '2020-03-15', 'Male', 'Golden', 1),
(2, 'Luna', 'Cat', 'Persian', '2019-11-20', 'Female', 'White', 2),
(3, 'Max', 'Dog', 'German Shepherd', '2021-01-05', 'Male', 'Black and Tan', 3),
(4, 'Milo', 'Cat', 'Siamese', '2022-06-18', 'Male', 'Cream', 4),
(5, 'Bella', 'Dog', 'Shih Tzu', '2020-07-25', 'Female', 'Brown', 5),
(6, 'Chloe', 'Cat', 'British Shorthair', '2021-09-12', 'Female', 'Gray', 1),
(7, 'Rocky', 'Dog', 'Bulldog', '2018-02-28', 'Male', 'White and Brown', 2),
(8, 'Shadow', 'Cat', 'Bombay', '2020-10-10', 'Male', 'Black', 3),
(9, 'Coco', 'Dog', 'Poodle', '2022-05-06', 'Female', 'Cream', 4),
(10, 'Ginger', 'Cat', 'Maine Coon', '2019-03-30', 'Female', 'Orange', 5);
