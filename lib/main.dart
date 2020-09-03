import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/screens/archieveScreen.dart';
import './helper/notedb.dart';
import './screens/home1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen1(),
      ),
    );
  }
}
