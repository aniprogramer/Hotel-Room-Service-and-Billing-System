const express = require('express');
const router = express.Router();
const kitchenController = require('../controllers/kitchenController');

// Middleware — allow only kitchen staff
function isKitchen(req, res, next) {
  if (req.session.user && req.session.user.role_name === 'Kitchen Staff') {
    next();
  } else {
    res.redirect('/login');
  }
}

// View all placed or preparing orders
router.get('/orders', isKitchen, kitchenController.viewOrders);

// Update order status (e.g., PREPARING → READY)
router.post('/orders/update/:order_id', isKitchen, kitchenController.updateOrderStatus);

module.exports = router;
