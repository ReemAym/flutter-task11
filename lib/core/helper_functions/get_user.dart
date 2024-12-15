import 'dart:convert';

import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';

UserEntity getUser() {
  var jsonData = SharedPreferencesSingleton.getString(KUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonData));
  return userEntity;
}
