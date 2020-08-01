import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafzly/custom_widgets/job_card.dart';
import 'package:nafzly/models/job_model.dart';
import 'package:nafzly/pages/job_review_page.dart';
import 'package:provider/provider.dart';

class JobsPage extends StatefulWidget {
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<FirebaseUser>(context);

    return Container(
      padding: EdgeInsets.all(10),
      child: StreamBuilder(
        stream: Firestore.instance.collection("Jobs").snapshots(),
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
              if (!snapshot.hasData) return Container();
              var data = snapshot.data.documents[index].data;

              Job job = Job.fromJson(data);

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JobReviewPage(job: job),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: jobCard(job, loggedUser.uid),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
