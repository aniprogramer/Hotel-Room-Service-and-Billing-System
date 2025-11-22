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
git clone https://github.com/<your-username>/<repo>.git
cd "<project-folder>"
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

## 🗄️ 3. Setup Database

### ✅ Step 1: Create the Database

```sql
CREATE DATABASE hotel_service_db;
```

### ✅ Step 2: Import `init_db.sql`

This single file contains:

* Tables
* Menu categories
* Menu items
* Sample users
* Rooms
* Orders
* Order items
* Deliveries
* Invoices
* Payments

Import using MySQL Workbench → *Server > Data Import*.

---

## 🔌 4. Configure DB Connection

Update `/config/db.js`:

```js
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "hotel_service_db",
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