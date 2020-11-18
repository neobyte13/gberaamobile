import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeliveryDashboard extends StatefulWidget {
  @override
  _DeliveryDashboardState createState() => _DeliveryDashboardState();
}

class _DeliveryDashboardState extends State<DeliveryDashboard> {
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: MaterialButton(
            onPressed: () {
              firestoreInstance
                  .collection("deliveryitems")
                  .doc(firebaseUser.uid)
                  .set({
                "receiverName": "Alimson",
                "receiverPhone": "08123456789",
                "pickupAddress": "Australia",
                "deliveryAddress": "Canada",
                "packageType": "Small Parcel",
                "date": "25-12-2020/12:35",
                "notes": "wahala be like bicycle",
              }, SetOptions(merge: true)).then((value) {
                print('success!');
              });
            },
            child: Text('Add Data'),
            splashColor: Colors.orangeAccent,
          ),
        ),
      ],
    );
  }
}
