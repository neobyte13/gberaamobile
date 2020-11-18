import 'package:cloud_firestore/cloud_firestore.dart';

class DItem {
  final String id;
  final String receiverName;
  final String receiverPhone;
  final String pickupAddress;
  final String deliveryAddress;
  final String packageType;
  final String date;
  final String notes;
  final DocumentReference reference;

  DItem._(
      {this.receiverName,
      this.receiverPhone,
      this.pickupAddress,
      this.deliveryAddress,
      this.packageType,
      this.date,
      this.notes})
      : id = null,
        reference = null;

  DItem.fromSnapshot(DocumentSnapshot snapshot)
      : assert(snapshot != null),
        id = snapshot.id,
        receiverName = snapshot.data()['receiverName'],
        receiverPhone = snapshot.data()['receiverPhone'],
        pickupAddress = snapshot.data()['pickupAddress'],
        deliveryAddress = snapshot.data()['deliveryAddress'],
        packageType = snapshot.data()['packageType'],
        date = snapshot.data()['date'],
        notes = snapshot.data()['notes'],
        reference = snapshot.reference;
}
