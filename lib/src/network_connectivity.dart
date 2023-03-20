import 'package:connectivity_plus/connectivity_plus.dart';


/// Checking if the device is connected to the internet.
class NetworkConnectivity {

  /// Checking if the device is connected to the internet.
  static Future<bool> get connected async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
