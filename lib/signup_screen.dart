import 'package:flutter/material.dart';
import 'package:multi_role/admin_screen.dart';
import 'package:multi_role/student_screen.dart';
import 'package:multi_role/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  String defaultValue = 'Student';
  List<String> itemList = ['Student', 'Teacher', 'Admin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(hintText: 'Age'),
            ),
            const SizedBox(
              height: 35,
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: defaultValue,
              items: itemList.map((String itemValue) {
                return DropdownMenuItem(
                  value: itemValue,
                  child: Text(itemValue),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  defaultValue = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 35,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                sp.setString('userType', defaultValue);
                sp.setBool('isLogin', true);

                if (defaultValue == 'Student') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));
                } else if (defaultValue == 'Teacher') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TeacherScreen()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminScreen()));
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.indigoAccent,
                child: const Center(child: Text('Sign Up')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
