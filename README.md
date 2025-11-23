<p align="center">
  <img src="public\images\banner.png" alt="Hotel Room Service and Billing System Banner" />
</p>

# 🏨 **Hotel Room Service & Billing System**

A full-stack hotel room service management system built using **Node.js**, **Express**, **EJS**, and **MySQL** — providing seamless workflows for **Guests**, **Kitchen Staff**, **Delivery Staff**, and **Billing Staff**.

---

## 🌟 **Highlights**

✔ Full role-based system <br>
✔ End-to-end order workflow <br>
✔ Responsive UI using Bootstrap <br>
✔ Clean MVC architecture <br>
✔ Full database included (`init_db.sql`) <br>
✔ Beginner-friendly setup <br>
✔ Industry-style documentation <br>

---

## 📸 **Screenshots**

*(Add your own screenshots here for a professional touch)*

```
/screenshots/
    login.png
    dashboard.png
    menu.png
    kitchen.png
    delivery.png
    billing.png
```

---

## 🚀 **Live Modules**

### 👤 Guest

* Browse menu
* Place orders
* See order history
* View invoice

### 👨‍🍳 Kitchen Staff

* View incoming orders
* Update order status

### 🚚 Delivery Staff

* View assigned deliveries
* Mark delivered

### 💳 Billing Staff

* View all invoices
* Record payments

---

## 🧱 **Tech Stack**

| Layer     | Technology            |
| --------- | --------------------- |
| Frontend  | EJS, Bootstrap 5      |
| Backend   | Node.js, Express.js   |
| Database  | MySQL (mysql2 driver) |
| Sessions  | express-session       |
| Dev Tools | Faker.js              |

---

## 📦 **Folder Structure**

```
Hotel Room Service & Billing System/
│
├── server.js
├── package.json
├── requirements.txt
├── init_db.sql
├── README.md
│
├── /config/
│   └── db.js
│
├── /controllers/
│   ├── authController.js
│   ├── guestController.js
│   ├── kitchenController.js
│   ├── deliveryController.js
│   └── billingController.js
│
├── /routes/
│   ├── authRoutes.js
│   ├── guestRoutes.js
│   ├── kitchenRoutes.js
│   ├── deliveryRoutes.js
│   └── billingRoutes.js
│
├── /views/
│   ├── /auth/
│   ├── /guest/
│   ├── /kitchen/
│   ├── /delivery/
│   ├── /billing/
│   ├── /partials/
│   └── dashboard.ejs
│
└── /public/
    ├── /css/
    └── /js/
```

---

# ⚙️ **Installation & Setup**

## 🔧 1. Clone the Repository

```bash
git clone https://github.com/aniprogramer/Hotel-Room-Service-and-Billing-System.git
cd "Hotel Room Service and Billing System"
```

---

## 📦 2. Install Dependencies

```bash
npm install
```

Dependencies included:

```
express
express-session
ejs
mysql2
method-override
@faker-js/faker   (dev)
```

You can also find them in `requirements.txt`.

---

# 🗄️ Database Setup (Using init_db.sql)

My project includes a full SQL initialization script:


This single file automatically:

- Creates the database: **hotel_room_service_billing**
- Switches to it
- Disables & enables foreign key checks
- Drops all tables (if they exist)
- Recreates all tables (roles, users, menu, orders, invoices, payments, deliveries)
- Inserts full seed data (users, rooms, categories, items, orders, etc.)

No manual SQL work is required — just run the file once.

---

## ✅ Option 1 — Run Using MySQL Workbench (Recommended)

1. Open **MySQL Workbench**
2. Go to:  
   **File → Open SQL Script**
3. Select:  
4. Click the **Execute (⚡ lightning)** button

Done!  
The database will be created and fully populated automatically.

---

## ✅ Option 2 — Run Using MySQL Command Line

Open a terminal in the project folder:

```bash
mysql -u root -p < init_db.sql
```
Enter your MySQL password when asked.
This executes the entire SQL file and sets up all tables + data.

---

## 🚀 Verify Database Setup

After running the SQL file, open MySQL Workbench and run:

```sql
USE hotel_room_service_billing;
SHOW TABLES;
```

You should see:

```
roles
users
rooms
menu_categories
menu_items
orders
order_items
deliveries
invoices
payments
```

To confirm inserted data:

```sql
SELECT * FROM users;
SELECT * FROM menu_items;
SELECT * FROM orders;
SELECT * FROM invoices;
```

---

## 🔌 Configure Backend Connection

Check `/config/db.js` and ensure it matches your SQL database:

```js
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "hotel_room_service_billing",
  decimalNumbers: true
});
```

---

## ▶️ 5. Start the Server

```bash
node server.js
```

or (recommended)

```bash
nodemon server.js
```

Visit the app:

👉 **[http://localhost:3000](http://localhost:3000)**

---

# 🔐 **Sample Login Credentials**

| Role     | Username  | Password    |
| -------- | --------- | ----------- |
| Guest    | guest1    | guest123    |
| Kitchen  | kitchen1  | kitchen123  |
| Delivery | delivery1 | delivery123 |
| Billing  | billing1  | billing123  |

---

# 🔁 **Workflow Overview**

### 1️⃣ Guest

➡ Places order

### 2️⃣ Kitchen Staff

➡ Marks as PREPARING / READY

### 3️⃣ Delivery Staff

➡ Delivers to room

### 4️⃣ Billing Staff

➡ Updates invoice payment

### 5️⃣ Guest

➡ Views invoice anytime

---

# 🛠️ **Troubleshooting**

### ⚠️ `user is not defined`

Add this global middleware BEFORE routes:

```js
app.use((req, res, next) => {
  res.locals.user = req.session.user || null;
  next();
});
```

---

### ⚠️ `.toFixed is not a function`

Use:

```js
Number(value).toFixed(2)
```

OR set:

```js
decimalNumbers: true
```

---

### ⚠️ Invoice not found

Verify:

```sql
SELECT * FROM invoices WHERE order_id = X;
```

---

# 📜 License

This project is open-source under **MIT License**.

---

# 👨‍💻 Developer

**Aniket De**
B.Tech CSE
Sahyadri College of Engineering & Management

---

# ⭐ Show Some Love

If this project helped you, please ⭐ star the repo on GitHub!