import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nafzly/custom_widgets/saved_job_icon.dart';
import 'package:nafzly/models/freelancer_model.dart';
import 'package:nafzly/utils/constants.dart';

Widget clientInfo(jobClientID, jobID, loggedUserID) {
  print('owner : $jobClientID');
  return StreamBuilder(
    stream: Firestore.instance
        .collection("Clients")
        .document(jobClientID)
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Container();

      // get info of jobOwner
      Freelancer user = Freelancer.fromJson(snapshot.data.data);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 70,
                width: 70,
                child: CircleAvatar(
                  backgroundColor: appTheme.primaryColorDark,
                  radius: 50,
                  child: Center(
                    child: Text(
                      user.firstName.substring(0, 1),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.address,
                  ),
                ],
              ),
            ],
          ),
          savedJobIcon(jobID, loggedUserID),
        ],
      );
    },
  );
}
