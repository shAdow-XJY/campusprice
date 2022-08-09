import 'package:campusprice_flutter/component/ShowAlertDialog.dart';
import 'package:flutter/material.dart';

import '../../../component/select_popup.dart';
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



  @override
  void initState() {
    super.initState();
    provinces = ProvinceUtil.getProvincesList();
    selectedProvince = provinces[0];
  }

  @override
  Widget build(BuildContext context) {
    return ShowAlertDialog(
      title: widget.title,
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
              selectedProvince = provinceBack;
            },
          ),
          const SizedBox(height: 15,),
          const Text(
            '学校',
            style: TextStyle(fontSize: 16),
          ),
          SelectPopup(
            keys: provinces,
            clickCallback: (String provinceBack) {
              selectedProvince = provinceBack;
            },
          ),
        ],
      ),
    );
  }
}