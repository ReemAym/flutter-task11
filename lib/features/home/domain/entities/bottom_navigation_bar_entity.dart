import 'package:e_commerce_app/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String name, activeImage, inActiveImage;

  BottomNavigationBarEntity(
      {required this.name,
      required this.activeImage,
      required this.inActiveImage});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
        name: 'الرئيسية',
        activeImage: Assets.active_home_icon,
        inActiveImage: Assets.inactive_home_icon,
      ),
      BottomNavigationBarEntity(
        name: 'المنتجات',
        activeImage: Assets.active_products_icon,
        inActiveImage: Assets.inactive_products_icon,
      ),
      BottomNavigationBarEntity(
        name: 'سلة التسوق',
        activeImage: Assets.active_shopping_cart_icon,
        inActiveImage: Assets.inactive_shopping_cart_icon,
      ),
      BottomNavigationBarEntity(
        name: 'حسابي',
        activeImage: Assets.active_user_icon,
        inActiveImage: Assets.inactive_user_icon,
      ),
    ];
