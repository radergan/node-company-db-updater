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
      message: "What would you like to do?\n",
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
      */
      case "List all employees":
        listEmployee();
        break;
      }
    });
}

function listEmployee() {
  var query = `select first_name, last_name, title, department.name as department
      from employee
      join employee_role on employee_role.id = employee.role_id
      join department on department_id = department.id`;
      connection.query(query, function(err, res) {
        if (err) throw err;
        let results = [];
        for (var i = 0; i < res.length; i++) {
          results.push({
            first: res[i].first_name, 
            last: res[i].last_name,
            title: res[i].title,
            department: res[i].department
          })
        }
        if (results.length > 0) {
          console.table(results);
          console.log('\n');
        }
        else{
          console.log("\nNo employees are currently in the database.\n")
        }
        runSearch();
      });
}

function findEmployee() {
  inquirer
    .prompt({
      name: "name",
      type: "input",
      message: "Employee name: "
    })
    .then(function(answer) {
      var query = `select first_name, last_name, title, department.name as department
      from employee
      join employee_role on employee_role.id = employee.role_id
      join department on department_id = department.id
      WHERE first_name = ? or last_name = ?`;
      connection.query(query, [answer.name, answer.name], function(err, res) {
        if (err) throw err;
        let results = [];
        for (var i = 0; i < res.length; i++) {
          results.push({
            first: res[i].first_name, 
            last: res[i].last_name,
            title: res[i].title,
            department: res[i].department
          })
        }
        if (results.length > 0) {
          console.table(results);
          console.log('\n');
        }
        else{
          console.log("\nNo results matched your query.\n")
        }
        runSearch();
      });
    });
}
