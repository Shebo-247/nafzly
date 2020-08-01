import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafzly/custom_widgets/profile_item.dart';
import 'package:nafzly/models/freelancer_model.dart';
import 'package:nafzly/utils/constants.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth _auth;

  @override
  void initState() {
    super.initState();

    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loggedUser = Provider.of<FirebaseUser>(context);
    print(loggedUser.uid);

    return StreamBuilder(
      stream: Firestore.instance
          .collection("Freelancers")
          .document(loggedUser.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        Freelancer currentUser = Freelancer.fromJson(snapshot.data.data);
        return Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                Container(
                  width: 140,
                  height: 140,
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: appTheme.primaryColor,
                        child: currentUser.image == ""
                            ? currentUser.firstName != ""
                                ? Text(
                                    '${currentUser.firstName.substring(0, 1)}${currentUser.lastName.substring(0, 1)}',
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: appTheme.primaryColorDark,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : Container()
                            : Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      currentUser.image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appTheme.primaryColorDark,
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '${currentUser.firstName} ${currentUser.lastName}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  currentUser.jobTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, profileEditingPage);
                  },
                  child: Container(
                    width: size.width - 140,
                    height: 60,
                    decoration: BoxDecoration(
                      color: appTheme.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                ProfileItem(
                  title: 'Privacy',
                  iconData: Icons.security,
                ),
                ProfileItem(
                  title: 'Help & Support',
                  iconData: Icons.help,
                ),
                ProfileItem(
                  title: 'Settings',
                  iconData: Icons.settings,
                ),
                ProfileItem(
                  title: 'Invite Friend',
                  iconData: Icons.person_add,
                ),
                ProfileItem(
                  title: 'Logout',
                  iconData: Icons.exit_to_app,
                  hasNavigation: false,
                  onTap: () async {
                    Navigator.pop(context);
                    await _auth.signOut();
                    Navigator.pushNamed(context, loginPage);
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
