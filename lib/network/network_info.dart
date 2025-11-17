import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;

  Future<bool> get connectedToWifi;

  Future<bool> get connectedToMobileData;

  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

@lazySingleton
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this._dataConnectionChecker);

  final Connectivity _dataConnectionChecker;

  @override
  Future<bool> get isConnected async {
    var connectivityResult = await _dataConnectionChecker.checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.none) ? false : true;
  }

  @override
  Future<bool> get connectedToWifi async {
    var connectivityResult = await _dataConnectionChecker.checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.wifi) ? true : false;
  }

  @override
  Future<bool> get connectedToMobileData async {
    var connectivityResult = await _dataConnectionChecker.checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.mobile) ? true : false;
  }

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged => _dataConnectionChecker.onConnectivityChanged;
}
