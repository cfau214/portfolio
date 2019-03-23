/// Square Class
import 'shape.dart';

class Square extends Shape {
  int length;
  int width;

  Square({this.length = 2, this.width = 2});

  num get _area => length*width;

  @override
  String toString() => 'Length: ${length}, Width: ${width}, Area: ${_area}';
}
