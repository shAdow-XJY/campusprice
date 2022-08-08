
import 'package:redux/redux.dart';

import '../model/device_model.dart';

class SetDeviceDataAction {

  /// 设备ip地址
  String? ip;
  /// 国家
  String? country;
  /// 省份
  String? province;
  /// 城市
  String? city;

  SetDeviceDataAction({
    this.ip,
    this.country,
    this.province,
    this.city,
  }) : super();

  /// 设置设备 Device 的 数据
  static DeviceModel setDeviceData(DeviceModel deviceModel, SetDeviceDataAction action) {
    deviceModel.ip = action.ip!;
    deviceModel.country = action.country!;
    deviceModel.province = action.province!;
    deviceModel.city = action.city!;
    return deviceModel;
  }


}


/*
 * 绑定Action与动作
 */
final DeviceReducer = combineReducers<DeviceModel>([
  TypedReducer<DeviceModel, SetDeviceDataAction>(SetDeviceDataAction.setDeviceData),
]);

