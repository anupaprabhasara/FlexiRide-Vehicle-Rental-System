-- ===============================
-- 1. CREATE DATABASE
-- ===============================
CREATE DATABASE IF NOT EXISTS flexiride_db;
USE flexiride_db;

-- ===============================
-- 2. TABLES WITHOUT FOREIGN KEYS
-- ===============================

-- Admins table (includes admin & manager using ENUM)
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Manager') NOT NULL
);

-- Users table (customers)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    nic_number VARCHAR(20) NOT NULL,
    address TEXT
);

-- Vehicles table
CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_name VARCHAR(100) NOT NULL,
    brand VARCHAR(50),
    model VARCHAR(50),
    vehicle_type VARCHAR(50),
    cost_per_km DECIMAL(10, 2) NOT NULL,
    availability_status ENUM('Available', 'Booked', 'Maintenance') DEFAULT 'Available',
    description TEXT
);

-- ===============================
-- 3. TABLES WITH FOREIGN KEYS
-- ===============================

-- Bookings table
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    vehicle_id INT,
    booking_date DATE NOT NULL,
    rental_start_date DATE NOT NULL,
    rental_end_date DATE NOT NULL,
    status ENUM('Pending', 'Confirmed', 'Cancelled', 'Completed') DEFAULT 'Pending',
    confirmed_by INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id) ON DELETE CASCADE,
    FOREIGN KEY (confirmed_by) REFERENCES admins(id) ON DELETE SET NULL
);

