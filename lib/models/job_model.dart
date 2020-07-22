import 'package:cloud_firestore/cloud_firestore.dart';

class Job {
  String id, ownerID, title, description, period, level;
  int budget;
  Timestamp postTime;

  Job({
    this.id,
    this.ownerID,
    this.title,
    this.description,
    this.budget,
    this.period,
    this.level,
    this.postTime,
  });
  factory Job.fromJson(Map<dynamic, dynamic> json) {
    return Job(
      id: json['id'],
      ownerID: json['ownerId'],
      title: json['title'],
      description: json['description'],
      budget: json['budget'],
      period: json['period'],
      level: json['level'],
      postTime: json['postTime'],
    );
  }
}
