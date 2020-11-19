import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final _formKey = GlobalKey<FormState>();
  final packageType = [
    "Small Parcel[0-1000g]",
    "Small Package[1kg-3kg]",
    "Large Package[3kg-5kg]",
    "XLarge[6kg+]"
  ];
  String dropdownValue = 'Small Parcel[0-1000g]';
  final pickupController = TextEditingController();
  final deliveryController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final notesController = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  final textlogo = Container(
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.all(12.0),
      child: Text(
        'Place a delivery request',
        style: GoogleFonts.lato(
          fontSize: 30,
          color: Colors.orange,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    textlogo,
                    SizedBox(height: 48.0),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Pickup Address',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      controller: pickupController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a pickup address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Delivery Address',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                      controller: deliveryController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a delivery address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Receiver\'s name',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Receiver\'s phone number',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                      controller: phoneController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: DropdownButtonFormField(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        decoration: InputDecoration(
                          labelText: "Select Package Type",
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        items: packageType.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please select a package type';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Additional notes',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                      controller: notesController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a message for us';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.0),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        height: 70,
                        width: 100,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {
                            var firebaseUser =
                                FirebaseAuth.instance.currentUser;
                            firestoreInstance
                                .collection("deliveryitems")
                                .doc(firebaseUser.uid)
                                .set({
                              "name": nameController.text,
                              "phone": phoneController.text,
                              "pickup": pickupController.text,
                              "delivery": deliveryController.text,
                              "notes": notesController.text,
                              "type": dropdownValue,
                              "date": DateTime.now(),
                            }).then((_) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Successfully Added')));
                              phoneController.clear();
                              nameController.clear();
                              pickupController.clear();
                              deliveryController.clear();
                              notesController.clear();
                              print("success!");
                            });
                          } /*{
                            if (_formKey.currentState.validate()) {
                              dbRef.push().set({
                                "name": nameController.text,
                                "phone": phoneController.text,
                                "pickup": pickupController.text,
                                "delivery": deliveryController.text,
                                "type": dropdownValue
                              }).then((_) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Successfully Added')));
                                phoneController.clear();
                                nameController.clear();
                                pickupController.clear();
                                deliveryController.clear();
                              }).catchError((onError) {
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text(onError)));
                              });
                            }
                          }*/
                          ,
                          padding: EdgeInsets.all(12),
                          color: Colors.orangeAccent,
                          child: Text('Submit',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    nameController.dispose();
    pickupController.dispose();
    deliveryController.dispose();
    notesController.dispose();
  }
}
