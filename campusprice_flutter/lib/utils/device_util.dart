import 'package:dart_ipify/dart_ipify.dart';

class DeviceUtil{

  static Future<String> getIp() async {
    final ip = await Ipify.ipv64(format: Format.TEXT);
    return ip;
  }

}
