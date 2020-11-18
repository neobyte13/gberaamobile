import 'package:Gberaa/core/models/dItemModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Gberaa/core/models/storeModel.dart';

Stream<QuerySnapshot> loadAllStores() {
  return FirebaseFirestore.instance
      .collection('stores')
      .orderBy('name', descending: true)
      .limit(50)
      .snapshots();
}

Stream<QuerySnapshot> loadAllDItems() {
  return FirebaseFirestore.instance
      .collection('deliveryitems')
      .orderBy('id', descending: true)
      .snapshots();
}

Stream<QuerySnapshot> loadFarmStores() {
  Query getFarmStores = FirebaseFirestore.instance
      .collection('stores')
      .where('type', isEqualTo: 'Farm');
  return getFarmStores.snapshots();
}

Stream<QuerySnapshot> loadGroceryStores() {
  Query getGroceryStores = FirebaseFirestore.instance
      .collection('stores')
      .where('type', isEqualTo: 'Grocery');
  return getGroceryStores.snapshots();
}

List<Stores> getStoresFromQuery(QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
    return Stores.fromSnapshot(doc);
  }).toList();
}

List<DItem> getDeliveryItemsFromQuery(QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
    return DItem.fromSnapshot(doc);
  }).toList();
}

//Get single store
Future<Stores> getStore(String storeId) {
  return FirebaseFirestore.instance
      .collection('stores')
      .doc(storeId)
      .get()
      .then((DocumentSnapshot doc) => Stores.fromSnapshot(doc));
}
