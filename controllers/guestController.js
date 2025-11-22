const db = require("../config/db");

// ------------------- VIEW MENU -------------------
exports.viewMenu = (req, res) => {
  const query = `
    SELECT c.category_name, i.menu_id, i.name, i.price, i.description
    FROM menu_items i
    JOIN menu_categories c ON i.category_id = c.category_id
    WHERE i.is_available = 1
    ORDER BY c.category_id;
  `;
  db.query(query, (err, results) => {
    if (err) throw err;
    results.forEach((item) => (item.price = parseFloat(item.price)));
    res.render("guest/menu", { menuItems: results, user: req.session.user });
  });
};

// ------------------- PLACE ORDER -------------------
exports.placeOrder = (req, res) => {
  const { items } = req.body; // array of {menu_id, quantity}
  const guestId = req.session.user.user_id;
  const roomNumber = req.session.user.room_number || 101; // example

  if (!items || items.length === 0) return res.send("No items selected.");

  let subtotal = 0;
  items.forEach((i) => (subtotal += i.price * i.quantity));
  const tax = subtotal * 0.05;
  const service = subtotal * 0.02;
  const total = subtotal + tax + service;

  const orderQuery = `
    INSERT INTO orders (guest_id, room_number, status, subtotal, tax_amount, service_charge, total_amount)
    VALUES (?, ?, 'PLACED', ?, ?, ?, ?)
  `;
  db.query(
    orderQuery,
    [guestId, roomNumber, subtotal, tax, service, total],
    (err, orderRes) => {
      if (err) throw err;
      const orderId = orderRes.insertId;

      const itemValues = items.map((i) => [
        orderId,
        i.menu_id,
        i.quantity,
        i.price,
        i.price * i.quantity,
      ]);
      const itemQuery = `
      INSERT INTO order_items (order_id, menu_id, quantity, unit_price, subtotal)
      VALUES ?;
    `;
      db.query(itemQuery, [itemValues], (err2) => {
        if (err2) throw err2;
        res.redirect("/guest/orders");
      });
    }
  );
};

// ------------------- VIEW ORDERS -------------------
exports.viewOrders = (req, res) => {
  const guestId = req.session.user.user_id;
  const query = `
    SELECT o.order_id, o.status, o.total_amount, o.room_number
    FROM orders o
    WHERE o.guest_id = ?
    ORDER BY o.order_id DESC;
  `;
  db.query(query, [guestId], (err, results) => {
    if (err) throw err;
    res.render("guest/myOrders", { orders: results, user: req.session.user });
  });
};

// ------------------- VIEW INVOICE -------------------
// ----------------------------------------
// GET /guest/invoice/:order_id
// ----------------------------------------
exports.viewInvoice = (req, res) => {
  const { order_id } = req.params;

  const query = `
    SELECT 
      i.invoice_id,
      i.invoice_number,
      i.subtotal,
      i.tax,
      i.service_charge,
      i.total_amount,
      i.paid,
      u.full_name,
      o.room_number
    FROM invoices i
    JOIN orders o ON i.order_id = o.order_id
    JOIN users u ON o.guest_id = u.user_id
    WHERE i.order_id = ?;
  `;

  db.query(query, [order_id], (err, results) => {
    if (err) throw err;

    if (results.length === 0) {
      // No invoice found
      return res.status(404).render('error', {
        message: 'Invoice not found for this order.',
      });
    }

    // ✅ Pass invoice object properly
    const invoice = results[0];

    console.log("Order id: ", order_id);
    res.render('guest/invoice', { invoice });
    
  });
};

