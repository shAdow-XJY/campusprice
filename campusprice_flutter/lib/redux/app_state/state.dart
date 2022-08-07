import 'package:flutter/material.dart';

import '../action/device_action.dart';
import '../action/theme_action.dart';
import '../action/user_action.dart';

import '../model/device_model.dart';
import '../model/theme_model.dart';
import '../model/user_model.dart';



class AppState {
  /// 用户信息
  late UserModel userModel;
  /// 保存我们的主题状态
  late ThemeModel themeModel;
  /// 设备信息
  late DeviceModel deviceModel;

  AppState({
    required this.themeModel,
    required this.userModel,
    required this.deviceModel,
  });

  /*
   * 命名的构造方法
   * 这里用来初始化
   */
  AppState.initialState() {
    userModel = UserModel(school: '',zone: '');
    themeModel = ThemeModel(themeData: ThemeData.dark());
    deviceModel = DeviceModel(ip: '0.0.0.0', longitude: 0.0, latitude: 0.0, dateTime: DateTime(2001,8,1));
  }

  AppState copyWith ({themeModel,userModel,deviceModel}){
    return AppState(
      themeModel: themeModel ?? this.themeModel,
      userModel: userModel == null
          ? this.userModel
          : UserModel(
        school:  userModel.school ?? this.userModel.school,
        zone: userModel.zone ?? this.userModel.zone,
        avatar: userModel.avatar ?? this.userModel.avatar,
      ),
      deviceModel: deviceModel ?? this.deviceModel,
    );
  }

}

/**
 * 定义Reducer
 */
AppState appReducer(AppState state, action) {
  debugPrint(action.runtimeType.toString());
  switch(action.runtimeType){
    case SetThemeDataAction:
    {
      return state.copyWith(themeModel: ThemeReducer(state.themeModel, action));
    }
    case SetUserDataAction:
    {
      return state.copyWith(userModel: UserReducer(state.userModel, action));
    }
    case SetDeviceDataAction:
    {
      return state.copyWith(deviceModel: DeviceReducer(state.deviceModel, action));
    }
    default:
    {
      return state;
    }
  }

}