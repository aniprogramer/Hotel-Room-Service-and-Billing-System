-- ------------------------------------------------------------
--   HOTEL ROOM SERVICE & BILLING SYSTEM — FULL INIT DATABASE
-- ------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS menu_categories;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

SET FOREIGN_KEY_CHECKS = 1;

-- -------------------------
-- ROLES
-- -------------------------
CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO roles (role_name) VALUES
('Guest'),
('Kitchen Staff'),
('Delivery Staff'),
('Billing Staff');

-- -------------------------
-- USERS
-- -------------------------
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

INSERT INTO users (username, password, full_name, role_id) VALUES
('guest1', 'guest123', 'Guest User', 1),
('kitchen1', 'kitchen123', 'Kitchen Staff', 2),
('delivery1', 'delivery123', 'Delivery Staff', 3),
('billing1', 'billing123', 'Billing Staff', 4);

-- -------------------------
-- ROOMS
-- -------------------------
CREATE TABLE rooms (
    room_number INT PRIMARY KEY,
    room_type VARCHAR(50),
    status ENUM('AVAILABLE','OCCUPIED') DEFAULT 'AVAILABLE'
);

INSERT INTO rooms VALUES
(101, 'Single', 'OCCUPIED'),
(102, 'Double', 'OCCUPIED'),
(201, 'Suite', 'AVAILABLE'),
(202, 'Double', 'OCCUPIED'),
(301, 'Single', 'OCCUPIED'),
(302, 'Suite', 'AVAILABLE');

-- -------------------------
-- MENU CATEGORIES
-- -------------------------
CREATE TABLE menu_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO menu_categories (category_name) VALUES
('Biryani'),
('Rice'),
('Roti Items'),
('Tandoori & Barbeque'),
('Egg Items'),
('Indian Gravy (Non-Veg)'),
('Indian Gravy (Veg)'),
('Chinese Chicken'),
('Chinese Veg'),
('Chinese Rice'),
('Soups'),
('Fries'),
('Fresh Juices'),
('Mojitos');

-- -------------------------
-- MENU ITEMS
-- -------------------------
CREATE TABLE menu_items (
    menu_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES menu_categories(category_id)
);

-- Seed all menu items
INSERT INTO menu_items (name, price, category_id) VALUES
-- Biryani
('Chicken Biryani', 170, 1),
('Mutton Biryani', 260, 1),
('Egg Biryani', 120, 1),
('Veg Biryani', 140, 1),
('Paneer Biryani', 150, 1),
('Tikka Biryani', 190, 1),

-- Rice
('Ghee Rice', 100, 2),
('Curd Rice', 90, 2),
('Steam Rice', 80, 2),
('Jeera Rice', 90, 2),
('Masala Khichdi', 100, 2),

-- Roti
('Tandoori Roti', 20, 3),
('Butter Roti', 25, 3),
('Naan', 30, 3),
('Butter Naan', 40, 3),
('Garlic Naan', 40, 3),
('Kulcha', 30, 3),
('Butter Kulcha', 40, 3),
('Kerala Parota', 15, 3),

-- Tandoori & Barbeque
('Chicken Tikka (Full)', 580, 4),
('Chicken Tikka (Half)', 290, 4),
('Chicken Tikka', 70, 4),
('Chicken Tikka Boneless', 350, 4),
('Reshmi Kabab (8pc)', 330, 4),
('Chicken Seek Kabab (8pc)', 340, 4),
('Paneer Tikka', 290, 4),

-- Egg Items
('Egg Chilly', 90, 5),
('Egg Manchurian', 90, 5),
('Egg Pepper Fry', 90, 5),
('Egg 65', 90, 5),
('Boiled Egg', 10, 5),

-- Indian Gravy Non-Veg
('Egg Masala', 90, 6),
('Egg Kolapuri', 90, 6),
('Chicken Masala', 170, 6),
('Chicken Kadai', 190, 6),
('Chicken Kolapuri', 190, 6),
('Butter Chicken', 230, 6),
('Chicken Punjabi', 260, 6),
('Mutton Masala', 250, 6),
('Mutton Hyderabadi', 280, 6),
('Mutton Rogan Josh', 300, 6),

-- Indian Gravy Veg
('Dal Fry', 90, 7),
('Dal Tadka', 100, 7),
('Mix Veg Curry', 100, 7),
('Veg Kadai', 140, 7),
('Veg Handi', 150, 7),
('Kaju Masala', 240, 7),
('Paneer Masala', 160, 7),
('Paneer Butter Masala', 170, 7),
('Paneer Tikka Masala', 200, 7),
('Mushroom Kadai', 180, 7),
('Mushroom Masala', 160, 7),

