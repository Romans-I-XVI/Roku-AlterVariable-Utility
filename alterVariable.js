const PORT=3000; 
//require modules
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var instances = {};
var request = require('request');
var fs = require('fs');

app.use(bodyParser.json());

// -----------Handle POST requests to server----------------

app.post('/', function(req, res){
	var data = req.body;
	instances = data;
	res.sendStatus(200);
});

app.get('/', function(req, res){
	// data = req.body;
	fs.readFile('alterVariable.html', function (err, data) {
		res.write(data);
		for (var key in instances){
			if (instances[key].length > 0){
				res.write(key+" = "+instances[key]+"<br>");
			}
		}
		res.write("</body></html>");
		res.send();
	});
});


app.listen(PORT);
