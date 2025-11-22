const db = require('../config/db');

// ------------------- VIEW INVOICES -------------------
exports.viewInvoices = (req, res) => {
  const query = `
    SELECT i.invoice_id, i.invoice_number, u.full_name, i.total_amount, i.paid
    FROM invoices i
    JOIN orders o ON i.order_id = o.order_id
    JOIN users u ON o.guest_id = u.user_id;
  `;
  db.query(query, (err, results) => {
    if (err) throw err;
    res.render('billing/invoices', { invoices: results });
  });
};

// ------------------- GET PAYMENT PAGE -------------------
exports.getPaymentPage = (req, res) => {
  const { invoice_id } = req.params;
  const query = `SELECT * FROM invoices WHERE invoice_id = ?`;
  db.query(query, [invoice_id], (err, results) => {
    if (err) throw err;
    res.render('billing/payments', { invoice: results[0] });
  });
};

// ------------------- MAKE PAYMENT -------------------
exports.makePayment = (req, res) => {
  const { invoice_id } = req.params;
  const { amount, method } = req.body;

  const paymentQuery = `
    INSERT INTO payments (invoice_id, amount, payment_method, paid_at)
    VALUES (?, ?, ?, NOW());
  `;

  const updateInvoice = `
    UPDATE invoices SET paid = 1 WHERE invoice_id = ?;
  `;

  db.query(paymentQuery, [invoice_id, amount, method], (err) => {
    if (err) throw err;
    db.query(updateInvoice, [invoice_id], (err2) => {
      if (err2) throw err2;
      res.redirect('/billing/invoices');
    });
  });
};
