import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  //final formKey= GlobalKey<FromState>();
  final emailController= TextEditingController();

  @override
  void dispose (){
    super.dispose();
    emailController.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Reset Password',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          //key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    'Receive an email to \n reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (email)=>
                  //  email!= null && !EmailValidator.validate(email)
                  //      ? 'Enter a valid email'
                  //      : null,
                ),
                const SizedBox(height: 20,),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: resetPassword,
                  icon: Icon(
                      Icons.email_outlined,
                  ),
                  label: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),),
              ],
            ),
        ),
      ),
    );
  }
  Future resetPassword () async{
    await FirebaseAuth
        .instance
        .sendPasswordResetEmail(
        email: emailController.text.trim(),);


  }
}


