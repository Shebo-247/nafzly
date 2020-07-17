import 'package:flutter/material.dart';
import 'package:nafzly/models/navigation.dart';
import 'package:nafzly/utils/constants.dart';

class BottomNavItem extends StatefulWidget {
  final Navigation navItem;
  final bool isSelected;

  BottomNavItem(this.navItem, this.isSelected);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 50,
      width: widget.isSelected ? 150 : 50,
      padding: widget.isSelected
          ? EdgeInsets.symmetric(horizontal: 20)
          : EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: widget.isSelected ? appTheme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Row(
            children: <Widget>[
              IconTheme(
                child: widget.navItem.icon,
                data: IconThemeData(size: 25),
              ),
              SizedBox(
                width: 10,
              ),
              widget.isSelected
                  ? DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 18,
                        color: appTheme.primaryColorDark,
                      ),
                      child: widget.navItem.title,
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
