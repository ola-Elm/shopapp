import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app_flutter/component/constant.dart';
import 'package:shop_app_flutter/firebase_options.dart';
import 'package:shop_app_flutter/component/auth.dart';
import 'package:shop_app_flutter/screens/forget_pass_screen.dart';
import 'package:shop_app_flutter/screens/home_screen.dart';
import 'package:shop_app_flutter/screens/login_screen.dart';
import 'package:shop_app_flutter/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electrical Store',
      theme: ThemeData(
        textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
      ),
      // home: Auth(),
      routes: {
        '/' : (context)=> Auth(),
        'login' : (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'home' : (context)=> HomeScreen(),
        'forget' : (context)=> ForgetPasswordScreen(),
      }

    );
  }
}
