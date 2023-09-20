import 'package:firebase2/Fire_store.dart';
import 'package:firebase2/firebase_services.dart';
import 'package:firebase2/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'custom_textfield.dart';
import 'home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  final namecontroller = TextEditingController();

  final contactcontroller = TextEditingController();

  final mailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(0, 0, 60, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Create Account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Custom_textfield(
              text: 'Name',
              controller: namecontroller,
              text1: 'Full Name',
              icon: const Icon(Icons.contact_page_outlined)),
          const SizedBox(
            height: 20,
          ),
          Custom_textfield(
              text: 'phone',
              controller: contactcontroller,
              text1: 'phone no',
              icon: const Icon(Icons.phone_android)),
          const SizedBox(
            height: 20,
          ),
          Custom_textfield(
              text: 'Email',
              controller: mailcontroller,
              text1: 'Enter your name',
              icon: const Icon(Icons.email)),
          const SizedBox(
            height: 20,
          ),
          Custom_textfield(
              text: 'password',
              controller: passwordcontroller,
              text1: 'Enter your password',
              icon: const Icon(Icons.password_outlined)),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
            width: 200,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () async {

                  if (namecontroller.text.isEmpty &&
                      contactcontroller.text.isEmpty &&
                      mailcontroller.text.isEmpty &&
                      passwordcontroller.text.isEmpty) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Empty')));
                  } else {
                    await Authentification().signupwithUsernameandPassword(
                        mailcontroller.text, passwordcontroller.text);

                    UserRepository().createData(
                        mailcontroller.text, passwordcontroller.text,
                        namecontroller.text, contactcontroller.text);


                    UserRepository().getData();




                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  Home()));
                    print('false');

                  }

                  print(mailcontroller.text);

                  print(passwordcontroller.text);


                },
                child: const Text('Sign up')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Row(
              children: [
                const Text(
                  'Already have an Account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.purple),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
