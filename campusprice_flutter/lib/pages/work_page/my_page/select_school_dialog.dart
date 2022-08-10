import 'package:campusprice_flutter/component/ShowAlertDialog.dart';
import 'package:campusprice_flutter/model/response.dart';
import 'package:campusprice_flutter/redux/action/user_action.dart';
import 'package:campusprice_flutter/service/http/school_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../component/SelectPopup.dart';
import '../../../component/ShowToast.dart';
import '../../../redux/app_state/state.dart';
import '../../../utils/province_util.dart';

class SelectSchoolDialog extends StatefulWidget {

  final String title;

  const SelectSchoolDialog({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  State<SelectSchoolDialog> createState() => _SelectSchoolDialogState();
}

class _SelectSchoolDialogState extends State<SelectSchoolDialog> {

  String selectedProvince = '';
  List<String> provinces = [];

  String selectedSchool = '';
  List<String> schools = [];

  bool refreshing = false;

  Future<void> refreshSchools() async {
    setState((){
      refreshing = true;
      selectedSchool = '';
    });
    schools.clear();
    RResponse R = await SchoolService.getSchools(selectedProvince);
    if (R.code == 1){
      var temp = R.data["Schools"];
      temp.forEach((school) {
        schools.add(school["school_name"]);
      });
      setState((){
        refreshing = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    provinces = ProvinceUtil.getProvincesList();
    selectedProvince = provinces[0];
    refreshSchools();
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
              if (store.state.userModel.school != selectedSchool){
                store.dispatch(SetUserDataAction(school: selectedSchool,zone: '选择校区')),
              }
            };
          },
          builder: (BuildContext context, VoidCallback callback) {
            return TextButton(
              onPressed: () {
                if (selectedSchool.isEmpty){
                  ShowToast('学校为空');
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
            '省份',
            style: TextStyle(fontSize: 16),
          ),
          SelectPopup(
            keys: provinces,
            clickCallback: (String provinceBack) {
              if (selectedProvince != provinceBack){
                selectedProvince = provinceBack;
                refreshSchools();
              }
            },
          ),
          const SizedBox(height: 15,),
          const Text(
            '学校',
            style: TextStyle(fontSize: 16),
          ),
          SelectPopup(
            refreshing: refreshing,
            keys: schools,
            clickCallback: (String provinceBack) {
              selectedSchool = provinceBack;
            },
          ),
        ],
      ),
    );
  }
}