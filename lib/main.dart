import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vr_zoo/pages/admin_home_page.dart';
import 'package:vr_zoo/pages/admin_login.dart';
import 'package:vr_zoo/pages/homepage.dart';
import 'package:vr_zoo/pages/itemDetailsPage.dart';
import 'package:vr_zoo/pages/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoo Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lexend',
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.error != null){
            return Text(snapshot.error.toString());
          }
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.data == null) {
              return LoginPage();
            } else {
              return HomePage();
            }
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/itemDetails': (context) => ItemDetailsPage(),
      },
    );
  }
}


