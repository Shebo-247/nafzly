import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nafzly/utils/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController, passwordController;

  FirebaseAuth auth;

  String email, password;

  void login() {
    if (email != null || password != null) {
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        Navigator.pop(context);
        Navigator.pushNamed(context, homePage);
      });
    } else {
      print('Please fill all fields');
    }
  }

  @override
  void initState() {
    super.initState();

    auth = FirebaseAuth.instance;

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: appTheme.primaryColor,
          ),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 130,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 130,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: appTheme.primaryColorDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 110,
                        width: 110,
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Wazafny-Logo-white.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        onChanged: (value) {
                          email = value;
                        },
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: appTheme.primaryColor,
                          ),
                          hintText: 'Email or Username',
                          hintStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: appTheme.primaryColor,
                              width: 3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: appTheme.primaryColor,
                              width: 3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: appTheme.primaryColor,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        onChanged: (value) {
                          password = value;
                        },
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: appTheme.primaryColor,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: appTheme.primaryColor,
                              width: 3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: appTheme.primaryColor,
                              width: 3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: appTheme.primaryColor,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          login();
                        },
                        child: Container(
                          height: 65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: appTheme.primaryColor),
                          child: Center(
                            child: Text(
                              'Login'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don\'t have an account ?',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, signUpPage);
                            },
                            child: Text(
                              'Sign Up'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18, color: appTheme.primaryColor),
                            ),
                          )
                        ],
                      )
                    ],
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
