import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nafzly/models/job_model.dart';
import 'package:nafzly/utils/constants.dart';
import 'package:provider/provider.dart';

class JobReviewPage extends StatefulWidget {
  final Job job;

  JobReviewPage({this.job});

  @override
  _JobReviewPageState createState() => _JobReviewPageState();
}

class _JobReviewPageState extends State<JobReviewPage> {
  String getPostTime(Timestamp postTime) {
    DateTime dateTime = postTime.toDate();
    return '${dateTime.day}-${dateTime.month}-${dateTime.year} at ${dateTime.hour}:${dateTime.minute}';
  }

  TextEditingController coverLetterController;
  List<dynamic> skills = [];
  List<dynamic> proposals = [];
  List<String> submittedFreelancers = [];

  @override
  void initState() {
    super.initState();
    coverLetterController = TextEditingController();
    skills = widget.job.skills;
    proposals = widget.job.proposals;

    if (proposals.length != 0) {
      for (var proposal in proposals) {
        submittedFreelancers.add(proposal['freelancerId']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<FirebaseUser>(context);
    //print(submittedFreelancers.contains(loggedUser.uid).toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.job.title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 1, color: Colors.grey),
              SizedBox(height: 20),
              Text(
                getPostTime(widget.job.postTime),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 1, color: Colors.grey),
              SizedBox(height: 20),
              Text(
                widget.job.description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 1, color: Colors.grey),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Budget',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$${widget.job.budget}',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Level',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${widget.job.level}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(height: 1, color: Colors.grey),
              SizedBox(height: 20),
              Text(
                'Skills and Expertise',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                children: skills.map((skill) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: EdgeInsets.only(right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      skill,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Divider(height: 1, color: Colors.grey),
              SizedBox(height: 20),
              TextField(
                controller: coverLetterController,
                maxLines: 8,
                decoration: InputDecoration(
                  labelText: 'Cover Letter',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColorDark,
                      width: 3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColorDark,
                      width: 3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColorDark,
                      width: 3,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomSheet: submittedFreelancers.contains(loggedUser.uid)
          ? Container(
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 5),
                ],
                color: Colors.redAccent,
              ),
              child: Center(
                child: Text(
                  'You have submitted to job',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                String coverLetter = coverLetterController.value.text;
                if (coverLetter.isNotEmpty) {
                  proposals.add({
                    'freelancerId': loggedUser.uid,
                    'coverLetter': coverLetter,
                  });
                  Firestore.instance
                      .collection("Jobs")
                      .document(widget.job.id)
                      .updateData({
                    'proposals': proposals,
                  });
                  setState(() => coverLetterController.clear());
                } else {
                  print('You must write a proposal first');
                }
              },
              child: Container(
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black, blurRadius: 5),
                  ],
                  color: appTheme.primaryColor,
                ),
                child: Center(
                  child: Text(
                    'Submit Proposal'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
