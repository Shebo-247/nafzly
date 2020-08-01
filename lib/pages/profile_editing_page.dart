import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafzly/models/freelancer_model.dart';
import 'package:nafzly/utils/constants.dart';
import 'package:provider/provider.dart';

class ProfileEditingPage extends StatefulWidget {
  final loggedUserID;

  ProfileEditingPage({this.loggedUserID});

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

    getUserInfo();
  }

  bool saveChanges(String loggedUserID) {
    if (firstNameController.value.text != null ||
        lastNameController.value.text != null ||
        addressController.value.text != null ||
        jobTitleController.value.text != null ||
        bioController.value.text != null) {
      Firestore.instance
          .collection("Freelancers")
          .document(loggedUserID)
          .updateData({
        'firstName': firstNameController.value.text,
        'lastName': lastNameController.value.text,
        'address': addressController.value.text,
        'jobTitle': jobTitleController.value.text,
        'bio': bioController.value.text,
      });
      return true;
    } else {
      print('Please fill all fields');
      return false;
    }
  }

  void getUserInfo() async {
    final loggedUser = await FirebaseAuth.instance.currentUser();
    String loggedUserID = loggedUser.uid;

    Firestore.instance
        .collection("Freelancers")
        .document(loggedUserID)
        .get()
        .then((snapshot) {
      Freelancer user = Freelancer.fromJson(snapshot.data);
      firstNameController.text = user.firstName;
      lastNameController.text = user.lastName;
      addressController.text = user.address;
      jobTitleController.text = user.jobTitle;
      bioController.text = user.bio;
    });
  }

  Widget _buildTextField(controller, labelText) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: controller,
      style: TextStyle(fontSize: 20, color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Editing'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: appTheme.primaryColorDark,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildTextField(firstNameController, 'First Name'),
              SizedBox(height: 15),
              _buildTextField(lastNameController, 'Last Name'),
              SizedBox(height: 15),
              _buildTextField(addressController, 'Address'),
              SizedBox(height: 15),
              _buildTextField(jobTitleController, 'Job Title'),
              SizedBox(height: 15),
              Container(
                height: 150,
                child: TextField(
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  controller: bioController,
                  keyboardType: TextInputType.text,
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
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  saveChanges(loggedUser.uid)
                      ? print('User Data has been updated successfully !')
                      : print('Some Errors happened !');
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
