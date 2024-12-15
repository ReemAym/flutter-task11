import 'dart:io';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart'
    as p; // For extracting file names and extensions
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService extends StorageService {
  // final storage = Supabase.instance.client.storage;
  String bucket = 'products';
  static late Supabase _supabase;

  static createBucket(String bucketName) async {
    var bucket = await _supabase.client.storage.createBucket(bucketName);
    var bucketList = await _supabase.client.storage.listBuckets();
    bool isBucketExits = false;

    for (var bucket in bucketList) {
      if (bucket.name == bucketName) {
        isBucketExits = true;
        break;
      }
    }

    if(!isBucketExits){
          await _supabase.client.storage.createBucket(bucketName);

    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://cdzzyrgyolgjestrkgef.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNkenp5cmd5b2xnamVzdHJrZ2VmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI5NzYxMTgsImV4cCI6MjA0ODU1MjExOH0.jS_4gLVVWRIwWwZeXxFkWMwssYBHqvgQcI2P_WuLt-4',
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    // Extract the file name and extension
    String fileName = p.basename(file.path); // Extracts the file name
    String extensionName = p.extension(file.path); // Extracts the extension

    // Define the full path for the file within the bucket
    final filePath = '$path/$fileName.$extensionName';

    // Upload the file
    var result =
        await _supabase.client.storage.from(bucket).upload(filePath, file);

    // Generate a public URL for the uploaded file
    final publicUrl = _supabase.client.storage.from(bucket).getPublicUrl(filePath);

    return publicUrl; // Return the file's public URL
  }
}
