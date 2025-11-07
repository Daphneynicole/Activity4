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
