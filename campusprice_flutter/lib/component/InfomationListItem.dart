import 'package:flutter/material.dart';

class InfomationListItem extends StatelessWidget {
  const InfomationListItem({
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: width/4.5),
      child: Container(
          decoration: (
              BoxDecoration(
                  border: Border.all(width: 2, color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                      tileMode: TileMode.mirror,
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.5),
                        Theme.of(context).primaryColor,
                      ]
                  )
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Icon(icon),
                ),
                Expanded(
                  flex: 9,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}