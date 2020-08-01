import 'package:cloud_firestore/cloud_firestore.dart';

class Job {
  String id, clientID, title, description, period, level, status;
  int budget;
  Timestamp postTime;
  List<dynamic> proposals;
  List<dynamic> skills;

  Job({
    this.id,
    this.clientID,
    this.title,
    this.description,
    this.budget,
    this.period,
    this.level,
    this.status,
    this.postTime,
    this.proposals,
    this.skills,
  });
  factory Job.fromJson(Map<dynamic, dynamic> json) {
    return Job(
      id: json['id'],
      clientID: json['clientId'],
      title: json['title'],
      description: json['description'],
      budget: json['budget'],
      period: json['period'],
      level: json['level'],
      status: json['status'],
      postTime: json['postTime'],
      proposals: json['proposals'],
      skills: json['skills'],
    );
  }
}
