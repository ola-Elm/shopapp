import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app_flutter/component/constant.dart';
import 'package:shop_app_flutter/widget/home/home_body.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('مرحبا بكم بمتجر الالكترونيات',
          style: GoogleFonts.getFont('Almarai'),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.logout_outlined,
            ),
          ),
        ],
      ),
      body: HomeBody(),
    );
  }
}
