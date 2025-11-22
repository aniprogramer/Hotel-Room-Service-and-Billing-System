const db = require('../config/db');

// ------------------- VIEW DELIVERIES -------------------
exports.viewDeliveries = (req, res) => {
  const staffId = req.session.user.user_id;
  const query = `
    SELECT d.delivery_id, d.delivery_status, o.order_id, o.room_number, u.full_name
    FROM deliveries d
    JOIN orders o ON d.order_id = o.order_id
    JOIN users u ON o.guest_id = u.user_id
    WHERE d.staff_id = ?;
  `;
  db.query(query, [staffId], (err, results) => {
    if (err) throw err;
    res.render('delivery/deliveries', { deliveries: results });
  });
};

// ------------------- MARK DELIVERED -------------------
exports.markDelivered = (req, res) => {
  const { order_id } = req.params;
  const query = `
    UPDATE deliveries 
    SET delivery_status = 'DELIVERED', delivered_at = NOW() 
    WHERE order_id = ?;
  `;
  db.query(query, [order_id], (err) => {
    if (err) throw err;
    res.redirect('/delivery/deliveries');
  });
};
