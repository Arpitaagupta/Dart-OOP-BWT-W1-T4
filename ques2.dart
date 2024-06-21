/* 
Ques-2
Create an Encapsulated class Student with following:
Data Members:
a. String Name
b. Int [] Result_array[5] // Result array contains the marks for 5 subjects
Methods:
a. Default constructor
b. One- argument constructor (for Name)
c. two- argument constructor
d. Average ( ??? ) // it returns the average based on the marks in the array.
e. CompareAverage(?) //compares Average of two students
 */

class Student {
  // Private data members
  late String _name;
  late List<int> _resultArray;

  // Default constructor
  Student() {
    _name = '';
    _resultArray = List<int>.filled(5, 0);
  }

  // One-argument constructor (for Name)
  Student.nameOnly(this._name) {
    _resultArray = List<int>.filled(5, 0);
  }

  // Two-argument constructor
  Student.withResults(this._name, List<int> resultArray) {
    if (resultArray.length == 5) {
      _resultArray = resultArray;
    } else {
      throw ArgumentError('Result array must contain exactly 5 subjects.');
    }
  }

  // Getter and setter for name
  String get name => _name;
  set name(String name) => _name = name;

  // Getter and setter for result array
  List<int> get resultArray => _resultArray;
  set resultArray(List<int> resultArray) {
    if (resultArray.length == 5) {
      _resultArray = resultArray;
    } else {
      throw ArgumentError('Result array must contain exactly 5 subjects.');
    }
  }

  // Method to calculate average marks
  double average() {
    int sum = _resultArray.reduce((a, b) => a + b);
    return sum / _resultArray.length;
  }

  // Method to compare average marks of two students
  bool compareAverage(Student other) {
    return this.average() > other.average();
  }
}

void main() {
  // Creating instances of Student
  Student student1 = Student.withResults('Arpita', [80, 90, 85, 70, 95]);
  Student student2 = Student.withResults('Heena', [60, 75, 80, 85, 70]);

  // Printing the average of each student
  print('Average marks of ${student1.name}: ${student1.average()}');
  print('Average marks of ${student2.name}: ${student2.average()}');

  // Comparing averages
  if (student1.compareAverage(student2)) {
    print('${student1.name} has a higher average than ${student2.name}');
  } else {
    print('${student2.name} has a higher average than ${student1.name}');
  }
}
