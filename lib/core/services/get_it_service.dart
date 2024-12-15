import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo_imp.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo_imp.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_service.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<StorageService>(
    SupabaseStorageService(),
  );
  getIt.registerSingleton<ImageRepo>(
    ImageRepoImp(
      storageService: getIt.get<StorageService>(),
    ),
  );

  getIt.registerSingleton<DatabaseService>(
    SupabaseService(),
  );

  getIt.registerSingleton<ProductRepo>(
    ProductRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
}
