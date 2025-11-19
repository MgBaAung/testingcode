//ignore: unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testingapp/base_architecture/app_setting/utils/key_utils.dart';

class PrefUtils {
  SharedPreferences? _sharedPreferences;

  PrefUtils() {
    init();
  }

  Future<void> init() async {
    log("init preUtils");
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return kPrimary;
    }
  }

  Future<void> setInt(String key, int value) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.setInt(key, value);
  }

  Future<int> getInt(String key) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getInt(key)!;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setData(String key, String value) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.setString(key, value);
  }

  Future<String> getData(String key) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getString(key)!;
    } catch (e) {
      return '';
    }
  }

  Future<void> setBool(String key, bool value) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getBool(key) ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<void> removeData(String key) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove(key);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveMapToSharedPreferences(Map<String, dynamic> myMap) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String jsonString = jsonEncode(myMap);

    await prefs.setString('myMapKey', jsonString);
  }

  Future<Map<String, dynamic>?> getMapFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonString = prefs.getString('myMapKey');
    if (jsonString != null) {
      Map<String, dynamic> myMap = jsonDecode(jsonString);
      return myMap;
    }
    return null;
  }

  Future<void> clearMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('myMapKey');
  }

  Future<void> saveMapData({
    required Map<dynamic, dynamic> myMap,
    required String key,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String jsonString = jsonEncode(myMap);
    await prefs.setString(key, jsonString);
  }

  Future<Map<dynamic, dynamic>> getMapData({required String key}) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String jsonString = prefs.getString(key) ?? "";
      Map<dynamic, dynamic> myMap = jsonDecode(jsonString);
      return myMap;
    } catch (e) {
      return {};
    }
  }

  Future<void> saveMap({
    required Map<String, dynamic> myMap,
    required String key,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String jsonString = jsonEncode(myMap);
    await prefs.setString(key, jsonString);
  }

  Future<Map<String, dynamic>> getMap({required String key}) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String jsonString = prefs.getString(key) ?? "";
      Map<String, dynamic> myMap = jsonDecode(jsonString);
      return myMap;
    } catch (e) {
      return {};
    }
  }
}
