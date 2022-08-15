import 'package:campusprice_flutter/pages/work_page/my_page/select_school_dialog.dart';
import 'package:campusprice_flutter/pages/work_page/my_page/select_zone_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../../component/ExpandedRow.dart';
import '../../../component/InfomationListItem.dart';
import '../../../component/TransparentInkWell.dart';
import '../../../redux/action/theme_action.dart';
import '../../../redux/app_state/state.dart';

bool dayMode = true;

AppBar MyAppBar = AppBar(
  leading: StoreConnector<AppState, VoidCallback>(
    converter: (Store store) {
      /// 返回的就是下面的 VoidCallback callback
      return () => {
            dayMode = store.state.themeModel.getDayMode(),
            store.dispatch(SetThemeDataAction(
                brightness: dayMode ? Brightness.dark : Brightness.light))
          };
    },
    builder: (BuildContext context, VoidCallback callback) {
      return IconButton(
        onPressed: () {
          callback();
        },
        tooltip: 'day/night',
        icon:
            dayMode ? const Icon(Icons.sunny) : const Icon(Icons.brightness_2),
      );
    },
  ),
  actions: [
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        )
      ],
    )
  ],
);

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  String avatarName = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 1,
              child: TransparentInkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/avatar_page',
                      arguments: avatarName);
                },
                child:
                    StoreConnector<AppState, String>(converter: (Store store) {
                  /// 返回的就是下面的 String userAvatar
                  avatarName = store.state.userModel.avatar;
                  return avatarName;
                }, builder: (BuildContext context, String userAvatar) {
                  return CircleAvatar(
                    radius: 105,
                    backgroundImage: AssetImage("assets/avatars/$userAvatar"),
                  );
                }),
              )),
          Expanded(
            flex: 3,
            child: StoreConnector<AppState, Map<String, dynamic>>(
              converter: (Store store) {
                /// 返回的就是下面的 Map<String, dynamic> info
                return {
                  "school": store.state.userModel.school ?? '',
                  "zone": store.state.userModel.zone ?? '',
                  "address": store.state.deviceModel.getAddress(),
                };
              },
              builder: (BuildContext context, Map<String, dynamic> info) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ExpandedRow(
                      child: TransparentInkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const SelectSchoolDialog(title: '选择学校');
                              });
                        },
                        child: InfomationListItem(
                          title: info["school"],
                          icon: Icons.school,
                        ),
                      ),
                    ),
                    ExpandedRow(
                      child: TransparentInkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const SelectZoneDialog(title: '选择校区');
                              });
                        },
                        child: InfomationListItem(
                          title: info["zone"],
                          icon: Icons.house,
                        ),
                      ),
                    ),
                    ExpandedRow(
                      child: InfomationListItem(
                        title: info["address"],
                        icon: Icons.phone_android,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
