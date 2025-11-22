CREATE DATABASE hotel_room_service_billing;
USE hotel_room_service_billing;

-- 1️⃣ ROLES TABLE
CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(30) UNIQUE NOT NULL,
    description TEXT
);

-- 2️⃣ USERS TABLE
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) UNIQUE NOT NULL,
    password_hash VARCHAR(100) NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(15),
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- 3️⃣ MENU_CATEGORIES TABLE
CREATE TABLE menu_categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

-- 4️⃣ MENU_ITEMS TABLE
CREATE TABLE menu_items (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100),
    category_id INT,
    price DECIMAL(8,2) NOT NULL,
    is_available TINYINT(1) DEFAULT 1,
    FOREIGN KEY (category_id) REFERENCES menu_categories(category_id)
);

-- 5️⃣ ROOMS TABLE (room_number = PK)
CREATE TABLE rooms (
    room_number INT PRIMARY KEY,
    room_type VARCHAR(30),
    status ENUM('AVAILABLE','OCCUPIED','CLEANING') DEFAULT 'AVAILABLE'
);

-- 6️⃣ ORDERS TABLE
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_number INT NOT NULL,
    status ENUM('PLACED','PREPARING','READY','OUT_FOR_DELIVERY') DEFAULT 'PLACED',
    subtotal DECIMAL(8,2) DEFAULT 0.00,
    tax_amount DECIMAL(8,2) DEFAULT 0.00,
    service_charge DECIMAL(8,2) DEFAULT 0.00,
    total_amount DECIMAL(8,2) DEFAULT 0.00,
    special_instructions VARCHAR(100),
    FOREIGN KEY (guest_id) REFERENCES users(user_id),
    FOREIGN KEY (room_number) REFERENCES rooms(room_number)
);

-- 7️⃣ ORDER_ITEMS TABLE
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    menu_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(8,2) NOT NULL,
    subtotal DECIMAL(8,2) NOT NULL,
    special_notes VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (menu_id) REFERENCES menu_items(menu_id)
);

-- 8️⃣ INVOICES TABLE
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNIQUE NOT NULL,
    invoice_number VARCHAR(50) UNIQUE NOT NULL,
    subtotal DECIMAL(8,2),
    tax DECIMAL(8,2),
    service_charge DECIMAL(8,2),
    total_amount DECIMAL(8,2),
    paid TINYINT(1) DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 9️⃣ PAYMENTS TABLE
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT NOT NULL,
    amount DECIMAL(8,2) NOT NULL,
    payment_method ENUM('CASH','CARD','UPI','ROOM_CHARGE') NOT NULL,
    reference VARCHAR(50),
    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

-- 🔟 DELIVERIES TABLE
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNIQUE NOT NULL,
    staff_id INT NOT NULL,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivered_at TIMESTAMP NULL,
    delivery_status ENUM('ASSIGNED','IN_PROGRESS','DELIVERED') DEFAULT 'ASSIGNED',
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (staff_id) REFERENCES users(user_id)
);
