import 'package:dart_ipify/dart_ipify.dart';

class Device{

  Future<String> getIp() async {
    final ip = await Ipify.ipv64(format: Format.TEXT);
    return ip;
  }

}


/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
