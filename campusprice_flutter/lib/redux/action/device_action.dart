
import 'package:redux/redux.dart';

import '../model/device_model.dart';

class SetDeviceDataAction {

  /// 设备ip地址
  String? ip;
  /// 城市
  String? address;

  SetDeviceDataAction({
    this.ip,
    this.address,
  }) : super();

  /// 设置设备 Device 的 数据
  static DeviceModel setDeviceData(DeviceModel deviceModel, SetDeviceDataAction action) {
    deviceModel.ip = action.ip!;
    deviceModel.address = action.address!;
    return deviceModel;
  }


}


/*
 * 绑定Action与动作
 */
final DeviceReducer = combineReducers<DeviceModel>([
  TypedReducer<DeviceModel, SetDeviceDataAction>(SetDeviceDataAction.setDeviceData),
]);

