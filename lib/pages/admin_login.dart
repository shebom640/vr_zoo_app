import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vr_zoo/pages/admin_home_page.dart';

class AdminLoginpage extends StatefulWidget {
  const AdminLoginpage({Key? key}) : super(key: key);

  @override
  State<AdminLoginpage> createState() => _AdminLoginpageState();
}

class _AdminLoginpageState extends State<AdminLoginpage> {
  bool showPassword = false;
  void showPasswordFn() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminHomePage()));
      // Handle successful email/password sign-in here
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Admin Login: Virtual Zoo"),
      // ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(20.0), child: Center(child: Text("Admin Login", style: TextStyle(color: Colors.white, fontSize: 24.0),)),),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    contentPadding:
                        EdgeInsets.only(left: 33, top: 15, bottom: 14),
                    labelStyle:
                        TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 235, 237, 239),
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 235, 237, 239),
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 235, 237, 239),
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 235, 237, 239),
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 24, right: 24, top: 25),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding: const EdgeInsets.only(
                        left: 33, top: 15, bottom: 14),
                    labelStyle: const TextStyle(
                        color: Colors.white),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: IconButton(
                          onPressed: () => showPasswordFn(),
                          color: Colors.white,
                          icon: Icon(showPassword
                              ? Icons.visibility_off
                              : Icons.visibility)),
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 235, 237, 239),
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 235, 237, 239),
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 235, 237, 239),
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 235, 237, 239),
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(42.0)),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside)),
                  ),
                  obscureText: !showPassword,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 29.0),
                  child: MaterialButton(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(35.0))),
                    onPressed: _signInWithEmailPassword,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
