import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Record {
  final String name;
  final String description;
  final Map<dynamic, dynamic> measurements;

  final DocumentReference reference;

  Future get imageUrl => _getImageUrl();

  Record.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['description'] != null),
        assert(map['measurements'] != null),
        name = map['name'],
        description = map['description'],
        measurements = map['measurements'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Future _getImageUrl() {
    final ref =
        FirebaseStorage.instance.ref().child('${reference.documentID}.jpg');

    return ref.getDownloadURL();
  }

  @override
  toString() => '$name\n$description';
}
