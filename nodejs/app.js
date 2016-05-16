var PORT = 9292;

var express = require('express');
var bodyParser = require("body-parser");
var app = express();

app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.set('view engine', 'ejs');



var dimmers = [
  {id: 'sala', name: 'Sala', value: 60}
];

var switches = [
  {id: 'corredor', name: 'Corredor', value: true}
];

app.get('/', function (req, res) {
  res.render('index', {title: 'HomeAuto', dimmers: dimmers, switches: switches});
});

app.post('/set_dimmer', function(req, res) {
  console.log("Definindo o dimmer " + req.body.dimmer_id + " como " + req.body.dimmer_value);
});

app.post('/set_switch', function(req, res) {
  console.log("Definindo o switch " + req.body.switch_id + " como " + req.body.switch_status);
});

app.listen(PORT, function () {
  console.log('Example app listening on PORT ' + PORT);
});
