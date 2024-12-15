import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_storage_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_end_point.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageRepoImp extends ImageRepo {
  final StorageService storageService;
  // SupabaseClient supabase = Supabase.instance.client;
  late String path;

  ImageRepoImp({required this.storageService});
  // @override
  // download() async {
  //   var url = await supabase.storage.from('products').download('image.jpg');
  // }

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await storageService.uploadFile(image, BackendEndPoint.imagesPath);
      return right(url);
    } catch (e) {
      return left(
        ServerFailure(
          message: e.toString(),
        ),
      );
      // TODO
    }
  }
}
