import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nafzly/models/user.dart';
import 'package:nafzly/utils/constants.dart';

class ProfileEditingPage extends StatefulWidget {
  @override
  _ProfileEditingPageState createState() => _ProfileEditingPageState();
}

class _ProfileEditingPageState extends State<ProfileEditingPage> {
  TextEditingController firstNameController,
      lastNameController,
      addressController,
      jobTitleController,
      bioController,
      hourRateController;

  String firstName, lastName, address, jobTitle, bio, hourRate;

  FirebaseAuth auth;
  DatabaseReference userRef;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    jobTitleController.dispose();
    bioController.dispose();
    hourRateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    addressController = TextEditingController();
    jobTitleController = TextEditingController();
    bioController = TextEditingController();
    hourRateController = TextEditingController();

    auth = FirebaseAuth.instance;
    userRef = FirebaseDatabase.instance.reference().child("Users");

    getUserInfo();
  }

  void saveChanges() async {
    final loggedUser = await auth.currentUser();
    String loggedUserID = loggedUser.uid;

    User user = User(
        userID: loggedUserID,
        userFirstName: firstName,
        userLastName: lastName,
        userAddress: address,
        userJobTitle: jobTitle,
        userBio: bio,
        userProfile: '',
        userHourRate: hourRate);

    if (firstName != null ||
        lastName != null ||
        address != null ||
        jobTitle != null ||
        bio != null ||
        hourRate != null) {
      userRef.child(loggedUserID).set(user.toJson()).then((_) {
        print('Changes Saved Successfully');
      }).catchError((onError) => print('ERROR : $onError'));
    } else {
      print('Please fill all fields');
    }
  }

  void getUserInfo() async {
    final loggedUser = await auth.currentUser();
    String loggedUserID = loggedUser.uid;

    userRef.child(loggedUserID).once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        setState(() {
          firstName = values['userFirstName'];
          firstNameController.text = firstName;

          lastName = values['userLastName'];
          lastNameController.text = lastName;

          address = values['userAddress'];
          addressController.text = address;

          jobTitle = values['userJobTitle'];
          jobTitleController.text = jobTitle;

          bio = values['userBio'];
          bioController.text = bio;

          hourRate = values['userHourRate'];
          hourRateController.text = hourRate;
        });
      });
    }).catchError((onError) => print(onError));

    print('FNAME $firstName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Editing'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: appTheme.primaryColorDark,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                controller: firstNameController,
                onSubmitted: (val) {
                  firstName = val;
                },
                onChanged: (value) {
                  firstName = value;
                },
                style: TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                    color: Colors.white38,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: lastNameController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  lastName = value;
                },
                style: TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(
                    color: Colors.white38,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: addressController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  address = value;
                },
                style: TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(
                    color: Colors.white38,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: jobTitleController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  jobTitle = value;
                },
                style: TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Job Title',
                  labelStyle: TextStyle(
                    color: Colors.white38,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 150,
                child: TextField(
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  controller: bioController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    bio = value;
                  },
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Bio',
                    labelStyle: TextStyle(
                      color: Colors.white38,
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: appTheme.primaryColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: appTheme.primaryColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: appTheme.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.text,
                controller: hourRateController,
                onChanged: (value) {
                  hourRate = value;
                },
                style: TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Hour Rate',
                  labelStyle: TextStyle(
                    color: Colors.white38,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  saveChanges();
                },
                child: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(color: appTheme.primaryColor),
                  child: Center(
                    child: Text(
                      'Save Changes'.toUpperCase(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
