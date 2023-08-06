import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_flutter/component/my_button.dart';
import 'package:shop_app_flutter/component/sequre_tile.dart';
import 'package:shop_app_flutter/component/text_field.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController= TextEditingController();

  final passwordController= TextEditingController();

 Future signIn () async {
await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
);
 }

 @override
 void dispose(){
   super.dispose();
   emailController.dispose();
   passwordController.dispose();
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
                const SizedBox(height: 30,),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50,),
                Text(
                  'Welcome back you\'ve been missed! ',
                  style: TextStyle(
                     color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25,),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, 'forget');
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                MyButton(
                  title: 'Sign In',
                  onTap: signIn,
                ),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'images/googlef.png',
                    ),
                    const SizedBox(width: 25,),
                    SquareTile(
                      imagePath: 'images/apple.png',
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                     TextButton(
                       onPressed: (){
                         Navigator.pushReplacementNamed(context, 'register');
                       },
                       child: Text(
                         'Register Now',
                         style: TextStyle(
                           color: Colors.blue,
                           fontWeight: FontWeight.bold,
                         ),
                        ),

                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
