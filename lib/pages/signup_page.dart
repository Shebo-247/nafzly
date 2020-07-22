import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafzly/models/user.dart';
import 'package:nafzly/utils/constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController,
      passwordController,
      confirmPasswordController;

  FirebaseAuth auth;

  String email, password, confirmPassword;

  void initializeUserInfo(userID) {
    print(userID);
    User user = User(
      id: userID,
      firstName: "",
      lastName: "",
      address: "",
      jobTitle: "",
      bio: "",
      image: '',
    );

    Firestore.instance
        .collection("Users")
        .document(userID)
        .setData(user.toJson())
        .whenComplete(() => print('User added Successfully !'));
  }

  void signUp() {
    if (email != null || password != null || confirmPassword != null) {
      if (password == confirmPassword) {
        auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .whenComplete(() async {
          String userID;
          final user = await auth.currentUser();
          user != null ? userID = user.uid : '';

          initializeUserInfo(userID);
          Navigator.pop(context);
          Navigator.pushNamed(context, homePage);
        });
      } else {
        print('Password didn\'t match');
      }
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
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: appTheme.primaryColor,
        ),
        child: Container(
          child: SingleChildScrollView(
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
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(150))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
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
                          hintText: 'Email Address',
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
                      TextField(
                        obscureText: true,
                        controller: confirmPasswordController,
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: appTheme.primaryColor,
                          ),
                          hintText: 'Confirm Password',
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
                          signUp();
                        },
                        child: Container(
                          height: 65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: appTheme.primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up'.toUpperCase(),
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
                            'Already have an account ?',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, loginPage);
                            },
                            child: Text(
                              'Login'.toUpperCase(),
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
