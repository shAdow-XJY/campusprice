
import 'package:redux/redux.dart';

import '../model/device_model.dart';

class SetDeviceDataAction {

  /// 设备ip地址
  String ip;
  /// 经度
  double longitude;
  /// 纬度
  double latitude;
  /// 时间
  DateTime dateTime;

  SetDeviceDataAction({
    required this.ip,
    required this.longitude,
    required this.latitude,
    required this.dateTime,
  }) : super();

  /// 设置设备 Device 的 数据
  static DeviceModel setDeviceData(DeviceModel deviceModel, SetDeviceDataAction action) {
    deviceModel.ip = action.ip;
    deviceModel.longitude = action.longitude;
    deviceModel.latitude = action.latitude;
    deviceModel.dateTime = action.dateTime;
    return deviceModel;
  }


}


/*
 * 绑定Action与动作
 */
final DeviceReducer = combineReducers<DeviceModel>([
  TypedReducer<DeviceModel, SetDeviceDataAction>(SetDeviceDataAction.setDeviceData),
]);

