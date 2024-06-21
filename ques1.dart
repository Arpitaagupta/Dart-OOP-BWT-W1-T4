/* 
Ques-1

(The Person, Student, Employee, Faculty, and Staff classes)
Design a class named Person and its two subclasses named Student and Employee. Make
Faculty and Staff subclasses of Employee.
A person has a name, address (Address), phone number, and email address.
A student has a status(String)
An employee has an office, salary, and date hired. Use the Date class defined earlier to create
an object for date hired.
A faculty member has office hours and a rank.
A staff member has a title.
Create display function only in faculty and Staff class only.
Keep Data members private.
 */

// Base class Person
class Person {
  String _name;
  String _address;
  String _phoneNumber;
  String _emailAddress;

  Person(this._name, this._address, this._phoneNumber, this._emailAddress);

  // Getters and setters
  String get name => _name;
  set name(String name) => _name = name;

  String get address => _address;
  set address(String address) => _address = address;

  String get phoneNumber => _phoneNumber;
  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;

  String get emailAddress => _emailAddress;
  set emailAddress(String emailAddress) => _emailAddress = emailAddress;
}

// Subclass Student
class Student extends Person {
  String _status;

  Student(String name, String address, String phoneNumber, String emailAddress,
      this._status)
      : super(name, address, phoneNumber, emailAddress);

  // Getter and setter
  String get status => _status;
  set status(String status) => _status = status;
}

// Date class to represent date
class Date {
  int day;
  int month;
  int year;

  Date(this.day, this.month, this.year);

  @override
  String toString() {
    return '$day/$month/$year';
  }
}

// Subclass Employee
class Employee extends Person {
  String _office;
  double _salary;
  Date _dateHired;

  Employee(String name, String address, String phoneNumber, String emailAddress,
      this._office, this._salary, this._dateHired)
      : super(name, address, phoneNumber, emailAddress);

  // Getters and setters
  String get office => _office;
  set office(String office) => _office = office;

  double get salary => _salary;
  set salary(double salary) => _salary = salary;

  Date get dateHired => _dateHired;
  set dateHired(Date dateHired) => _dateHired = dateHired;
}

// Subclass Faculty
class Faculty extends Employee {
  String _officeHours;
  String _rank;

  Faculty(
      String name,
      String address,
      String phoneNumber,
      String emailAddress,
      String office,
      double salary,
      Date dateHired,
      this._officeHours,
      this._rank)
      : super(name, address, phoneNumber, emailAddress, office, salary,
            dateHired);

  // Getters and setters
  String get officeHours => _officeHours;
  set officeHours(String officeHours) => _officeHours = officeHours;

  String get rank => _rank;
  set rank(String rank) => _rank = rank;

  // Display function
  void display() {
    print('Faculty: $name, Rank: $rank, Office Hours: $officeHours');
  }
}

// Subclass Staff
class Staff extends Employee {
  String _title;

  Staff(String name, String address, String phoneNumber, String emailAddress,
      String office, double salary, Date dateHired, this._title)
      : super(name, address, phoneNumber, emailAddress, office, salary,
            dateHired);

  // Getter and setter
  String get title => _title;
  set title(String title) => _title = title;

  // Display function
  void display() {
    print('Staff: $name, Title: $title');
  }
}

void main() {
  // Creating instances
  var faculty = Faculty(
      'Aastha Goya;',
      'Ahemdabad Gujarat',
      '+91 93XXX XXXXX',
      'goyalaastha23@gmail.com',
      'Room 101',
      50000,
      Date(1, 1, 2020),
      '9-5',
      'Professor');
  var staff = Staff('Anand Roy', 'Kolkata, West Bengal', '+91 89XXX XXXXX',
      'anand123@gmail.com', 'Room 102', 40000, Date(2, 2, 2021), 'Manager');

  // Display information
  faculty.display();
  staff.display();
}


/* 

Explanation:
1. Person Class: This is the base class with private members _name, _address, _phoneNumber, and _emailAddress. It has getters and setters for each of these properties.

2. Student Class: Inherits from Person and adds a private _status property with its getter and setter.

3. Date Class: A simple class to represent a date with day, month, and year.

4. Employee Class: Inherits from Person and adds private _office, _salary, and _dateHired properties with their getters and setters.

5. Faculty Class: Inherits from Employee and adds private _officeHours and _rank properties. It includes a display method to print information.

6. Staff Class: Inherits from Employee and adds a private _title property. It includes a display method to print information.

The main function demonstrates creating instances of Faculty and Staff and displaying their information using the display method.
 */