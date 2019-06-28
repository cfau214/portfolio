import 'dart:html';

void main() {
  querySelector('#output').text = 'Your Dart app is running.';
  querySelector('#testing').text = 'Test Two';

  Element output = querySelector('#LITest');
  output.children.add(getItem("TEST ONE"));
  output.children.add(getItem("Test TWO"));
  output.children.add(getItem("Third Item"));
}

LIElement getItem(String itemText) => LIElement()..text = itemText;
