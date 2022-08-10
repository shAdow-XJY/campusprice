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
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
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
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ));
  }
}