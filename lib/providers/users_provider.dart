import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:nafzly/models/user.dart';

class UsersProvider with ChangeNotifier {
  List<User> _allUsers = [];

  Stream<List<User>> get allUsers {
    DatabaseReference usersRef =
        FirebaseDatabase.instance.reference().child("Users");

    usersRef.once().then((snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        _allUsers.add(User.fromJson(value));
      });
    });

    //print(allUsers.length);

    return usersRef.onValue.map((event) => _allUsers);
  }

  User getUser(String currentUserID, allUsers) {
    User _user;
    for (var user in allUsers) {
      if (currentUserID == user.id) {
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
}