-- Chinese Chicken
('Chicken Chilli Dry', 170, 8),
('Chicken Manchurian', 170, 8),
('Chicken Chilli Gravy', 180, 8),
('Chicken Honey Chilly', 180, 8),
('Chicken Chilli Boneless', 190, 8),
('Chicken 65', 200, 8),
('Chicken Lollipop', 230, 8),
('Chicken Drumstick', 240, 8),
('Schezwan Chicken', 180, 8),

-- Chinese Veg
('Gobi Manchurian', 100, 9),
('Gobi 65', 110, 9),
('Gobi Chilly', 100, 9),
('Paneer Manchurian', 170, 9),
('Paneer Chilly', 160, 9),
('Mushroom Manchurian', 170, 9),
('Mushroom Chilly', 160, 9),

-- Chinese Rice
('Chicken Fried Rice', 120, 10),
('Chicken Noodles', 120, 10),
('Schezwan Chicken Fried Rice', 140, 10),
('Schezwan Chicken Noodles', 140, 10),
('Mix Schezwan Noodles', 160, 10),
('Mix Schezwan Rice', 170, 10),
('Mix Noodles', 180, 10),
('Mix Rice', 180, 10),
('Veg Fried Rice', 130, 10),
('Schezwan Veg Fried Rice', 150, 10),

-- Soups
('Chicken Soup', 80, 11),
('Mutton Soup', 100, 11),
('Chicken Hot & Sour Soup', 90, 11),
('Veg Manchurian Soup', 80, 11),
('Veg Hot & Sour Soup', 80, 11),

-- Fries
('French Fries', 70, 12),
('Crinkle Fries', 80, 12),
('Masala Fries', 90, 12),
('Peri Peri Fries', 90, 12),

-- Fresh Juices
('Lime', 30, 13),
('Ginger Lime', 40, 13),
('Moroccan Mint Lime', 60, 13),
('Lime Cooler', 60, 13),
('Orange Juice', 60, 13),
('Sweet Lime Juice', 60, 13),
('Pineapple Juice', 60, 13),
('Musk Melon Juice', 60, 13),
('Pomegranate Juice', 70, 13),

-- Mojitos
('Blueberry Mojito', 70, 14),
('Kiwi Mojito', 70, 14),
('Strawberry Mojito', 70, 14),
('Blue Mojito', 70, 14),
('Blackberry Mojito', 70, 14),
('Litchi Mojito', 70, 14),
('Mango Mojito', 70, 14),
('Pineapple Mojito', 70, 14),
('Water Melon Mojito', 70, 14),
('Grape Mojito', 70, 14),
('Orange Mojito', 70, 14),
('Blue Lagoon', 70, 14);

-- -------------------------
-- ORDERS
-- -------------------------
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_number INT NOT NULL,
    status ENUM('PLACED','PREPARING','READY') DEFAULT 'PLACED',
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (guest_id) REFERENCES users(user_id),
    FOREIGN KEY (room_number) REFERENCES rooms(room_number)
);

INSERT INTO orders (guest_id, room_number, status, total_amount) VALUES
(1, 101, 'PLACED', 330.00),
(1, 101, 'READY', 235.00);

-- -------------------------
-- ORDER ITEMS
-- -------------------------
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    menu_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (menu_id) REFERENCES menu_items(menu_id)
);

INSERT INTO order_items (order_id, menu_id, quantity, price) VALUES
(1, 1, 1, 170),
(1, 13, 2, 80),
(1, 95, 1, 80),

(2, 2, 1, 260),
(2, 14, 1, 30),
(2, 92, 1, 80);

-- -------------------------
-- DELIVERIES
-- -------------------------
CREATE TABLE deliveries (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    staff_id INT NOT NULL,
    delivery_status ENUM('PENDING','IN_PROGRESS','DELIVERED') DEFAULT 'PENDING',
    assigned_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    delivered_at DATETIME NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (staff_id) REFERENCES users(user_id)
);

INSERT INTO deliveries (order_id, staff_id, delivery_status) VALUES
(1, 3, 'IN_PROGRESS'),
(2, 3, 'DELIVERED');

-- -------------------------
-- INVOICES
-- -------------------------
CREATE TABLE invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_number VARCHAR(50) NOT NULL UNIQUE,
    order_id INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    tax DECIMAL(10,2) NOT NULL,
    service_charge DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO invoices (invoice_number, order_id, subtotal, tax, service_charge, total_amount, paid)
VALUES 
('INV-1001', 1, 300, 15, 15, 330, 0),
('INV-1002', 2, 210, 10, 15, 235, 1);

-- -------------------------
-- PAYMENTS
-- -------------------------
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method ENUM('CASH','CARD','UPI') NOT NULL,
    paid_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

INSERT INTO payments (invoice_id, amount, payment_method)
VALUES
(2, 235, 'UPI');
