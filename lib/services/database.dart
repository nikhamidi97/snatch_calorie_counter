import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snatch_calorie_counter/models/food.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('Users');

  Future updateUserData(
      String name, double weight, double height, String gender) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'weight': weight,
      'height': height,
      'gender': gender,
    });
  }

  // Future getUserData(uid) async {
  //   try {
  //     var userData = await userCollection.document(uid).get();
  //     return User(
  //       name: userData.data['name'] ?? '',
  //       weight: userData.data['weight'] ?? 0.0,
  //       height: userData.data['hight'] ?? 0.0,
  //       gender: userData.data['gender'] ?? '',
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  //user list from snapshot
  List<UserData> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserData(
        name: doc.data['name'] ?? '',
        weight: doc.data['weight'] ?? 0.0,
        height: doc.data['hight'] ?? 0.0,
        gender: doc.data['gender'] ?? '',
      );
    }).toList();
  }
  //get user stream

  Stream<List<UserData>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}
