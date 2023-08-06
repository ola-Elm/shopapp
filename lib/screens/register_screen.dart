import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_flutter/component/my_button.dart';
import 'package:shop_app_flutter/component/sequre_tile.dart';
import 'package:shop_app_flutter/component/text_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController= TextEditingController();

  final emailController= TextEditingController();

  final passwordController= TextEditingController();

  final confirmPasswordController= TextEditingController();

  void registerUser () async {
    if(confirmPassword()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.of(context).pushNamed('/');
    }else {
      print('================');
    }
  }

  bool confirmPassword(){
    if(confirmPasswordController.text.trim() == passwordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }

  @override
  void dispose(){
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50,),
                Text(
                  'Welcome! Here you can signUp   ^_^',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25,),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText:  false,
                ),
                const SizedBox(height: 10,),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText:  false,
                ),
                const SizedBox(height: 10,),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText:  true,
                ),
                const SizedBox(height: 10,),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText:  true,
                ),
                const SizedBox(height: 25,),
                MyButton(
                  title: 'Register',
                  onTap: registerUser,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

