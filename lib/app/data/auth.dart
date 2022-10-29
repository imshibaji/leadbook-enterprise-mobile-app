import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leadbook_online/app/modules/login/login_model.dart';

import '../modules/login/providers/login_provider.dart';

class Auth extends GetxService {
  late GetStorage _box;
  String authKey = 'authkey';
  late LoginProvider loginProvider = LoginProvider();

  Future<Auth> init() async {
    _box = GetStorage();
    await _box.writeIfNull('authkeybox', []);
    return this;
  }

  Future<void> authCheck(String username, String password) async {
    // localAuth(username, password);
    await networkAuth(username, password);
  }

  Future<void> networkAuth(String username, String password) async {
    await loginProvider
        .postLogin(
      Login(
        email: username,
        password: password,
      ),
    )
        .then((value) async {
      if (value != null && value.accessToken != null) {
        log(value.accessToken.toString());
        if (value.accessToken!.isNotEmpty) {
          await _box.write(authKey, value.accessToken);
        }
      }
    });
  }

  void localAuth(String username, String password) async {
    String user = dotenv.get('USERNAME');
    String pass = dotenv.get('PASSWORD');
    if (username == user && password == pass) {
      await _box.write(authKey, user);
    }
  }

  set(String value) async {
    await _box.write(authKey, value);
  }

  check() {
    return _box.hasData(authKey);
  }

  String get key => get();

  get() {
    return _box.read(authKey);
  }

  logout() {
    _box.remove(authKey);
  }
}
