const db = require('../config/db');

// ------------------- VIEW ORDERS -------------------
exports.viewOrders = (req, res) => {
  const query = `
    SELECT o.order_id, u.full_name AS guest_name, o.status, o.total_amount, o.room_number
    FROM orders o
    JOIN users u ON o.guest_id = u.user_id
    WHERE o.status IN ('PLACED', 'PREPARING');
  `;
  db.query(query, (err, results) => {
    if (err) throw err;
    res.render('kitchen/orders', { orders: results, user: req.session.user });
  });
};

// ------------------- UPDATE ORDER STATUS -------------------
exports.updateOrderStatus = (req, res) => {
  const { order_id } = req.params;
  const { status } = req.body;
  const query = `UPDATE orders SET status = ? WHERE order_id = ?`;
  db.query(query, [status, order_id], (err) => {
    if (err) throw err;
    res.redirect('/kitchen/orders');
  });
};
