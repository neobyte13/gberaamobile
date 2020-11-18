import 'dart:async';

import 'package:Gberaa/core/models/storeModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:Gberaa/core/services/api.dart' as data;

class GroceryScreen extends StatefulWidget {
  GroceryScreen({Key key}) : super(key: key);
  @override
  _GroceryScreenState createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  _GroceryScreenState() {
    FirebaseAuth.instance
        .signInAnonymously()
        .then((UserCredential userCredential) {
      _currentSubscription = data.loadGroceryStores().listen(_updateStores);
    });
  }

  @override
  void dispose() {
    _currentSubscription?.cancel();
    super.dispose();
  }

  StreamSubscription<QuerySnapshot> _currentSubscription;
  bool _isLoading = true;
  List<Stores> _gStores = <Stores>[];

  void _updateStores(QuerySnapshot snapshot) {
    setState(() {
      _isLoading = false;
      _gStores = data.getStoresFromQuery(snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
