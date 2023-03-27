import 'package:flutter/material.dart';
import 'package:internconnect/screens/authenticate/company_login.dart';
import 'package:internconnect/screens/authenticate/student_signup.dart';
import 'package:internconnect/services/auth.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {

  final AuthService _auth = AuthService();

  String email = "";
  String password = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'LOGIN',
                  style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 150.0),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () async {

                        },
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 35),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  child: Text('Continue as Guest'),
                  onPressed: () async {
                    dynamic result = await _auth.signInAnon();
                    if (result == null) {
                      print('error signing in');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 35),
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentSignup()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign up now!',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CompanyLogin()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Are you an employer? ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Click here!',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}