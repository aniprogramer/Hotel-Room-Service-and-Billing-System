USE hotel_room_service_billing;

INSERT INTO roles (role_name, description)
VALUES
('Guest', 'Hotel guest who orders food'),
('Kitchen Staff', 'Prepares and manages food orders'),
('Delivery Staff', 'Handles food deliveries to rooms'),
('Billing Staff', 'Manages invoices and payments');

INSERT INTO users (username, password_hash, full_name, email, phone, role_id)
VALUES
-- Guests
('ananya_guest', 'pass_123', 'Ananya Rao', 'ananya.rao@example.com', '9876500011', 1),
('rahul_guest', 'pass_456', 'Rahul Shetty', 'rahul.shetty@example.com', '9876500012', 1),
('meera_guest', 'pass_789', 'Meera Nair', 'meera.nair@example.com', '9876500013', 1),

-- Kitchen Staff
('chef_ajay', 'pass_chef1', 'Ajay Verma', 'ajay.verma@hotel.com', '9876500100', 2),
('chef_sara', 'pass_chef2', 'Sara Thomas', 'sara.thomas@hotel.com', '9876500101', 2),

-- Delivery Staff
('ravi_delivery', 'pass_del1', 'Ravi Kumar', 'ravi.kumar@hotel.com', '9876500102', 3),
('aarti_delivery', 'pass_del2', 'Aarti Singh', 'aarti.singh@hotel.com', '9876500103', 3),

-- Billing Staff
('nina_billing', 'pass_bill', 'Nina Fernandes', 'nina.fernandes@hotel.com', '9876500104', 4);

INSERT INTO menu_categories (category_name, description)
VALUES
('Biryani', 'Delicious varieties of biryani prepared with authentic spices'),
('Rice', 'Steamed, fried, or flavored rice dishes'),
('Roti Items', 'Soft rotis, naans, and parathas fresh from the tandoor'),
('Tandoori & Barbeque', 'Grilled tandoori and barbeque delicacies'),
('Egg Items', 'Omelets, egg curries, and other egg-based dishes'),
('Indian Gravy (Non-Veg)', 'Rich and spicy Indian curries with chicken, mutton, or fish'),
('Indian Gravy (Veg)', 'Vegetarian curries cooked in authentic Indian style'),
('Chinese Chicken', 'Chinese-style chicken dishes and gravies'),
('Chinese Veg', 'Vegetarian Chinese delicacies'),
('Chinese Rice', 'Varieties of Chinese-style fried rice and Schezwan rice'),
('Soups', 'Hot and flavorful soups to start your meal'),
('Fries', 'Crispy fried snacks and sides'),
('Fresh Juices', 'Refreshing and natural fruit juices'),
('Mojitos', 'Cool and energizing mojito drinks');

INSERT INTO menu_items (name, description, category_id, price, is_available) VALUES
-- 1️⃣ Biryani
('Chicken Biryani', 'Traditional chicken biryani with rich spices', 1, 170.00, 1),
('Mutton Biryani', 'Tender mutton pieces cooked in layered rice', 1, 260.00, 1),
('Egg Biryani', 'Basmati rice with boiled and spiced eggs', 1, 120.00, 1),
('Veg Biryani', 'Mixed vegetables cooked with aromatic rice', 1, 140.00, 1),
('Paneer Biryani', 'Cottage cheese biryani in Indian style', 1, 150.00, 1),
('Tikka Biryani', 'Chicken tikka mixed with flavorful rice', 1, 190.00, 1),

-- 2️⃣ Rice
('Ghee Rice', 'Fragrant rice cooked with ghee and mild spices', 2, 100.00, 1),
('Curd Rice', 'South Indian style curd mixed with rice', 2, 90.00, 1),
('Steam Rice', 'Plain steamed basmati rice', 2, 80.00, 1),
('Jeera Rice', 'Rice flavored with cumin seeds', 2, 90.00, 1),
('Masala Khichdi', 'Comforting lentil and rice mix with spices', 2, 100.00, 1),

