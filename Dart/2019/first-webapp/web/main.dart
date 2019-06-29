import 'dart:html';

InputElement todoButton = querySelector('#todoButton');
InputElement toDoInput;
UListElement toDoList;

void main() {
  querySelector('#testing').text = 'Test Two';
  todoButton = querySelector('#todoButton');
  todoButton.onClick.listen(removeTodo);

  toDoInput = querySelector('#todo-input');
  toDoList = querySelector('#todo-list');
  toDoInput.onChange.listen(addToDoItem);

  Element uliTest = querySelector('#ULITest');
  uliTest.children.add(getItem("Test"));
  uliTest.children.addAll(getList());
  uliTest.children.add(Element.br());
  uliTest.children.addAll(getList2(["ListTwoOne", "ListTwoTwo", "ListTwoThree"]));
}

UListElement getItem(String itemText) => UListElement()..text = itemText;

List<UListElement> getList() {
  var list = <UListElement>[];

  list.add(UListElement()..text = "ItemOne");
  list.add(UListElement()..text = "ItemTwo");
  list.add(UListElement()..text = "ItemThree");

  return list;
}

List<UListElement> getList2(List<String> strList) {
  var ret = <UListElement>[];

  for (String str in strList) {
    ret.add(UListElement()..text = str);
  }

  return ret;
}

addToDoItem(Event e) {
  toDoList.children.add(LIElement()..text = toDoInput.value);
  toDoInput.value = '';
}

removeTodo(Event e) {
  toDoList.children.removeLast();
}