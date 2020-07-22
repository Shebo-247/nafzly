import 'package:firebase_database/firebase_database.dart';
import 'package:nafzly/models/job_model.dart';
import 'package:nafzly/models/user.dart';

class Services {
  List<String> _jobIDS = [];

  List<String> get jobIDS => this._jobIDS;

  Stream<List<Job>> getAllJobs() {
    DatabaseReference jobsRef =
        FirebaseDatabase.instance.reference().child("Jobs");

    List<Job> _allJobs = [];

    jobsRef.once().then((snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        _allJobs.add(Job.fromJson(value));
      });
    });

    return jobsRef.onValue.map((list) => _allJobs);
  }

  Stream<List<User>> getAllUsers() {
    DatabaseReference usersRef =
        FirebaseDatabase.instance.reference().child("Users");

    List<User> allUsers = [];

    usersRef.once().then((snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        allUsers.add(User.fromJson(value));
      });
    });

    return usersRef.onValue.map((list) => allUsers);
  }

  User getUser(String userID, allUsers) {
    User _user;
    for (var user in allUsers) {
      if (userID == user.id) {
        _user = User(
          firstName: user.firstName,
          lastName: user.lastName,
          address: user.address,
          image: user.image,
        );
      } else {
        continue;
      }
    }
    return _user;
  }

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

    List<Job> userSavedJobs = [];

    savedJobsRef.child(userID).once().then((snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      if (values != null) {
        values.forEach((key, value) {
          _jobIDS.add(key);
          userSavedJobs.add(getJob(key));
        });
      }
    });

    return savedJobsRef.onValue.map((list) => userSavedJobs);
  }
}
