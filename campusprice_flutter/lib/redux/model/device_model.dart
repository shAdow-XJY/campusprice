
class DeviceModel{

  /// 设备ip地址
  String ip;
  /// 经度
  double longitude;
  /// 纬度
  double latitude;
  /// 时间
  DateTime dateTime;

  DeviceModel({
    required this.ip,
    required this.longitude,
    required this.latitude,
    required this.dateTime,
  });

}