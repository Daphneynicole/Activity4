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

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
    (1, 'Juan', 'Dela Cruz', '123 Mabini St., Manila', '09171234567', 'juan.delacruz@example.com'),
    (2, 'Maria', 'Santos', '45 Rizal Ave., Quezon City', '09192345678', 'maria.santos@example.com'),
    (3, 'Pedro', 'Reyes', '89 Bonifacio St., Pasig', '09203456789', 'pedro.reyes@example.com'),
    (4, 'Ana', 'Gonzales', '67 Luna St., Makati', '09314567890', 'ana.gonzales@example.com'),
    (5, 'Jose', 'Lopez', '12 Mabuhay Rd., Taguig', '09425678901', 'jose.lopez@example.com'),
    (6, 'Carmen', 'Torres', '34 Mabato St., Mandaluyong', '09536789012', 'carmen.torres@example.com'),
    (7, 'Luis', 'Fernandez', '56 Malvar St., Marikina', '09647890123', 'luis.fernandez@example.com'),
    (8, 'Rosa', 'Navarro', '78 Roxas Blvd., Manila', '09758901234', 'rosa.navarro@example.com'),
    (9, 'Ricardo', 'Aguilar', '90 Ortigas Ave., Pasig', '09869012345', 'ricardo.aguilar@example.com'),
    (10, 'Elena', 'Morales', '11 P. Burgos St., Makati', '09970123456', 'elena.morales@example.com');


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

INSERT INTO appointments (appointid, animalid, appointdate, reason) 
VALUES
    (1, 1, '2025-01-05', 'General check-up'),
    (2, 2, '2025-01-10', 'Vaccination'),
    (3, 3, '2025-01-12', 'Skin irritation treatment'),
    (4, 4, '2025-01-15', 'Follow-up consultation'),
    (5, 5, '2025-02-01', 'Ear cleaning'),
    (6, 1, '2025-02-05', 'Dental cleaning'),
    (7, 3, '2025-02-08', 'Deworming'),
    (8, 6, '2025-02-10', 'Surgery pre-evaluation'),
    (9, 7, '2025-02-12', 'Vaccination booster'),
    (10, 8, '2025-02-15', 'Injury check-up');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
    (1, 1, 50.00, '09:30:00'),
    (2, 2, 75.00, '14:15:00'),
    (3, 3, 100.00, '11:00:00'),
    (4, 4, 200.00, '13:45:00'),
    (5, 5, 80.00, '10:30:00'),
    (6, 6, 30.00, '15:00:00'),
    (7, 7, 75.00, '09:15:00'),
    (8, 8, 150.00, '16:30:00'),
    (9, 9, 60.00, '14:45:00'),
    (10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

    ALTER TABLE owners ADD COLUMN registereddate DATE;

    ALTER TABLE invoices
RENAME COLUMN paymentdate TO paymenttime;

DELETE FROM appointments
WHERE animalid = (
    SELECT animalid
    FROM animals
    WHERE name = 'Simba' AND species = 'Cat'
);

UPDATE doctors
SET dlastname = 'Reyes-Gonzales'
WHERE dfirstname = 'Sofia';