-- 3️⃣ Roti Items
('Tandoori Roti', 'Crispy and soft tandoor-cooked roti', 3, 20.00, 1),
('Butter Roti', 'Soft roti brushed with butter', 3, 25.00, 1),
('Naan', 'Soft leavened bread from tandoor', 3, 30.00, 1),
('Butter Naan', 'Naan topped with butter', 3, 40.00, 1),
('Garlic Naan', 'Naan flavored with garlic and herbs', 3, 40.00, 1),
('Kulcha', 'Soft flatbread served with gravies', 3, 30.00, 1),
('Butter Kulcha', 'Kulcha topped with butter', 3, 40.00, 1),
('Kerala Parota', 'Layered flaky South Indian parota', 3, 15.00, 1),

-- 4️⃣ Tandoori & Barbeque
('Chicken Tikka (Full)', 'Full plate of chicken tikka cooked on charcoal', 4, 580.00, 1),
('Chicken Tikka (Half)', 'Half plate of juicy chicken tikka', 4, 290.00, 1),
('Chicken Tikka', 'Single portion of tandoori chicken tikka', 4, 70.00, 1),
('Chicken Tikka Boneless', 'Boneless version of chicken tikka', 4, 350.00, 1),
('Reshmi Kabab (8pc)', 'Creamy grilled chicken kebabs', 4, 330.00, 1),
('Chicken Seek Kabab (8pc)', 'Spicy ground chicken kebabs on skewers', 4, 340.00, 1),
('Paneer Tikka', 'Charcoal-grilled cottage cheese cubes', 4, 290.00, 1),

-- 5️⃣ Egg Items
('Egg Chilly', 'Egg cubes tossed with spicy sauce', 5, 90.00, 1),
('Egg Manchurian', 'Crispy egg pieces in Chinese sauce', 5, 90.00, 1),
('Egg Pepper Fry', 'Fried egg tossed with black pepper', 5, 90.00, 1),
('Egg 65', 'South Indian style spicy fried egg', 5, 90.00, 1),
('Boiled Egg', 'Simple boiled eggs served with salt & pepper', 5, 10.00, 1),

-- 6️⃣ Indian Gravy (Non-Veg)
('Egg Masala', 'Egg curry cooked in rich masala gravy', 6, 90.00, 1),
('Egg Kolhapuri', 'Eggs cooked in Kolhapuri-style masala', 6, 90.00, 1),
('Chicken Masala', 'Classic chicken masala curry', 6, 170.00, 1),
('Chicken Kadai', 'Chicken cooked with capsicum and onions', 6, 190.00, 1),
('Chicken Kolhapuri', 'Spicy chicken curry with coconut base', 6, 190.00, 1),
('Butter Chicken', 'Creamy tomato gravy with butter and chicken', 6, 230.00, 1),
('Chicken Punjabi', 'Rich Punjabi-style chicken curry', 6, 260.00, 1),
('Mutton Masala', 'Tender mutton in aromatic gravy', 6, 250.00, 1),
('Mutton Hyderabadi', 'Mutton curry with Hyderabadi spices', 6, 280.00, 1),
('Mutton Rogan Josh', 'Famous Kashmiri mutton curry', 6, 300.00, 1),

-- 7️⃣ Indian Gravy (Veg)
('Dal Fry', 'Yellow lentils cooked with ghee and spices', 7, 90.00, 1),
('Dal Tadka', 'Dal tempered with garlic and cumin', 7, 100.00, 1),
('Mix Veg Curry', 'Mixed vegetable curry', 7, 100.00, 1),
('Veg Kadai', 'Vegetables cooked in kadai masala', 7, 140.00, 1),
('Veg Handi', 'Creamy mixed veg curry', 7, 150.00, 1),
('Kaaju Masala', 'Cashew-based rich curry', 7, 240.00, 1),
('Paneer Masala', 'Paneer cooked in onion-tomato gravy', 7, 160.00, 1),
('Paneer Butter Masala', 'Creamy paneer in buttery gravy', 7, 170.00, 1),
('Paneer Tikka Masala', 'Paneer tikka cooked in spicy gravy', 7, 200.00, 1),
('Mushroom Kadai', 'Mushroom cooked with bell peppers', 7, 180.00, 1),
('Mushroom Masala', 'Classic mushroom curry', 7, 160.00, 1),

