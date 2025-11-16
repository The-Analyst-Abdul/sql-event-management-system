CREATE DATABASE ems;
USE ems;

  -- tables created in this database (events_,users,registrations,payments,speakers,sessions,sponsers,attendees) 
  -- let's create table for events
  
CREATE TABLE events_(
event_id INT PRIMARY KEY AUTO_INCREMENT,
event_name VARCHAR(1000), 
event_descreption VARCHAR(1000),
event_date DATE,
event_time TIME,
event_location VARCHAR(5000),
event_capacity VARCHAR(5000)
);

  -- let's create table for users
  
CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
user_firstName VARCHAR(1000),
user_lastName VARCHAR(1000),
password_ VARCHAR(1000),
email VARCHAR(200),
role_ VARCHAR(500),
user_details VARCHAR(1000)
);

  -- let's create table for registrations (REFERENCES Used In This Table *events_* , *users*)
  
CREATE TABLE registrations(
registration_id INT PRIMARY KEY AUTO_INCREMENT,
event_id INT,
user_id INT,
registration_date DATE,
registration_status VARCHAR(1000),
CONSTRAINT fk_event_id FOREIGN KEY (event_id) REFERENCES events_(event_id),
CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);  

  -- let's create table for payments (REFERENCES used In This TABLE *registrations*)
  
CREATE TABLE payments(
payment_id INT PRIMARY KEY AUTO_INCREMENT,
registration_id INT,
payment_method VARCHAR(1000),
payment_date DATE,
payment_amount VARCHAR(1000),
payment_status VARCHAR(200),
CONSTRAINT fk_registration_id FOREIGN KEY (registration_id) REFERENCES registrations (registration_id)
);

-- let's create table for speakers

CREATE TABLE speakers(
speaker_id INT PRIMARY KEY AUTO_INCREMENT,
speaker_name VARCHAR(200),
speaker_brand VARCHAR(100),
speaker_bio VARCHAR(1000),
speaker_rent VARCHAR(500),
speaker_shopName VARCHAR(500)
);

  -- let's create table for sessions (REFERENECES USED IN THIS TABEL *events_* , *speakers*)
  
CREATE TABLE sessions(
session_id INT PRIMARY KEY AUTO_INCREMENT,
event_id INT,
session_name VARCHAR(800),
session_descreption VARCHAR(5000),
session_date DATE,
session_time TIME,
speaker_id INT,
CONSTRAINT fk_eventId FOREIGN KEY (event_id) REFERENCES events_(event_id),
CONSTRAINT fk_speaker_id FOREIGN KEY (speaker_id) REFERENCES speakers (speaker_id)
);  

  -- let's create table for sponsers
  
CREATE TABLE sponsors(
sponsor_id INT PRIMARY KEY AUTO_INCREMENT,
event_id INT,
sponsor_name VARCHAR(1000),
sponsor_contact VARCHAR(1000),
sponsor_descreption VARCHAR(1000)
);

  -- let's create table for attendees
  
CREATE TABLE attendees(
attendee_id INT PRIMARY KEY AUTO_INCREMENT,
registration_id INT,
first_name VARCHAR (100),
last_name VARCHAR(100),
email VARCHAR(100),
phone VARCHAR(100),
address VARCHAR(100),
city VARCHAR(100),
state VARCHAR(100),
zipcode VARCHAR(100),
country VARCHAR(100)
);

  -- inserting values into - events_

