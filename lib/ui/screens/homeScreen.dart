import 'package:Gberaa/ui/screens/deliveryScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.uid});
  final String uid;
  final String title = "Home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              child: Container(
                alignment: Alignment.topCenter,
                height: 90.0,
                width: 100.0,
                child: Image(
                  image: AssetImage('assets/images/icon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'What would you like to do today?',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeliveryScreen()));
              },
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '   Deliver any parcel or package with Gberaa',
                        style: GoogleFonts.acme(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Image(
                        height: 100,
                        alignment: Alignment.bottomRight,
                        image: AssetImage('assets/images/ill.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5.0,
                margin: EdgeInsets.all(10.0),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '   Buy your groceries',
                        style: GoogleFonts.acme(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Image(
                        height: 100,
                        alignment: Alignment.bottomRight,
                        image: AssetImage('assets/images/grocery.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5.0,
                margin: EdgeInsets.all(10.0),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '   Get your farm products',
                        style: GoogleFonts.acme(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Image(
                        height: 150,
                        alignment: Alignment.bottomRight,
                        image: AssetImage('assets/images/farm.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5.0,
                margin: EdgeInsets.all(10.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_outline_rounded),
                    Text('Account'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
