import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String name;
  final String description;
  final DocumentReference reference;

  final Map<dynamic, dynamic> measurements;

  Record.fromMap(Map<dynamic, dynamic> map, {this.reference})
    : assert(map['name'] != null),
      assert(map['description'] != null),
      assert(map['measurements'] != null),
      name = map['name'],
      description = map['description'],
      measurements = map['measurements'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override toString() => '$name - $description';
}