INSERT INTO events_ (event_name, event_descreption, event_date, event_time, event_location, event_capacity) VALUES
('Tech Expo 2025', 'Showcasing the latest tech.', '2025-05-01', '09:00:00', 'Tech Arena', '5000'),
('Music Fest 2025', 'Live performances by top bands.', '2025-06-15', '17:00:00', 'Open Air Park', '10000'),
('Art Gallery Exhibition', 'Modern art and sculpture display.', '2025-07-10', '18:30:00', 'City Art Museum', '200'),
('Startup Conference', 'Networking and workshops for startups.', '2025-08-20', '10:00:00', 'Conference Center', '1500'),
('Food & Wine Festival', 'Tasting event with gourmet food and wines.', '2025-09-05', '12:00:00', 'Riverfront Park', '3000'),
('Fashion Week 2025', 'Fashion shows by renowned designers.', '2025-09-15', '19:00:00', 'Grand Ballroom', '2000'),
('Health & Wellness Expo', 'Promoting fitness and mental well-being.', '2025-10-01', '08:00:00', 'Convention Center', '1200'),
('Film Screening Night', 'Premiere of the latest blockbuster.', '2025-11-12', '20:00:00', 'Cineplex Theater', '500'),
('Nonprofit Gala', 'Fundraising dinner and charity auction.', '2025-12-05', '18:00:00', 'Downtown Hotel', '600'),
('Holiday Market 2025', 'Seasonal shopping event for the holidays.', '2025-12-20', '10:00:00', 'City Square', '10000');

  -- inserting values into table - users
  
INSERT INTO users (user_firstName, user_lastName, password_, email, role_, user_details) 
VALUES
('John', 'Doe', 'password123', 'john.doe@email.com', 'Admin', 'Lead developer with 5 years of experience in web development.'),
('Jane', 'Smith', 'securepassword', 'jane.smith@email.com', 'User', 'Marketing specialist with a passion for content creation.'),
('Emily', 'Johnson', 'password2025', 'emily.johnson@email.com', 'Editor', 'Content editor with a focus on technology and innovation.'),
('Michael', 'Brown', 'mikepassword', 'michael.brown@email.com', 'User', 'Project manager skilled in managing large-scale projects.'),
('Sarah', 'Davis', 'sarahpassword', 'sarah.davis@email.com', 'User', 'Designer with experience in both digital and print media.'),
('David', 'Wilson', 'davidpassword', 'david.wilson@email.com', 'Admin', 'Senior system administrator overseeing the IT infrastructure.'),
('Laura', 'Martinez', 'laurapassword', 'laura.martinez@email.com', 'Editor', 'Experienced editor specializing in creative writing and storytelling.'),
('James', 'Garcia', 'jamespassword', 'james.garcia@email.com', 'User', 'Customer support representative with excellent problem-solving skills.'),
('Olivia', 'Lopez', 'olivia123', 'olivia.lopez@email.com', 'Admin', 'HR manager with a strong background in employee relations.'),
('Daniel', 'Miller', 'danielpassword', 'daniel.miller@email.com', 'User', 'Software engineer with a focus on backend development.');

  -- inserting values into table - registrations
  
INSERT INTO registrations (event_id, user_id, registration_date, registration_status) 
VALUES
(1, 2, '2025-04-15', 'Confirmed'),
(2, 4, '2025-05-10', 'Pending'),
(3, 6, '2025-06-20', 'Confirmed'),
(4, 1, '2025-07-15', 'Confirmed'),
(5, 3, '2025-08-25', 'Cancelled'),
(6, 5, '2025-09-10', 'Confirmed'),
(7, 7, '2025-10-01', 'Pending'),
(8, 8, '2025-11-05', 'Confirmed'),
(9, 9, '2025-12-10', 'Cancelled'),
(10, 10, '2025-12-15', 'Confirmed');

  -- inserting values into table - payment
  
INSERT INTO payments (registration_id, payment_method, payment_date, payment_amount, payment_status) 
VALUES
(1, 'Credit Card', '2025-04-16', '100.00', 'Completed'),
(2, 'PayPal', '2025-05-11', '150.00', 'Pending'),
(3, 'Bank Transfer', '2025-06-21', '200.00', 'Completed'),
(4, 'Credit Card', '2025-07-16', '75.00', 'Failed'),
(5, 'PayPal', '2025-08-26', '50.00', 'Completed'),
(6, 'Credit Card', '2025-09-11', '120.00', 'Completed'),
(7, 'Bank Transfer', '2025-10-02', '180.00', 'Pending'),
(8, 'Credit Card', '2025-11-06', '250.00', 'Completed'),
(9, 'PayPal', '2025-12-11', '95.00', 'Failed'),
(10, 'Credit Card', '2025-12-16', '140.00', 'completed');

  -- inserting values into table - speakers
  
