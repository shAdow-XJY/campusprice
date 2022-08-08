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
    final height = MediaQuery.of(context).size.height;
    return ShowAlertDialog(
      title: widget.title,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectPopup(
            keys: provinces,
            clickCallback: (String provinceBack) {
              selectedProvince = provinceBack;
            },
          ),
          // MenuButton<String>(
          //   menuButtonBackgroundColor: Theme.of(context).backgroundColor,
          //   itemBackgroundColor: Theme.of(context).colorScheme.background,
          //   scrollPhysics: const ScrollPhysics(),
          //   popupHeight: height / 2.5,
          //   items: provinces,
          //   itemBuilder: (String value) => Container(
          //     height: 40,
          //     alignment: Alignment.centerLeft,
          //     padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
          //     child: Text(value),
          //   ),
          //   toggledChild: SizedBox(
          //     width: 93,
          //     height: 40,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 16, right: 11),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: <Widget>[
          //           Flexible(
          //               child: Text(selectedProvince, overflow: TextOverflow.ellipsis)
          //           ),
          //           SizedBox(
          //             width: 20,
          //             height: 20,
          //             child: FittedBox(
          //               fit: BoxFit.fill,
          //               child: Icon(
          //                 Icons.arrow_drop_up,
          //                 color: Theme.of(context).colorScheme.surface,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          //   onItemSelected: (String value) {
          //     setState((){
          //       selectedProvince = value;
          //     });
          //   },
          //   onMenuButtonToggle: (bool isToggle) {
          //     debugPrint(isToggle.toString());
          //   },
          //   child: SizedBox(
          //     width: 93,
          //     height: 40,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 16, right: 11),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: <Widget>[
          //           Flexible(
          //               child: Text(selectedProvince, overflow: TextOverflow.ellipsis)
          //           ),
          //           const SizedBox(
          //             width: 20,
          //             height: 20,
          //             child: FittedBox(
          //               fit: BoxFit.fill,
          //               child: Icon(
          //                 Icons.arrow_drop_down,
          //                 color: Colors.grey,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}