import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String avatarUrl = '';
    if(currentUser?.photoURL != null) {
      avatarUrl = '${currentUser?.photoURL}';
      print("AvatarURL = ${avatarUrl}");
    } else if (currentUser?.photoURL == null) {
      avatarUrl = 'https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg';
    }
    // print("${currentUser}");
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 75,
              foregroundImage: NetworkImage("${avatarUrl}"),
          ),
          SizedBox(height: 10,),
          Expanded(
            flex: 0,
              child: Text(
                  "Name: ${currentUser?.displayName ?? "Undefined"}")
          ),
          SizedBox(height: 10,),
          Expanded(
            flex: 0,
              child: Text(
                  "Email: ${currentUser?.email ?? "Undefined"}")
          ),
        ],
      ),
    );
  }
}
