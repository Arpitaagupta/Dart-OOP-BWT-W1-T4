// Job class
class Job {
  String _designation;
  double _salary;
  int _id;

  Job(this._designation, this._salary, this._id);

  // Getters
  String get designation => _designation;
  double get salary => _salary;
  int get id => _id;

  // Setters
  set designation(String designation) {
    _designation = designation;
  }

  set salary(double salary) {
    _salary = salary;
  }

  set id(int id) {
    _id = id;
  }
}

// Employee class with Job object
class Employee {
  String _name;
  int _age;
  Job _job;

  Employee(this._name, this._age, this._job);

  // Getters
  String get name => _name;
  int get age => _age;
  Job get job => _job;

  // Setters
  set name(String name) {
    _name = name;
  }

  set age(int age) {
    _age = age;
  }

  set job(Job job) {
    _job = job;
  }

  // Method to check if salary is greater than 50,000
  bool isSalaryGreaterThan50k() {
    return _job.salary > 50000;
  }

  // Display function
  void display() {
    print("Employee: $_name, Age: $_age");
    print(
        "Job Details: ${_job.designation}, Salary: ${_job.salary}, ID: ${_job.id}");
  }
}

void main() {
  // Creating a Job object
  Job job1 = Job("Data Analyst", 60000.0, 101);

  // Creating an Employee object
  Employee emp1 = Employee("Jiya Jain", 30, job1);

  // Displaying employee details
  emp1.display();

  Job job2 = Job("Backend Engineer", 65000.0, 102);
  Employee emp2 = Employee("Abhishek Roy", 25, job2);

  // Modifying job details
  job1.salary = 55000.0;
  emp1.job = job1;
  job2.salary = 49000.0;
  emp2.job = job2;

  // Displaying modified employee details
  emp1.display();
  emp2.display();

  // Checking again if salary is greater than 50,000
  if (emp1.isSalaryGreaterThan50k()) {
    print("${emp1.name}'s salary is greater than 50,000.");
  } else {
    print("${emp1.name}'s salary is not greater than 50,000.");
  }
  ;

  if (emp2.isSalaryGreaterThan50k()) {
    print("${emp2.name}'s salary is greater than 50,000.");
  } else {
    print("${emp2.name}'s salary is not greater than 50,000.");
  }
}
