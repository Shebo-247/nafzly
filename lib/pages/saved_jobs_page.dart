import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafzly/custom_widgets/job_card.dart';
import 'package:nafzly/models/job_model.dart';
import 'package:provider/provider.dart';

class SavedJobsPage extends StatefulWidget {
  @override
  _SavedJobsPageState createState() => _SavedJobsPageState();
}

class _SavedJobsPageState extends State<SavedJobsPage> {
  Job getJob(String id) {
    Job savedJob;
    Firestore.instance.collection("Jobs").document(id).snapshots();

    return savedJob;
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<FirebaseUser>(context);

    return Container(
      padding: EdgeInsets.all(10),
      child: StreamBuilder(
        stream: Firestore.instance
            .collection("SavedJobs")
            .document(loggedUser.uid)
            .collection("UserJobs")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Container(
              child: Center(
                child: Text('Loading ...'),
              ),
            );

          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot doc = snapshot.data.documents[index];
              return StreamBuilder(
                stream: Firestore.instance
                    .collection("Jobs")
                    .document(doc.documentID)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  Job savedJob = Job.fromJson(snapshot.data.data);
                  return jobCard(savedJob, loggedUser.uid);
                },
              );
            },
          );
        },
      ),
    );
  }
}
