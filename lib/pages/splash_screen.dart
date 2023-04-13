import 'dart:async';

import 'package:children_health/services/firebase_auth.dart';
import 'package:children_health/pages/home_screen.dart';
import 'package:children_health/pages/signup_screen.dart';
import 'package:flutter/material.dart';

import 'signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    count();



  }
  @override
  void dispose() {
    super.dispose();
  }
  void count(){
    Timer(const Duration(seconds: 3), () {
      nextscreen();
    });
  }
   nextscreen(){
    if(AuthService.isLoggedIn()){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeScreen()));

    }else{
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignUpScreen()));

    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/splash_image.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome',
                    style: TextStyle(color: Colors.cyan, fontSize: 32),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Children app',
                    style: TextStyle(color: Colors.cyan, fontSize: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
