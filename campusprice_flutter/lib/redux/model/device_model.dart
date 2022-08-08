
class DeviceModel{

  /// 设备ip地址
  String ip;
  /// 国家
  String country;
  /// 省份
  String province;
  /// 城市
  String city;

  DeviceModel({
    required this.ip,
    required this.country,
    required this.province,
    required this.city,
  });

  String getAddress(){
    return '$country-$province-$city';
  }
}