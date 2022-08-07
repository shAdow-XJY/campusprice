import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
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
          store.dispatch(SetThemeDataAction(themeData: dayMode ? ThemeData.dark() : ThemeData.light()))
        };
      },
      builder: (BuildContext context, VoidCallback callback) {
        return IconButton(
          onPressed: () {
            callback();
          },
          tooltip: 'day/night',
          icon: dayMode ? const Icon(Icons.sunny) : const Icon(Icons.brightness_2),
        );
      },
  ),
  actions: [
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: (){
              
            }, 
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
    // TODO: implement initState
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
              onTap: (){
                Navigator.pushNamed(context, '/avatar_page',arguments: avatarName);
              },
              child: StoreConnector<AppState, String>(
                  converter: (Store store) {
                    /// 返回的就是下面的 String userAvatar
                    avatarName = store.state.userModel.avatar;
                    return avatarName;
                  },
                  builder: (BuildContext context, String userAvatar) {
                    return CircleAvatar(
                      radius: 105,
                      backgroundImage: AssetImage("assets/avatars/$userAvatar"),
                    );
                  }),

            )
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                InfomationListItem(title: 'school',icon: Icons.school,),
                InfomationListItem(title: 'zone',icon: Icons.house,),
                InfomationListItem(title: 'ip',icon: Icons.phone_android,),
              ],
            )
          ),
        ],
      ),
    );
  }
}
