const mongoose = require('mongoose');
// mongoose.connect('mongodb://localhost:3306');

mongoose.connect('mongodb://localhost/auth');

module.exports = mongoose;
