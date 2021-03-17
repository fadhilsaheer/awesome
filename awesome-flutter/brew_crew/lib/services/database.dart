import 'package:brew_crew/models/brew.dart';
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

  // brew list from snapshot

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.data()['name'] ?? '',
        strength: doc.data()['strength'] ?? 0,
        sugars: doc.data()['sugars'] ?? '0',
      );
    }).toList();
  }

  // get brew stream
  Stream<List<Brew>> get brews {
    return brewCollections.snapshots().map(_brewListFromSnapshot);
  }
}
