
import 'package:redux/redux.dart';

import '../model/user_model.dart';


class SetUserDataAction {

  String? school;
  String? zone;
  String? avatar;
  
  SetUserDataAction({
    this.school,
    this.zone,
    this.avatar
  }) : super();

  /// 设置用户User 的 数据
  static UserModel setUserData(UserModel user, SetUserDataAction action) {
    action.school == null ?  null : user.school = action.school!;
    action.zone == null ? null : user.zone = action.zone!;
    action.avatar == null ? null : user.avatar = action.avatar!;

    return user;
  }

}


/*
 * 绑定Action与动作
 */
final UserReducer = combineReducers<UserModel>([
  TypedReducer<UserModel, SetUserDataAction>(SetUserDataAction.setUserData),
]);

