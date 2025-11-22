const express = require('express');
const router = express.Router();
const guestController = require('../controllers/guestController');

// Middleware — allow only logged-in guests
function isGuest(req, res, next) {
  if (req.session.user && req.session.user.role_name === 'Guest') {
    next();
  } else {
    res.redirect('/login');
  }
}

// View all menu items
router.get('/menu', isGuest, guestController.viewMenu);

// Place a new order
router.post('/order', isGuest, guestController.placeOrder);

// View guest’s past orders
router.get('/orders', isGuest, guestController.viewOrders);

// View invoice for a particular order
router.get('/invoice/:order_id', isGuest, guestController.viewInvoice);

module.exports = router;
