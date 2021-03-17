import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollections =
      FirebaseFirestore.instance.collection('brew');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollections.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // get brew stream
  Stream<QuerySnapshot> get brews {
    return brewCollections.snapshots();
  }
}