INSERT INTO speakers (speaker_name, speaker_brand, speaker_bio, speaker_rent, speaker_shopName) VALUES
('John Adams', 'Bose', 'Experienced in audio tech.', '150', 'Adams Audio'),
('Emily Turner', 'JBL', 'Specialist in sound systems.', '200', 'Turner Sound'),
('Michael Lee', 'Sony', 'Expert in live sound setups.', '250', 'Lee Audio Co.'),
('Sarah Mitchell', 'Sennheiser', 'Professional audio engineer.', '300', 'Mitchell Sound'),
('David Wright', 'Yamaha', 'Providing event sound tech.', '180', 'Wright Audio'),
('Olivia Harris', 'Pioneer', 'Focused on sound for events.', '220', 'Harris Audio'),
('James Robinson', 'Electro-Voice', 'Specializes in high-end audio.', '280', 'Robinson Sound'),
('Laura Green', 'Klipsch', 'Sound systems for concerts.', '210', 'Green Audio'),
('Daniel Clark', 'QSC', 'Audio consultant for large events.', '330', 'Clark Audio'),
('Sophia Adams', 'Mackie', 'Sound tech for live performances.', '170', 'Adams Sound');

  -- inserting values into table - session
  
INSERT INTO sessions (event_id, session_name, session_descreption, session_date, session_time, speaker_id) VALUES
(1, 'AI Innovations', 'Latest trends in AI development.', '2025-05-01', '10:00:00', 1),
(2, 'Rock Band Performances', 'Live performance by top rock bands.', '2025-06-15', '18:00:00', 2),
(3, 'Modern Art Trends', 'A deep dive into modern art and sculptures.', '2025-07-10', '14:00:00', 3),
(4, 'Startup Growth', 'Strategies for growing your startup.', '2025-08-20', '11:00:00', 4),
(5, 'Gourmet Cooking', 'Masterclass with renowned chefs.', '2025-09-05', '13:00:00', 5),
(6, 'Sustainable Fashion', 'Fashion shows promoting eco-friendly trends.', '2025-09-15', '17:00:00', 6),
(7, 'Fitness for Life', 'Tips on staying healthy and fit.', '2025-10-01', '09:00:00', 7),
(8, 'Cinematography Mastery', 'Learn from the best in film production.', '2025-11-12', '19:00:00', 8),
(9, 'Fundraising Success', 'How to organize successful charity events.', '2025-12-05', '16:00:00', 9),
(10, 'Holiday Shopping Secrets', 'Tips for the best holiday shopping deals.', '2025-12-20', '12:00:00', 10);
 
  -- inserting values into table - sponsers
  
INSERT INTO sponsors (event_id, sponsor_name, sponsor_contact, sponsor_descreption) VALUES
(1, 'TechCorp', 'contact@techcorp.com', 'AI solutions for tech events.'),
(2, 'SoundWave', 'info@soundwave.com', 'Audio solutions for live events.'),
(3, 'ArtSupplies', 'support@artsup.com', 'Supplies for artists and creators.'),
(4, 'StartUp Boost', 'contact@startup.com', 'Helping startups with funding.'),
(5, 'GourmetFoods', 'gourmet@foodco.com', 'Catering with premium food items.'),
(6, 'FashionForward', 'fashion@fwdapparel.com', 'Sustainable fashion for all.'),
(7, 'WellnessCo', 'contact@wellness.com', 'Health and wellness solutions.'),
(8, 'CinePremiere', 'premiere@cine.com', 'Film distribution and premieres.'),
(9, 'HopeFound', 'info@hopefound.org', 'Nonprofit supporting communities.'),
(10, 'HolidayRetail', 'sales@holidayshop.com', 'Seasonal gifts and retail goods.');
 
  -- inserting values into table - attendees
  