-- 8️⃣ Chinese Chicken
('Chicken Chilli Dry', 'Crispy chicken in spicy sauce', 8, 170.00, 1),
('Chicken Manchurian', 'Chinese-style chicken balls in sauce', 8, 170.00, 1),
('Chicken Chilli Gravy', 'Chicken cooked in hot garlic sauce', 8, 180.00, 1),
('Chicken Honey Chilli', 'Sweet and spicy chicken dish', 8, 180.00, 1),
('Chicken Chilli Boneless', 'Boneless spicy chicken dish', 8, 190.00, 1),
('Chicken 65', 'Spicy deep-fried chicken pieces', 8, 200.00, 1),
('Chicken Lollipop', 'Deep-fried chicken drumettes', 8, 230.00, 1),
('Chicken Drumstick', 'Marinated chicken drumsticks', 8, 240.00, 1),
('Schezwan Chicken', 'Spicy Schezwan-style chicken', 8, 180.00, 1),

-- 9️⃣ Chinese Veg
('Gobi Manchurian', 'Cauliflower fritters in tangy sauce', 9, 100.00, 1),
('Gobi 65', 'Crispy fried cauliflower bites', 9, 110.00, 1),
('Gobi Chilly', 'Spicy cauliflower dish with peppers', 9, 100.00, 1),
('Paneer Manchurian', 'Cottage cheese balls in Chinese sauce', 9, 170.00, 1),
('Paneer Chilly', 'Paneer cubes tossed in chilli sauce', 9, 160.00, 1),
('Mushroom Manchurian', 'Mushroom balls in Manchurian sauce', 9, 170.00, 1),
('Mushroom Chilly', 'Mushroom tossed in spicy sauce', 9, 160.00, 1),

-- 🔟 Chinese Rice
('Chicken Fried Rice', 'Fried rice with chicken pieces', 10, 120.00, 1),
('Chicken Noodles', 'Noodles stir-fried with chicken', 10, 120.00, 1),
('Schezwan Chicken Fried Rice', 'Spicy Schezwan-style chicken fried rice', 10, 140.00, 1),
('Schezwan Chicken Noodles', 'Schezwan-flavored chicken noodles', 10, 140.00, 1),
('Mix Schezwan Noodles', 'Mixed noodles with chicken and veg', 10, 160.00, 1),
('Mix Schezwan Rice', 'Mixed rice with chicken and veg', 10, 170.00, 1),
('Mix Noodles', 'Noodles with chicken, egg, and veg', 10, 180.00, 1),
('Mix Rice', 'Rice with chicken, egg, and veg', 10, 180.00, 1),
('Veg Fried Rice', 'Fried rice with vegetables', 10, 130.00, 1),
('Schezwan Veg Fried Rice', 'Spicy Schezwan vegetable rice', 10, 150.00, 1),

-- 11️⃣ Soups
('Chicken Soup', 'Hot chicken broth', 11, 80.00, 1),
('Mutton Soup', 'Spiced mutton soup', 11, 100.00, 1),
('Chicken Hot & Sour Soup', 'Spicy and tangy chicken soup', 11, 90.00, 1),
('Veg Manchurian Soup', 'Vegetable soup with Manchurian balls', 11, 80.00, 1),
('Veg Hot & Sour Soup', 'Hot and sour veg soup', 11, 80.00, 1),

-- 12️⃣ Fries
('French Fries', 'Classic crispy fries', 12, 70.00, 1),
('Crinkle Fries', 'Curved-style potato fries', 12, 80.00, 1),
('Masala Fries', 'Fries sprinkled with Indian spices', 12, 90.00, 1),
('Peri Peri Fries', 'Fries tossed in peri peri seasoning', 12, 90.00, 1),

-- 13️⃣ Fresh Juices
('Lime', 'Fresh lime juice', 13, 30.00, 1),
('Ginger Lime', 'Lime juice with ginger flavor', 13, 40.00, 1),
('Moroccan Mint Lime', 'Refreshing mint lime blend', 13, 60.00, 1),
('Lime Cooler', 'Chilled lime cooler drink', 13, 60.00, 1),
('Orange', 'Fresh orange juice', 13, 60.00, 1),
('Sweet Lime', 'Sweet lime juice', 13, 60.00, 1),
('Pineapple', 'Pineapple fruit juice', 13, 60.00, 1),
('Musk Melon', 'Melon fruit juice', 13, 60.00, 1),
('Pomegranate', 'Freshly squeezed pomegranate juice', 13, 70.00, 1),

