import 'package:flutter/material.dart';
import 'package:nafzly/utils/constants.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {Key key, this.title, this.iconData, this.hasNavigation = true})
      : super(key: key);

  final String title;
  final IconData iconData;
  final bool hasNavigation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 50,
      height: 60,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: appTheme.primaryColorDark,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
            hasNavigation
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: Colors.white,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
