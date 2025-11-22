const express = require('express');
const router = express.Router();
const billingController = require('../controllers/billingController');

// Middleware — allow only billing staff
function isBilling(req, res, next) {
  if (req.session.user && req.session.user.role_name === 'Billing Staff') {
    next();
  } else {
    res.redirect('/login');
  }
}

// View all invoices
router.get('/invoices', isBilling, billingController.viewInvoices);

// Get payment form for specific invoice
router.get('/pay/:invoice_id', isBilling, billingController.getPaymentPage);

// Submit payment for invoice
router.post('/pay/:invoice_id', isBilling, billingController.makePayment);

module.exports = router;
