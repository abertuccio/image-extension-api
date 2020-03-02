var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var loginRouter = require('./routes/login');
var logoutRouter = require('./routes/logout');
var tokenRouter = require('./routes/token');
var profileRouter = require('./routes/profile');
var customerRouter = require('./routes/customer');
var usersRouter = require('./routes/users');
var portalsRouter = require('./routes/portals');
var productRouter = require('./routes/product');
var reportsRouter = require('./routes/reports');
var sellersRouter = require('./routes/sellers');
var categoriesRouter = require('./routes/categories');
var searchesRouter = require('./routes/searches');
var imgMatcherRouter = require('./routes/imgMatcher');
var machesRouter = require('./routes/maches');

var casesRouter = require('./routes/cases');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/login', loginRouter);
app.use('/logout', logoutRouter);
app.use('/token', tokenRouter);
app.use('/profile', profileRouter);
app.use('/customer', customerRouter);
app.use('/users', usersRouter);
app.use('/portals', portalsRouter);
app.use('/product', productRouter);
app.use('/reports', reportsRouter);
app.use('/sellers', sellersRouter);
app.use('/categories', categoriesRouter);
app.use('/searches', searchesRouter);
app.use('/imgMatcher', imgMatcherRouter);
app.use('/maches', machesRouter);

app.use('/cases', casesRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;