-- 14️⃣ Mojitos
('Blueberry Mojito', 'Refreshing blueberry mint mojito', 14, 70.00, 1),
('Kiwi', 'Kiwi flavored mojito', 14, 70.00, 1),
('Strawberry', 'Strawberry mint mojito', 14, 70.00, 1),
('Blue', 'Blue mint cooler mojito', 14, 70.00, 1),
('Blackberry', 'Fruity blackberry mojito', 14, 70.00, 1),
('Litchi', 'Litchi mint mojito', 14, 70.00, 1),
('Mango', 'Mango flavored mojito', 14, 70.00, 1),
('Pineapple', 'Pineapple flavored mojito', 14, 70.00, 1),
('Water Melon', 'Watermelon mojito', 14, 70.00, 1),
('Grape', 'Grape flavored mojito', 14, 70.00, 1),
('Orange', 'Citrus orange mojito', 14, 70.00, 1),
('Blue Lagoon', 'Classic blue lagoon mocktail', 14, 70.00, 1);

INSERT INTO rooms (room_number, room_type, status)
VALUES
(101, 'Single', 'OCCUPIED'),
(102, 'Double', 'OCCUPIED'),
(201, 'Suite', 'AVAILABLE'),
(202, 'Double', 'OCCUPIED'),
(301, 'Single', 'AVAILABLE'),
(302, 'Suite', 'OCCUPIED');

INSERT INTO orders (guest_id, room_number, status, subtotal, tax_amount, service_charge, total_amount, special_instructions)
VALUES
-- Order 1 by Ananya
(1, 101, 'PLACED', 310.00, 15.50, 6.00, 331.50, 'Less spicy biryani please'),

-- Order 2 by Rahul
(2, 102, 'PREPARING', 220.00, 11.00, 4.40, 235.40, 'Serve with raita'),

-- Order 3 by Meera
(3, 202, 'READY', 450.00, 22.50, 9.00, 481.50, 'Extra napkins'),

-- Order 4 by Ananya again
(1, 101, 'OUT_FOR_DELIVERY', 180.00, 9.00, 3.60, 192.60, 'Hot and fresh');

INSERT INTO order_items (order_id, menu_id, quantity, unit_price, subtotal, special_notes)
VALUES
-- Order 1 (Ananya - Biryani + Fries)
(1, 1, 1, 170.00, 170.00, NULL), -- Chicken Biryani
(1, 77, 2, 70.00, 140.00, 'Extra crispy fries'),

-- Order 2 (Rahul - Paneer Butter Masala + Naan)
(2, 55, 1, 170.00, 170.00, NULL), -- Paneer Butter Masala
(2, 17, 2, 30.00, 60.00, NULL),   -- Naan

-- Order 3 (Meera - Chicken Fried Rice + Chicken Chilli Gravy)
(3, 80, 1, 120.00, 120.00, NULL), -- Chicken Fried Rice
(3, 63, 1, 180.00, 180.00, NULL), -- Chicken Chilli Gravy
(3, 6, 1, 180.00, 180.00, 'Less oil'),

-- Order 4 (Ananya - Fresh Juice + Gobi Manchurian)
(4, 92, 1, 60.00, 60.00, 'No ice'),
(4, 69, 1, 100.00, 100.00, 'Extra sauce');

INSERT INTO invoices (order_id, invoice_number, subtotal, tax, service_charge, total_amount, paid)
VALUES
(1, 'INV5001', 310.00, 15.50, 6.00, 331.50, 0),
(2, 'INV5002', 220.00, 11.00, 4.40, 235.40, 1),
(3, 'INV5003', 450.00, 22.50, 9.00, 481.50, 0),
(4, 'INV5004', 180.00, 9.00, 3.60, 192.60, 0);

INSERT INTO payments (invoice_id, amount, payment_method, reference)
VALUES
(2, 235.40, 'CARD', 'TXN2025PAY101');

INSERT INTO deliveries (order_id, staff_id, assigned_at, delivered_at, delivery_status)
VALUES
(4, 6, NOW() - INTERVAL 45 MINUTE, NOW() - INTERVAL 10 MINUTE, 'DELIVERED'),
(3, 7, NOW() - INTERVAL 30 MINUTE, NULL, 'IN_PROGRESS');
