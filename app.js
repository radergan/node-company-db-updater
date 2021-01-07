var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "password",
  database: "company_db"
});

connection.connect(function(err) {
  if (err) throw err;
  runSearch();
});

function runSearch() {
  inquirer
    .prompt({
      name: "action",
      type: "rawlist",
      message: "What would you like to do?",
      choices: [
        "a) Find a specific employee",
        "b) Add a new employee",
        "c) Remove an employee",
        "d) List all employees"
      ]
    })
    .then(function(answer) {
      switch (answer.action.toLowerCase()) {
      case "a":
        findEmployee();
        break;
      /*
      case "b":
        addEmployee();
        break;

      case "c":
        removeEmployee();
        break;

      case "d":
        listEmployee();
        break;
      
    */
      }
    });
}

function findEmployee() {
  inquirer
    .prompt({
      name: "employee",
      type: "input",
      message: "Employee name:"
    })
    .then(function(answer) {
      var query = "SELECT first_name + last_name AS worker_name from employees WHERE worker_name LIKE % ? %";
      connection.query(query, { worker: answer.employee }, function(err, res) {
        for (var i = 0; i < res.length; i++) {
          console.log("Employee: " + res[i].worker_name);
        }
        runSearch();
      });
    });
}
