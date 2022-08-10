import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../component/SelectPopup.dart';
import '../../../component/ShowAlertDialog.dart';
import '../../../component/ShowToast.dart';
import '../../../redux/action/user_action.dart';
import '../../../redux/app_state/state.dart';

class SelectZoneDialog extends StatefulWidget {

  final String title;
  const SelectZoneDialog({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  State<SelectZoneDialog> createState() => _SelectSchoolDialogState();
}

class _SelectSchoolDialogState extends State<SelectZoneDialog> {
  
  String selectedZone = '';
  List<String> zones = [];

  @override
  void initState() {
    super.initState();
    zones = ['大学城校区','五山校区','国际校区'];
  }

  @override
  Widget build(BuildContext context) {
    return ShowAlertDialog(
      title: widget.title,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("取消"),
        ),
        StoreConnector<AppState, VoidCallback>(
          converter: (Store store) {
            /// 返回的就是下面的 VoidCallback callback
            return () => {
              if (store.state.userModel.zone != selectedZone){
                store.dispatch(SetUserDataAction(zone: selectedZone)),
              }
            };
          },
          builder: (BuildContext context, VoidCallback callback) {
            return TextButton(
              onPressed: () {
                if (selectedZone.isEmpty){
                  ShowToast('校区为空');
                }else{
                  callback();
                  Navigator.of(context).pop();
                }
              },
              child: const Text("确定"),
            );
          },
        ),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '学校',
            style: TextStyle(fontSize: 16),
          ),
          SelectPopup(
            popupHeight: MediaQuery.of(context).size.height / 4.0,
            keys: zones,
            clickCallback: (String provinceBack) {
              selectedZone = provinceBack;
            },
          ),
        ],
      ),
    );
  }
  
}