-- Feedbacks table
CREATE TABLE feedbacks (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Notifications table
CREATE TABLE notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    booking_id INT,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

-- ===============================
-- 4. SAMPLE DATA
-- ===============================

-- Admins
INSERT INTO admins (full_name, email, password, role) VALUES
('Anupa Prabhasara', 'info@anupa.lk', '1234', 'Admin'),
('Gamindu Kalmadu', 'gamindu@gmail.com', '12345', 'Manager');

-- Users
INSERT INTO users (full_name, email, password, phone, nic_number, address) VALUES
('Charlie Customer', 'charlie@mail.com', 'charlie123', '0771234567', '981234567V', '123 Main Street'),
('Diana Drive', 'diana@mail.com', 'diana123', '0777654321', '200056789V', '456 Side Lane');

-- Vehicles
INSERT INTO vehicles (vehicle_name, brand, model, vehicle_type, cost_per_km, availability_status, description) VALUES
('Swift Car', 'Suzuki', 'Swift', 'Hatchback', 25.00, 'Available', 'Fuel efficient and compact'),
('Hilux Truck', 'Toyota', 'Hilux', 'Pickup', 40.00, 'Maintenance', 'Heavy-duty pickup truck'),
('Civic Sedan', 'Honda', 'Civic', 'Sedan', 35.00, 'Available', 'Stylish and comfortable for long drives'),
('Ranger XLT', 'Ford', 'Ranger', 'Pickup', 45.00, 'Booked', 'High performance off-road pickup'),
('Axio Sedan', 'Toyota', 'Axio', 'Sedan', 30.00, 'Available', 'Perfect for city and highway travel'),
('Aqua Hybrid', 'Toyota', 'Aqua', 'Hatchback', 28.00, 'Maintenance', 'Eco-friendly and economical hybrid'),
('Vezel SUV', 'Honda', 'Vezel', 'SUV', 38.00, 'Available', 'Modern SUV with spacious interior'),
('CR-V AWD', 'Honda', 'CR-V', 'SUV', 42.00, 'Booked', 'All-wheel drive comfort and space'),
('Tucson 2022', 'Hyundai', 'Tucson', 'SUV', 43.00, 'Available', 'Luxury mid-size SUV with smart tech'),
('Premio 260', 'Toyota', 'Premio', 'Sedan', 32.00, 'Available', 'Executive class with premium comfort'),
('Nissan Leaf', 'Nissan', 'Leaf', 'Hatchback', 20.00, 'Available', 'Electric hatchback with smooth performance'),
('L200 Triton', 'Mitsubishi', 'L200', 'Pickup', 46.00, 'Booked', 'Durable pickup suited for rugged use');

-- Bookings
INSERT INTO bookings (user_id, vehicle_id, booking_date, rental_start_date, rental_end_date, status, confirmed_by) VALUES
(1, 1, '2025-03-25', '2025-03-28', '2025-03-30', 'Confirmed', 1),
(2, 2, '2025-03-26', '2025-03-29', '2025-04-01', 'Pending', 2);

-- Feedbacks
INSERT INTO feedbacks (booking_id, user_id, rating, comments) VALUES
(1, 1, 5, 'Great experience, smooth ride!'),
(2, 2, 3, 'Vehicle was okay but needed some cleaning.');

-- Notifications
INSERT INTO notifications (user_id, booking_id, message) VALUES
(1, 1, 'Your booking has been confirmed. Please pick up the vehicle on 2025-03-28.'),
(2, 2, 'Your booking request is pending approval.');

-- ===============================
-- 5. VIEWS (Readable Names)
-- ===============================

-- Bookings View
CREATE OR REPLACE VIEW bookings_view AS
SELECT 
    b.booking_id,
    u.full_name AS user_name,
    v.vehicle_name,
    b.booking_date,
    b.rental_start_date,
    b.rental_end_date,
    b.status,
    a.full_name AS confirmed_by
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN vehicles v ON b.vehicle_id = v.vehicle_id
LEFT JOIN admins a ON b.confirmed_by = a.id;

-- Notifications View
CREATE OR REPLACE VIEW notifications_view AS
SELECT 
    n.notification_id,
    u.full_name AS user_name,
    v.vehicle_name,
    n.message,
    n.created_at
FROM notifications n
JOIN users u ON n.user_id = u.user_id
JOIN bookings b ON n.booking_id = b.booking_id
JOIN vehicles v ON b.vehicle_id = v.vehicle_id;

-- Feedbacks View
CREATE OR REPLACE VIEW feedbacks_view AS
SELECT 
    f.feedback_id,
    u.full_name AS user_name,
    f.booking_id,
    f.rating,
    f.comments,
    f.feedback_date
FROM feedbacks f
JOIN users u ON f.user_id = u.user_id;

-- ===============================
-- 6. TRIGGER: Update vehicle status on booking confirm
-- ===============================

DELIMITER //
CREATE TRIGGER trg_after_booking_confirm
AFTER UPDATE ON bookings
FOR EACH ROW
BEGIN
    IF NEW.status = 'Confirmed' THEN
        UPDATE vehicles
        SET availability_status = 'Booked'
        WHERE vehicle_id = NEW.vehicle_id;

        INSERT INTO notifications(user_id, booking_id, message)
        VALUES (NEW.user_id, NEW.booking_id, 'Your booking has been confirmed!');
    END IF;
END;
//
DELIMITER ;

-- ===============================
-- 7. PROCEDURE: Confirm Booking
-- ===============================

DELIMITER //
CREATE PROCEDURE confirm_booking(IN b_id INT, IN admin_id INT)
BEGIN
    UPDATE bookings
    SET status = 'Confirmed', confirmed_by = admin_id
    WHERE booking_id = b_id;

    INSERT INTO notifications (user_id, booking_id, message)
    SELECT user_id, booking_id, CONCAT('Your booking #', booking_id, ' has been confirmed by admin.')
    FROM bookings WHERE booking_id = b_id;
END;
//
DELIMITER ;

-- ===============================
-- 8. FUNCTION: Get average user rating
-- ===============================

DELIMITER //
CREATE FUNCTION get_user_rating(uid INT)
RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
    DECLARE avg_rating DECIMAL(3,2);
    SELECT AVG(rating) INTO avg_rating FROM feedbacks WHERE user_id = uid;
    RETURN IFNULL(avg_rating, 0.0);
END;
//
DELIMITER ;

-- ===============================
-- 9. EVENT: Auto-cancel unconfirmed bookings after 2 days
-- ===============================

SET GLOBAL event_scheduler = ON;

CREATE EVENT auto_cancel_unconfirmed_bookings
ON SCHEDULE EVERY 1 DAY
DO
  UPDATE bookings
  SET status = 'Cancelled'
  WHERE status = 'Pending'
    AND booking_date < CURDATE() - INTERVAL 2 DAY;

-- ===============================
-- ✅ END OF SCRIPT (Foreign Key Safe for Deletion)
-- ===============================