import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget savedJobIcon(jobID, loggedUserID) {
  return StreamBuilder(
    stream: Firestore.instance
        .collection("SavedJobs")
        .document(loggedUserID)
        .collection("UserJobs")
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Container();

      List<String> savedJobsIDS = [];

      for (DocumentSnapshot doc in snapshot.data.documents) {
        savedJobsIDS.add(doc.documentID);
      }

      return IconButton(
        onPressed: () {
          if (savedJobsIDS.contains(jobID)) {
            Firestore.instance
                .collection("SavedJobs")
                .document(loggedUserID)
                .collection("UserJobs")
                .document(jobID)
                .delete();
          } else {
            Firestore.instance
                .collection("SavedJobs")
                .document(loggedUserID)
                .collection("UserJobs")
                .document(jobID)
                .setData({'status': 'saved'});
          }
        },
        icon: savedJobsIDS.contains(jobID)
            ? Icon(Icons.bookmark)
            : Icon(Icons.bookmark_border),
        iconSize: 35,
      );
    },
  );
}
