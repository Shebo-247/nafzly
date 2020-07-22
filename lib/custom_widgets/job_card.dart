import 'package:flutter/material.dart';
import 'package:nafzly/custom_widgets/user_info.dart';
import 'package:nafzly/utils/constants.dart';

Widget jobCard(job, loggedUserID) {
  return Card(
    elevation: 5,
    color: appTheme.primaryColor,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          userInfo(job.ownerID, job.id, loggedUserID),
          SizedBox(height: 10),
          Text(
            job.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(job.description),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Budget',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\$${job.budget}',
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Period',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    job.period,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Level',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    job.level,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
