import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_flutter/screens/home_screen.dart';
import 'package:shop_app_flutter/screens/login_screen.dart';

class Auth extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot){
          if(snapshot.hasData){
            print('===================================');
            return HomeScreen();

          }else {
            return LoginScreen();
          }
        }),


      ),
    );
  }
}
