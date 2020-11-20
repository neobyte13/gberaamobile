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
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('deliveryitems')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 6,
                        child: Column(
                          children: <Widget>[
                            Text('Status: PENDING'),
                            Text('Pickup Address: ' + document['pickup']),
                            Text('Delivery Address: ' + document['delivery']),
                            Text('Package Type: ' + document['type']),
                            Text('Receiver\'s name: ' + document['name']),
                            Text('Receiver\'s phone number: ' +
                                document['phone']),
                            Text('Notes: ' + document['notes']),
                            SizedBox(height: 10.0),
                          ],
                        )),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
/*Container(
          child: MaterialButton(
            onPressed: () {
              firestoreInstance
                  .collection("deliveryitems")
                  .snapshots()
                  .listen((result) {
                result.docs.forEach((result) {
                  print(result.data());
                });
              });
            },
            child: Text('Press me'),
          ),
        ),*/
