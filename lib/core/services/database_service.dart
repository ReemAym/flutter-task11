abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      required String documentid});

  Future<Map<String, dynamic>> getData(
      {required String path, required String documentid});

  Future<bool> checkIfDataExit(
      {required String path, required String documentid});
}
