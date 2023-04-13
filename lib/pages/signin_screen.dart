import 'package:children_health/services/firebase_auth.dart';
import 'package:children_health/pages/home_screen.dart';
import 'package:children_health/pages/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final logincontroller = TextEditingController();
  final parolcontroller = TextEditingController();
  bool loginshow = false;
  bool passwordshow = false;

  void doSignIn() {
    String email = logincontroller.text.trim();
    String password = parolcontroller.text.trim();
    if (email.isEmpty || password.isEmpty) {
      return;
    }
    AuthService.signInUser(email, password).then((value) => response(value));
  }

  void response(User? firebaseUser) {
    if (firebaseUser != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen()));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: logincontroller,
                      obscureText: loginshow,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Login',
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            loginshow ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              loginshow = !loginshow;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: parolcontroller,
                      obscureText: passwordshow,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Parol',
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            passwordshow
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              passwordshow = !passwordshow;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: size.height * 0.03),
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.055,
                      width: size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          doSignIn();
                        },
                        child: const Text('Log In'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text('Do not have account'),
                          Text('Sign up'),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text('close'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Container(
                height: 90,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurpleAccent),
                child: Row(
                  children: [
                    SizedBox(
                      height: 48,
                      width: 48,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'O shedsfdsft',
                            style: TextStyle(color: Colors.white, fontSize: 18),overflow: TextOverflow.ellipsis,maxLines: 2,textAlign: TextAlign.start,
                          ),
                          Text(
                            'close content dfgdfgdf dfg',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
              elevation: 0,
            ));
          },
        ),
      ),
    );
  }
}
