import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'url_factory.dart';

class BaseAPI {

  static Future<http.Response> apiPost<T>({required T body,
    required String url,
    bool isHeaderIncluded = true}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final headers = <String, String>{"Content-Type": "application/json"};
    if (isHeaderIncluded) {
      headers["authToken"] = _prefs.getString(authToken) ?? "";
    }
    final res = await http.post(Uri.parse(url), body: body, headers: headers);
    return res;
  }

  static Future apiGet<T>(
      {required String url, bool isHeaderIncluded = true}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final headers = <String, String>{"Content-Type": "application/json"};
    if (isHeaderIncluded) {
      headers["Authorization"] = _prefs.getString("AuthToken") ?? "";
      headers["deviceid"] = await _getId() ?? "";
    }
    final res = await http.get(Uri.parse(url), headers: headers);
    return res;
  }

  static Future<String?> _getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id;
  }

}