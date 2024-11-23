import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentid});

  Future<Map<String, dynamic>> getData(
      {required String path, required String documentid});

  Future<bool> checkIfDataExit(
      {required String path, required String documentid});
}