INSERT INTO attendees (registration_id, first_name, last_name, email, phone, address, city, state, zipcode, country)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890', '123 Elm Street', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '234-567-8901', '456 Oak Avenue', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Emily', 'Johnson', 'emily.johnson@email.com', '345-678-9012', '789 Pine Road', 'Chicago', 'IL', '60601', 'USA'),
(4, 'Michael', 'Brown', 'michael.brown@email.com', '456-789-0123', '101 Maple Street', 'San Francisco', 'CA', '94101', 'USA'),
(5, 'Sarah', 'Davis', 'sarah.davis@email.com', '567-890-1234', '202 Birch Blvd', 'Miami', 'FL', '33101', 'USA'),
(6, 'David', 'Wilson', 'david.wilson@email.com', '678-901-2345', '303 Cedar Lane', 'Atlanta', 'GA', '30301', 'USA'),
(7, 'Laura', 'Martinez', 'laura.martinez@email.com', '789-012-3456', '404 Redwood Drive', 'Dallas', 'TX', '75201', 'USA'),
(8, 'James', 'Garcia', 'james.garcia@email.com', '890-123-4567', '505 Sequoia Street', 'Houston', 'TX', '77001', 'USA'),
(9, 'Olivia', 'Lopez', 'olivia.lopez@email.com', '901-234-5678', '606 Birchwood Lane', 'Phoenix', 'AZ', '85001', 'USA'),
(10, 'Daniel', 'Miller', 'daniel.miller@email.com', '012-345-6789', '707 Pinehurst Road', 'Boston', 'MA', '02101', 'USA');


  -- Retrive All Records From The Table - events_
SELECT * FROM events_;


  -- Retrive All Records From The Table - users
SELECT * FROM users;

 
   -- Retrive All Records From The Table - Registrations
SELECT * FROM registrations;


   -- Retrive All Records From The Table - Payments
SELECT * FROM payments;  


   -- Retrive All Records From The Table - Speakers
SELECT * FROM speakers;


   -- Retrive All Records From The Table - Sessions
SELECT * FROM sessions;


  -- Retrive All Records From The Table - Sponsors
SELECT * FROM sponsors;


  -- Retrive All Records From The Table - Attendees
SELECT * FROM attendees;


  -- 1.WHERE Clause (Retrive event_name = Tech Expo 2025 In The events Table By Using WHERE Command)
SELECT * FROM events_ 
WHERE event_name = 'Tech Expo 2025';


  -- 2.ORDER BY Clause (Retrive All Records From Users Table And Order The user_id Column In Desending Order)
SELECT * FROM users
ORDER BY user_id DESC;


  -- 3.GROUP BY Clause (Retrive The Maximum Amount From Table payment And Group by payment_method)
SELECT MAX(payment_method) 
AS MaxAmountOfPayment
FROM payments GROUP BY payment_method;  


  -- 4.HAVING Clause (Write a query to find all payment methods where the total payment amount greater than 100) (HAVING + GROUP BY) 
SELECT SUM(payment_amount)
FROM payments 
GROUP BY payment_method
HAVING SUM(payment_amount) > 300;


  -- JOINTS FUNCTION
  -- 5.INNER JOIN (Retrive The Record Of events By Users)
SELECT 
	  events_.event_name,
      users.user_firstName,
      users.user_lastname 
FROM
	  users
INNER JOIN 
      events_ ON events_.event_id = users.user_id;


  -- 6.LEFT JOIN (Retrieve all events with the names and emails of registered users, showing `NULL` for user details if no registrations exist.)
SELECT 
    e.event_name,
    e.event_date,
    e.event_location,
    u.user_firstName,
    u.user_lastName,
    u.email
FROM 
    events_ e
LEFT JOIN 
    registrations r ON e.event_id = r.event_id
LEFT JOIN 
    users u ON r.user_id = u.user_id;
    
    
  -- 7.RIGHT JOIN (Retrieve all users along with the events they are registered for, showing NULL for event details if a user is not registered for any event.)    
SELECT 
    u.user_firstName,
    u.user_lastName,
    u.email,
    e.event_name,
    e.event_date,
    e.event_location
FROM 
    users u
RIGHT JOIN 
    registrations r ON u.user_id = r.user_id
RIGHT JOIN 
    events_ e ON r.event_id = e.event_id;


  -- 8.CROSS JOIN (List all possible combinations of sponsors and attendees for event planning purposes)
SELECT 
    s.sponsor_name,
    s.sponsor_contact,
    s.sponsor_descreption,
    a.first_name,
    a.last_name,
    a.email
FROM 
    sponsors s
CROSS JOIN 
    attendees a;
