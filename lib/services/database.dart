import 'package:weight_tracker/imports/imports.dart';

class DatabaseServices {
  static Future<bool> addWeight({String? weight, String? time}) async {
    try {
      await Firebase.initializeApp();
      final firestoreInstance = FirebaseFirestore.instance;
      CollectionReference weightReference =
      firestoreInstance.collection('weights');
      var id = weightReference.doc().id;
      await weightReference
          .doc(id)
          .set({'id': id, 'weight': weight, 'time': time});
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Stream<QuerySnapshot> getWeightData() {
    final firestoreInstance = FirebaseFirestore.instance;
    CollectionReference weightReference =
    firestoreInstance.collection('weights');
    return weightReference.orderBy('time').snapshots();
  }

  static Future<bool> updateWeight(
      {String? id, String? weight, String? time}) async {
    try {
      await Firebase.initializeApp();
      final firestoreInstance = FirebaseFirestore.instance;
      CollectionReference weightReference =
      firestoreInstance.collection('weights');
      await weightReference
          .doc(id)
          .set({'id': id, 'weight': weight, 'time': time});
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<bool> deleteWeight({String? id}) async {
    try {
      await Firebase.initializeApp();
      final firestoreInstance = FirebaseFirestore.instance;
      CollectionReference weightReference =
      firestoreInstance.collection('weights');
      await weightReference.doc(id).delete();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}