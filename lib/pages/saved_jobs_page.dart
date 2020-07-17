import 'package:flutter/material.dart';
import 'package:nafzly/utils/constants.dart';

class SavedJobsPage extends StatefulWidget {
  @override
  _SavedJobsPageState createState() => _SavedJobsPageState();
}

class _SavedJobsPageState extends State<SavedJobsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return jobs[index].isSaved
              ? Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Card(
                    elevation: 5,
                    color: appTheme.primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 70,
                                    width: 70,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          appTheme.primaryColorDark,
                                      radius: 50,
                                      child: Center(
                                        child: Text(
                                          users[index]
                                              .userFirstName
                                              .substring(0, 1),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${users[index].userFirstName} ${users[index].userLastName}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(users[index].userAddress),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: jobs[index].isSaved
                                    ? Icon(Icons.bookmark)
                                    : Icon(Icons.bookmark_border),
                                iconSize: 35,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            jobs[index].jobTitle,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(jobs[index].jobDescription),
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
                                    jobs[index].jobBudget,
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    jobs[index].jobExecutionTime,
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
                                    jobs[index].jobLevel,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
