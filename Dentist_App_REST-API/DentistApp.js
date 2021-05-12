var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var mysql = require('mysql');
  
//to support JSON-encoded bodies
app.use(bodyParser.json({strict: false}));
//to support URL-encoded bodies
app.use(bodyParser.urlencoded({
extended: true
}));
  
  
// default route
app.get('/', function (req, res) {
    return res.send({ error: true, message: 'hello' })
});


//connection configurations
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'aidaDB',
    password: 'dentist6673053',
    database: 'Dentist'
});
  
// connect to database
connection.connect(); 
 
 
//Retrieve all patients 
app.get('/patients', function (req, res) {
    connection.query('CALL allPatients()', function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'Patient list.' });
    });
});


//Retrieve all dentists 
app.get('/dentists', function (req, res) {
    connection.query('CALL allDentists()', function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'Dentist list.' });
    });
});
 
//get a patient info by ID
app.get('/patient/:id', function (req, res) {

	let id = req.params.id;
    
    if (!id) {
        return res.status(400).send({ error: true, message: 'Please provide id' });
    }
    
    connection.query('CALL patient(?)', [id], function (error, results, fields) {
       if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'Patient list' });
    });
});


//get a dentist info by ID
app.get('/dentist/:id', function (req, res) {

	let id = req.params.id;
    
    if (!id) {
        return res.status(400).send({ error: true, message: 'Please provide id' });
    }
    
    connection.query('CALL dentist(?)', [id], function (error, results, fields) {
       if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'Dentist list' });
    });
});

//Find the name and speciality of a patient's dentist
app.get('/patientsDentist/:id', function (req, res) {

	let id = req.params.id;
    
    if (!id) {
        return res.status(400).send({ error: true, message: 'Please provide id' });
    }
    
    connection.query('CALL patientsDentist(?)', [id], function (error, results, fields) {
       if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'Patients dentist provided' });
    });
});

//Find the name and speciality of a patient's dentist
app.get('/dentistsPatient/:id', function (req, res) {

	let id = req.params.id;
	
    
    if (!id) {
        return res.status(400).send({ error: true, message: 'Please provide id' });
    }
    
    connection.query('CALL dentistsPatient(?)', [id], function (error, results, fields) {
       if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'Dentists patients provided' });
    });
});
 
 //Add a new patient  
app.post('/patient', function (req, res) {
  
  	let name= req.body.name;
  	let dentist= req.body.dentist;
  	let phoneNumber= req.body.phoneNumber;

  	connection.query('CALL addPatient(?,?,?)', [name, dentist, phoneNumber], function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'New patient has been created successfully!' });
    });
});
 
 
//Add a new dentist  
app.post('/dentist', function (req, res) {
  
  	let id= req.body.id;
  	let name= req.body.name;
  	let speciality= req.body.speciality;
  	
  	connection.query('CALL addDentist(?,?,?)', [id, name, speciality], function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'New dentist has been created successfully!' });
    });
});


//Update dentist with id
app.put('/dentist', function (req, res) {
  
	let id= req.body.id;
  	let name= req.body.name;
  	let speciality= req.body.speciality;
  
   connection.query('CALL updateDentist(?,?,?)', [id, name, speciality], function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'Dentist has been updated successfully!' });
    });
});

//Update patient with id
app.put('/patient', function (req, res) {
  
  	let id= req.body.id;
  	let name= req.body.name;
  	let dentist= req.body.dentist;
  	let phoneNumber= req.body.phoneNumber;

  	connection.query('CALL updatePatient(?,?,?,?)', [id, name, dentist, phoneNumber], function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'Patient has been updated successfully!' });
    });
});
 
 
//Delete patient by id
app.delete('/patient/:id', function (req, res) {
  
  	let id = req.params.id;
  
    if (!id) {
        return res.status(400).send({ error: true, message: 'Please provide id' });
    }
  	connection.query('CALL deletePatient(?)', [id], function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'Patient has been removed successfully.' });
    });
}); 
 
 
 //Delete dentist by id
app.delete('/dentist/:id', function (req, res) {
  
  	let id = req.params.id;
  
    if (!id) {
        return res.status(400).send({ error: true, message: 'Please provide id' });
    }
  	connection.query('CALL deleteDentist(?)', [id], function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: null, data: results[0], message: 'Dentist has been removed successfully.' });
    });
}); 
 
 
 
//node server is on 3000 port
app.listen(3000, function () {
    console.log('Node app is running on port 3000');
});
 
module.exports = app;