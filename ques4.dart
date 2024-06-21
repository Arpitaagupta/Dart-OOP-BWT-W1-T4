import 'dart:math';

class RandomBox<T> {
  List<T> _items = [];

  // Method to add an item to the box
  void add(T item) {
    _items.add(item);
  }

  // Method to check if the box is empty
  bool isEmpty() {
    return _items.isEmpty;
  }

  // Method to draw an item randomly from the box
  T? drawItem() {
    if (_items.isEmpty) {
      return null;
    }
    Random random = Random();
    int randomIndex = random.nextInt(_items.length);
    return _items[randomIndex];
  }
}

void main() {
  // Create a RandomBox of Strings (names)
  RandomBox<String> nameBox = RandomBox<String>();

  // Adding names to the box
  nameBox.add("Alice");
  nameBox.add("Bob");
  nameBox.add("Charlie");

  // Draw items from the box
  print("Drawing random names:");
  for (int i = 0; i < 5; i++) {
    if (!nameBox.isEmpty()) {
      print(nameBox.drawItem());
    } else {
      print("Box is empty.");
      break;
    }
  }

  // Create a RandomBox of Integers (lottery numbers)
  RandomBox<int> lotteryBox = RandomBox<int>();

  // Adding lottery numbers to the box
  lotteryBox.add(10);
  lotteryBox.add(25);
  lotteryBox.add(37);

  // Draw items from the box
  print("\nDrawing random lottery numbers:");
  for (int i = 0; i < 5; i++) {
    if (!lotteryBox.isEmpty()) {
      print(lotteryBox.drawItem());
    } else {
      print("Box is empty.");
      break;
    }
  }
}
