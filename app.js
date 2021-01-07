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
        "Find a specific employee",
        "Add a new employee",
        "Remove an employee",
        "List all employees"
      ]
    })
    .then(function(answer) {
      switch (answer.action) {
      case "Find a specific employee":
        findEmployee();
        break;
      /*
      case "Add a new employee":
        addEmployee();
        break;

      case "Remove an employee":
        removeEmployee();
        break;

      case "List all employees":
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
      message: "Employee name: "
    })
    .then(function(answer) {
      var query = "SELECT first_name from employee WHERE ?";
      connection.query(query, { first_name: answer.employee }, function(err, res) {
        if (err) throw err;
        if(res.length > 0){
          for (var i = 0; i < res.length; i++) {
            console.log("Employee: " + res[i].first_name);
          }
        }else{
          console.log("No employees match this query.");
        }
        runSearch();
      });
    });
}
