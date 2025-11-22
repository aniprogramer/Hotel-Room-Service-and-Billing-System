const express = require("express");
const session = require("express-session");
const path = require("path");
const db = require("./config/db"); // Database connection

const app = express();
const PORT = 3000;

// -------------------------------------------------------------
// 🧩 MIDDLEWARE
// -------------------------------------------------------------
app.use(express.urlencoded({ extended: true })); // Parse form data
app.use(express.json()); // Parse JSON requests
app.use(express.static(path.join(__dirname, "public"))); // Serve static files
app.set("view engine", "ejs"); // Use EJS templates

// -------------------------------------------------------------
// 🔐 SESSION CONFIGURATION
// -------------------------------------------------------------
app.use(
  session({
    secret: "hotel_secret_key_2025",
    resave: false,
    saveUninitialized: false,
    cookie: {
      maxAge: 1000 * 60 * 60, // 1 hour
      httpOnly: true,
    },
  })
);

app.use((req, res, next) => {
  res.locals.user = req.session.user || null;  
  next();
});

// -------------------------------------------------------------
// 🧭 ROUTES IMPORT
// -------------------------------------------------------------
const authRoutes = require("./routes/authRoutes");
const guestRoutes = require("./routes/guestRoutes");
const kitchenRoutes = require("./routes/kitchenRoutes");
const deliveryRoutes = require("./routes/deliveryRoutes");
const billingRoutes = require("./routes/billingRoutes");

// -------------------------------------------------------------
// 🚦 USE ROUTES
// -------------------------------------------------------------
app.use("/", authRoutes);
app.use("/guest", guestRoutes);
app.use("/kitchen", kitchenRoutes);
app.use("/delivery", deliveryRoutes);
app.use("/billing", billingRoutes);

// -------------------------------------------------------------
// 🏠 ROOT & DASHBOARD ROUTES
// -------------------------------------------------------------
app.get("/", (req, res) => {
  if (!req.session.user) return res.redirect("/login");
  res.redirect("dashboard.ejs");
});

app.get("/dashboard", (req, res) => {
  if (!req.session.user) return res.redirect("/login");

  const role = req.session.user.role_name;

  switch (role) {
    case "Guest":
      return res.redirect("/guest/menu");
    case "Kitchen Staff":
      return res.redirect("/kitchen/orders");
    case "Delivery Staff":
      return res.redirect("/delivery/deliveries");
    case "Billing Staff":
      return res.redirect("/billing/invoices");
    default:
      return res.send("Invalid role assigned.");
  }
});

// -------------------------------------------------------------
// 🚀 START SERVER
// -------------------------------------------------------------
app.listen(PORT, () => {
  console.log(`✅ Server running on: http://localhost:${PORT}`);
});
