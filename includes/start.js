var express = require('express');
var router = express.Router();
var db = require("../config/mysql/connect");
var vToken = require("../validations/vToken");
var { message, errorMessage } = require("../functions/messages");