import 'dart:convert';
import 'dart:developer';

import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends DatabaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String
        documentid, // Corresponds to document ID or unique identifier
  }) async {
    final supabase = Supabase.instance.client;

    try {
      // Convert your data to JSON string
      final jsonData = jsonEncode(data);

      // Convert JSON string to bytes
      final byteData = utf8.encode(jsonData);

      // Upload the byte data to the bucket
      final filePath = await supabase.storage.from(path).uploadBinary(
            documentid,
            byteData,
          );

      print('Data uploaded successfully! File path: $filePath');
    } catch (e) {
      print('Error uploading data: $e');
    }
  }

  // @override
  // Future<void> addData(
  //     {required String path,
  //     required Map<String, dynamic> data,
  //     String? documentid}) async {
  //   // try {
  //   if (documentid == null) {
  //     log('Path: $path');
  //     log('Data: $data');
  //   final jsonData = jsonEncode(data);
  //       final byteData = utf8.encode(jsonData);

  //     // Insert a new row without specifying an ID
  //     final response= await supabase.storage.from(path).uploadBinary(
  //     documentid!,
  //     byteData,
  //   );
  //     // final response = await supabase.from(path).insert(data);

  //     if (response.error != null) {
  //       throw Exception('Error adding data: ${response.error!.message}');
  //     }
  //   } else {
  //     // Insert or update a row with a specific ID (upsert behavior)
  //     data['id'] = documentid; // Ensure the ID is part of the data map
  //     final response = await supabase.from(path).upsert(data);

  //     if (response.error != null) {
  //       throw Exception(
  //           'Error adding/updating data: ${response.error!.message}');
  //     }
  //   }
  //   // } catch (e) {
  //   //   throw Exception('Failed to add data: $e');
  //   // }
  // }

  @override
  Future<bool> checkIfDataExit(
      {required String path, required String documentid}) {
    // TODO: implement checkIfDataExit
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentid}) {
    // TODO: implement getData
    throw UnimplementedError();
  }
}
