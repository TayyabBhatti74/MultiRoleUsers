import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role/admin_screen.dart';
import 'package:multi_role/signup_screen.dart';
import 'package:multi_role/student_screen.dart';
import 'package:multi_role/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isloged = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isloged) {
      if (userType == 'Student') {
        Timer(const Duration(seconds: 4), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StudentScreen()));
        });
      } else if (userType == 'Teacher') {
        Timer(const Duration(seconds: 4), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TeacherScreen()));
        });
      } else {
        Timer(const Duration(seconds: 4), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AdminScreen()));
        });
      }
    } else {
      Timer(const Duration(seconds: 4), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Image(
              image: NetworkImage(
                  'https://miro.medium.com/max/1400/1*a_8LCEgzHaWVfwmYi3kViQ.png'),
              height: 250,
              width: 250,
            ),
          ),
        ],
      ),
    );
  }
}
