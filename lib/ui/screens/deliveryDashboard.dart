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
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            /*Text('Status: PENDING'),
                            Text('Pickup Address: ' + document['pickup']),
                            Text('Delivery Address: ' + document['delivery']),
                            Text('Package Type: ' + document['type']),
                            Text('Receiver\'s name: ' + document['name']),
                            Text('Receiver\'s phone number: ' +
                                document['phone']),
                            Text('Notes: ' + document['notes']),*/
                            Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.arrow_drop_down_circle),
                                    title: const Text('Status: PENDING'),
                                    subtitle: Text(
                                      'Package Type: ' + document['type'],
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Receiver\'s name: ' +
                                              document['name'],
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.6)),
                                        ),
                                        Text(
                                          'Receiver\'s phone number : ' +
                                              document['phone'],
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.6)),
                                        ),
                                        Text(
                                          'Pickup Address : ' +
                                              document['pickup'],
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.6)),
                                        ),
                                        Text(
                                          'Delivery Address: ' +
                                              document['delivery'],
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.6)),
                                        ),
                                        Text(
                                          'Notes : ' + document['notes'],
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.6)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.start,
                                    children: [
                                      FlatButton(
                                        textColor: Colors.green,
                                        onPressed: () {
                                          // Perform some action
                                        },
                                        child: const Text('Confirm Delivery'),
                                      ),
                                      FlatButton(
                                        textColor: const Color(0xFF6200EE),
                                        onPressed: () {
                                          // Perform some action
                                        },
                                        child: const Text('Edit'),
                                      ),
                                      FlatButton(
                                        textColor: Colors.red,
                                        onPressed: () {
                                          // Perform some action
                                        },
                                        child: const Text('Delete'),
                                      ),
                                      FlatButton(
                                        textColor: const Color(0xFF6200EE),
                                        onPressed: () {
                                          // Perform some action
                                        },
                                        child:
                                            const Text('Call Assigned Driver'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
