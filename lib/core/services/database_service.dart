abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentid});

  Future<dynamic> getData({
    required String path,
    String? documentid,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExit(
      {required String path, required String documentid});
}
