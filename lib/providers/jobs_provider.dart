import 'package:flutter/foundation.dart';
import '../models/job_model.dart';
import 'package:firebase_database/firebase_database.dart';

class JobsProvider with ChangeNotifier {
  List<Job> _allJobs = [];

  Stream<List<Job>> get allJobs {
    DatabaseReference jobsRef =
        FirebaseDatabase.instance.reference().child("Jobs");

    jobsRef.once().then((snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      if (values != null) {
        values.forEach((key, value) {
          _allJobs.add(Job.fromJson(value));
        });
      }
    });

    return jobsRef.onValue.map((element) => this._allJobs);
  }

  int get jobsCount => _allJobs.length;
}
