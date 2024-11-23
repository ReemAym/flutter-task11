import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';

import '../../features/auth/data/models/user_model.dart';

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
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentid}) async {
    var data = await firestore.collection(path).doc(documentid).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExit(
      {required String path, required String documentid}) async {
    var data = await firestore.collection(path).doc(documentid).get();
    return data.exists;
  }
}
