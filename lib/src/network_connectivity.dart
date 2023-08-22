import 'package:connectivity_plus/connectivity_plus.dart';


/// Checking if the device is connected to the internet.
class NetworkConnectivity {

  static final NetworkConnectivity _singleton = NetworkConnectivity._internal();

  factory NetworkConnectivity() {
    return _singleton;
  }

  NetworkConnectivity._internal();

  /// Checking if the device is connected to the internet.
   Future<bool> get connected async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
