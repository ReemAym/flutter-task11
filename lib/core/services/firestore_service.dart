import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentid}) async {
    if (documentid == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(documentid).set(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentid,
    Map<String, dynamic>? query,
  }) async {
    if (documentid != null) {
      var data = await firestore.collection(path).doc(documentid).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderField = query['orderBy'];
          var descending = query['descending'];

          data = data.orderBy(orderField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExit(
      {required String path, required String documentid}) async {
    var data = await firestore.collection(path).doc(documentid).get();
    return data.exists;
  }
}
