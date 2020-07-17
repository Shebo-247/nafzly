import 'package:flutter/material.dart';
import 'package:nafzly/custom_widgets/profile_item.dart';
import 'package:nafzly/utils/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
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
                    child: Text(
                      'SM',
                      style: TextStyle(
                        fontSize: 50,
                        color: appTheme.primaryColorDark,
                        fontWeight: FontWeight.w500,
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
              'Shouaib Mohammed',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Android Developer',
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
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
