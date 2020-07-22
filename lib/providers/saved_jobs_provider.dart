import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:nafzly/models/job_model.dart';

class SavedJobsProvider with ChangeNotifier {
  List<Job> _userSavedJobs = [];
  List<String> _jobIDS = [];

  List<String> get jobIDS => this._jobIDS;

  Job getJob(String jobID) {
    DatabaseReference jobRef =
        FirebaseDatabase.instance.reference().child("Jobs").child(jobID);

    Job job = Job();

    jobRef.once().then((snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      if (values != null) {
        job = Job.fromJson(values);
      }
    });

    return job;
  }

  Stream<List<Job>> getUserSavedJobs(String userID) {
    DatabaseReference savedJobsRef =
        FirebaseDatabase.instance.reference().child("SavedJobs");

    savedJobsRef.child(userID).once().then((snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      if (values != null) {
        values.forEach((key, value) {
          _jobIDS.add(key);
          _userSavedJobs.add(getJob(key));
        });
      }
    });

    return savedJobsRef.onValue.map((list) => _userSavedJobs);
  }

  Stream<List<String>> userSavedJobsKeys(String userID) {
    DatabaseReference savedJobsRef =
        FirebaseDatabase.instance.reference().child("SavedJobs");

    savedJobsRef.child(userID).once().then((snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      if (values != null) {
        values.forEach((key, value) {
          _jobIDS.add(key);
        });
      }
    });

    for (var id in _jobIDS) {
      print(id);
    }

    return savedJobsRef.onValue.map((list) => _jobIDS);
  }

  void addToSaved(String jobID, String jobTitle, String currentUserID) {
    DatabaseReference savedJobsRef =
        FirebaseDatabase.instance.reference().child("SavedJobs");

    savedJobsRef.child(currentUserID).child(jobID).set({jobID: jobTitle});
    _jobIDS.add(jobID);
    notifyListeners();
    print(_jobIDS.length);
  }

  void removeFromSaved(String jobID, String currentUserID) {
    DatabaseReference savedJobsRef =
        FirebaseDatabase.instance.reference().child("SavedJobs");

    savedJobsRef.child(currentUserID).child(jobID).remove();
    _jobIDS.remove(jobID);
    notifyListeners();
    print(_jobIDS.length);
  }
}
