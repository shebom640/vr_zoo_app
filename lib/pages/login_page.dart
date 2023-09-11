import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vr_zoo/pages/about_us.dart';
import 'package:vr_zoo/pages/admin_login.dart';
import 'package:vr_zoo/pages/contact_us.dart';

import '../custom_widgets/custom_common_services.dart';
import 'faq_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    final cameraPermissionStatus = await Permission.camera.request();
    final locationPermStatus = await Permission.location.request();
    if (cameraPermissionStatus.isGranted) {
      print("Camera access granted");
    } else if (cameraPermissionStatus.isDenied) {
      print("Camera Access Denied");
      openAppSettings();
    } else if (cameraPermissionStatus.isPermanentlyDenied) {
      print("Camera Permanently Denied");
      openAppSettings();
    }
    if (locationPermStatus.isGranted) {
      print("Location access granted");
    } else if (locationPermStatus.isDenied) {
      print("Location Access Denied");
      openAppSettings();
    } else if (locationPermStatus.isPermanentlyDenied) {
      print("Location Permanently Denied");
      openAppSettings();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/logo.png', scale: 50,), // Use your image path here
                    Spacer(), // Space between emblem and Ministry info
                    Text('Ministry Of Enviroment'), // Ministry Name
                    Spacer(), // Space between Ministry info and logos
                    Image.asset('assets/images/logo.png', scale: 50,), // Use your image path here
                  ],
                ),

              Spacer(),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Virtual Zoo',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Center(
                  child: OutlinedButton(
                    onPressed: () {
                      signInWithGoogle();
                    },
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset("assets/images/google.svg.png", scale: 55),
                        SizedBox(width: 12),
                        Text('Sign in with Google', style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  ),
                ),


                // MaterialButton(onPressed: () {
                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminLoginpage()));
                // }, child: Text("Admin", style: TextStyle(color: Colors.black),),),

                Spacer(),

                Row(
                  children: [
                    Image.asset('assets/images/logo.png', scale: 50,), // Use your footer logo image path here
                    SizedBox(width: 8.0), // Space between footer logo and Ministry name
                    Text('Ministry of Environment'), // Ministry Name
                  ],
                ),
              ],
            ),
          ),
        ),
      floatingActionButton: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
              value: 1,
              child: Text(
                "FAQ'S",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              )),
          PopupMenuItem(
              value: 2,
              child: Text(
                "About Us",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              )),
          PopupMenuItem(
              value: 3,
              child: Text(
                "Contact Us",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              )),
          PopupMenuItem(
              value: 4,
              child: Text(
                "Admin?",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              )),
        ],
        icon: Icon(Icons.help_outline),
        onSelected: (value) async {
          if (value == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FaqPage()));
          } else if (value == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
          } else if (value == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
          } else if (value == 4) {
            bool confirmResponse = await confirmAlert(
                context,
                header: 'Hello',
                body: "Are you sure, you are an admin?");
            if (confirmResponse) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLoginpage()));
            }
          } else {
            return;
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}

signInWithGoogle() async {
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  print(userCredential.user?.displayName);
}
