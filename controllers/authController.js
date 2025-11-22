const db = require('../config/db');

// ------------------- LOGIN PAGE -------------------
exports.getLoginPage = (req, res) => {
  if (req.session.user) return res.redirect('/dashboard');
  res.render('auth/login', { error: null });
};

// ------------------- LOGIN HANDLER -------------------
exports.postLogin = (req, res) => {
  const { username, password } = req.body;

  if (!username || !password)
    return res.render('auth/login', { error: 'Please enter both username and password.' });

  const query = `
    SELECT u.*, r.role_name 
    FROM users u
    JOIN roles r ON u.role_id = r.role_id
    WHERE u.username = ? AND u.password_hash = ?
  `;

  db.query(query, [username, password], (err, results) => {
    if (err) {
      console.error(err);
      return res.render('auth/login', { error: 'Database error.' });
    }

    if (results.length === 0)
      return res.render('auth/login', { error: 'Invalid username or password.' });

    req.session.user = results[0]; // store user info in session
    res.redirect('/dashboard');
  });
};

// ------------------- LOGOUT -------------------
exports.logout = (req, res) => {
  req.session.destroy(() => {
    res.redirect('/login');
  });
};
