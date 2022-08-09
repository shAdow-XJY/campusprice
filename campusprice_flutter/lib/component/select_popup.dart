import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

class SelectPopup extends StatefulWidget {

  final List<String> keys;
  final double? popupHeight;
  final Function(String) clickCallback;
  const SelectPopup({
    Key? key,
    required this.keys,
    this.popupHeight,
    required this.clickCallback,
  }) : super(key: key);

  @override
  State<SelectPopup> createState() => _SelectPopupState();
}

class _SelectPopupState extends State<SelectPopup> {
  
  String selectedKey = '';
  
  @override
  void initState() {
    super.initState();
    widget.keys.isNotEmpty ? selectedKey = widget.keys[0] : '无';
    widget.clickCallback(selectedKey);
  }
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return MenuButton<String>(
      menuButtonBackgroundColor: Theme.of(context).backgroundColor,
      itemBackgroundColor: Theme.of(context).colorScheme.background,
      scrollPhysics: const ScrollPhysics(),
      popupHeight: widget.popupHeight ?? height / 2.5,
      items: widget.keys,
      itemBuilder: (String value) => Container(
        height: 40,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
        child: Text(value),
      ),
      toggledChild: SizedBox(
        width: 360,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                  child: Text(selectedKey, overflow: TextOverflow.ellipsis)
              ),
              SizedBox(
                width: 20,
                height: 20,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    Icons.arrow_drop_up,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onItemSelected: (String value) {
        widget.clickCallback(value);
        setState((){
          selectedKey = value;
        });
      },
      onMenuButtonToggle: (bool isToggle) {
        debugPrint('select pop state:$isToggle');
      },
      child: SizedBox(
        width: 360,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                  child: Text(selectedKey, overflow: TextOverflow.ellipsis)
              ),
              const SizedBox(
                width: 20,
                height: 20,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}