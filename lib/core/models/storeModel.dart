import 'package:cloud_firestore/cloud_firestore.dart';

typedef StorePressedCallback = void Function(String storeId);

typedef CloseStorePressedCallback = void Function();

class Stores {
  final String id;
  final String name;
  final String type;
  final String location;
  final String image;
  final DocumentReference reference;

  Stores._({this.name, this.type, this.location, this.image})
      : id = null,
        reference = null;

  Stores.fromSnapshot(DocumentSnapshot snapshot)
      : assert(snapshot != null),
        id = snapshot.id,
        name = snapshot.data()['name'],
        type = snapshot.data()['type'],
        location = snapshot.data()['location'],
        image = snapshot.data()['image'],
        reference = snapshot.reference;
}
