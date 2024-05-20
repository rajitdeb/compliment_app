import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefProvider extends ChangeNotifier {
  SharedPreferences? _prefs;
  int data = 0;

  Future<void> getKey() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs != null) {
      (_prefs!.containsKey("payload"))
          ? data = _prefs!.getInt("payload")! // payload key exists
          : data = 2; // payload key doesn't exist
      notifyListeners();
    }
  }
}
