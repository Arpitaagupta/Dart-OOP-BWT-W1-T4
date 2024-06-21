// Import necessary libraries
import 'dart:core';

// Part 1: Movie and Subclasses

// Abstract Movie Class
abstract class Movie {
  int _idNumber;
  String _title;
  int _rentedDays;

  Movie(this._idNumber, this._title, this._rentedDays);

  // Accessor and Mutator methods
  int get idNumber => _idNumber;
  set idNumber(int id) => _idNumber = id;

  String get title => _title;
  set title(String title) => _title = title;

  int get rentedDays => _rentedDays;
  set rentedDays(int days) => _rentedDays = days;

  // Abstract method for calculating late fees
  double calcLateFees(int lateDays);

  // Method to check equality
  bool equals(Movie other) {
    return this._idNumber == other._idNumber &&
        this._title == other._title &&
        this._rentedDays == other._rentedDays;
  }
}

// Action Subclass
class Action extends Movie {
  Action(int idNumber, String title, int rentedDays)
      : super(idNumber, title, rentedDays);

  @override
  double calcLateFees(int lateDays) {
    return lateDays * 3.0;
  }
}

// Comedy Subclass
class Comedy extends Movie {
  Comedy(int idNumber, String title, int rentedDays)
      : super(idNumber, title, rentedDays);

  @override
  double calcLateFees(int lateDays) {
    return lateDays * 2.5;
  }
}

// Drama Subclass
class Drama extends Movie {
  Drama(int idNumber, String title, int rentedDays)
      : super(idNumber, title, rentedDays);

  @override
  double calcLateFees(int lateDays) {
    return lateDays * 2.0;
  }
}

// Part 2: Person and Subclasses

// Abstract Person Class
abstract class Person {
  String _name;

  Person(this._name);

  // Accessor methods
  String get name => _name;
  set name(String name) => _name = name;

  // Abstract method
  bool isOutstanding();
}

// Student Subclass
class Student extends Person {
  double _cgpa;

  Student(String name, this._cgpa) : super(name);

  // Accessor methods
  double get cgpa => _cgpa;
  set cgpa(double cgpa) => _cgpa = cgpa;

  @override
  bool isOutstanding() {
    return _cgpa > 3.5;
  }
}

// Professor Subclass
class Professor extends Person {
  int _numberOfPublications;

  Professor(String name, this._numberOfPublications) : super(name);

  // Accessor methods
  int get numberOfPublications => _numberOfPublications;
  set numberOfPublications(int numberOfPublications) =>
      _numberOfPublications = numberOfPublications;

  @override
  bool isOutstanding() {
    return _numberOfPublications > 50;
  }
}

// Main Method to Test All Functionality
void main() {
  // Part 1: Testing Movie Classes
  // Create movie objects
  Movie actionMovie = Action(101, "Action Movie", 3);
  Movie comedyMovie = Comedy(102, "Comedy Movie", 5);
  Movie dramaMovie = Drama(103, "Drama Movie", 7);

  // Test calcLateFees polymorphically
  print("Late fees for Action Movie: \$${actionMovie.calcLateFees(4)}");
  print("Late fees for Comedy Movie: \$${comedyMovie.calcLateFees(4)}");
  print("Late fees for Drama Movie: \$${dramaMovie.calcLateFees(4)}");

  // Downcasting to reset ID for Action Movie
  if (actionMovie is Action) {
    (actionMovie as Action).idNumber = 201;
    print("New ID for Action Movie: ${actionMovie.idNumber}");
  }

  // Testing equals method
  Movie anotherActionMovie = Action(201, "Action Movie", 3);
  print(
      "Are the two Action movies equal? ${actionMovie.equals(anotherActionMovie)}");

  Movie anotherComedyMovie = Comedy(102, "Comedy Movie", 5);
  print(
      "Are the Action and Comedy movies equal? ${actionMovie.equals(anotherComedyMovie)}");

  print('\n');

  // Part 2: Testing Person Classes
  // Creating instances of Student and Professor
  Person student1 = Student("Alia", 3.6);
  Person professor1 = Professor("Dr. Smitha", 30);

  // Array of Person objects
  List<Person> persons = [student1, professor1];

  // Checking outstanding status
  for (Person person in persons) {
    print("${person.name} is outstanding? ${person.isOutstanding()}");
  }

  // Setting publication count to 100 for professor and checking again
  if (professor1 is Professor) {
    (professor1 as Professor).numberOfPublications = 100;
    print(
        "${professor1.name} with updated publications is outstanding? ${professor1.isOutstanding()}");
  }
}
