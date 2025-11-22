const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

// Login page
router.get('/login', authController.getLoginPage);

// Handle login submission
router.post('/login', authController.postLogin);

// Logout route
router.get('/logout', authController.logout);

module.exports = router;
