import 'package:firebase2/Fire_store.dart';
import 'package:firebase2/firebase_services.dart';
import 'package:firebase2/signup.dart';
import 'package:flutter/material.dart';
import 'custom_textfield.dart';
import 'home.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(0, 0, 60, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5N3x2KXCYSpso7-Cz2N6Ly2PPD2SCsjuLRgma6jeiurbq8OJy5mdEXttWGWB89gqYPaU&usqp=CAU'),
              radius: 70,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 200),
            child: Text(
              'LOGIN',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 180),
            child: Text(
              'please sign in to continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Custom_textfield(
            text: 'Email',
            controller: emailcontroller,
            text1: 'Enter your Email',
            icon: const Icon(Icons.email),
          ),
          const SizedBox(
            height: 20,
          ),
          Custom_textfield(
            text: 'password',
            controller: passwordcontroller,
            text1: 'Enter your password',
            icon: const Icon(Icons.password),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  onPressed: () async {
                    if (emailcontroller.text.isEmpty &&
                        passwordcontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Empty')));
                    } else {
                      await Authentification().signInwithEmailandPassword(
                          emailcontroller.text, passwordcontroller.text);

                      print(emailcontroller.text);
                      print(passwordcontroller.text);

                      UserRepository().createData1(
                          emailcontroller.text, passwordcontroller.text);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Home()));
                      print('false');
                    }
                    print(emailcontroller.text);
                    print(passwordcontroller.text);
                  },
                  child: const Text('LOGIN'))),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Forgot password?',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 140,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Row(
              children: [
                const Text(
                  'Dont have an Account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {

                      Authentification().signInwithEmailandPassword(
                          emailcontroller.text, passwordcontroller.text);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.purple),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
