const express = require('express');
const router = express.Router();
const deliveryController = require('../controllers/deliveryController');

// Middleware — allow only delivery staff
function isDelivery(req, res, next) {
  if (req.session.user && req.session.user.role_name === 'Delivery Staff') {
    next();
  } else {
    res.redirect('/login');
  }
}

// View assigned deliveries
router.get('/deliveries', isDelivery, deliveryController.viewDeliveries);

// Mark an order as delivered
router.post('/deliveries/complete/:order_id', isDelivery, deliveryController.markDelivered);

module.exports = router;
