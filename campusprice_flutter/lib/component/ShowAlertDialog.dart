import 'package:flutter/material.dart';

class ShowAlertDialog extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onTap;
  final List<Widget>? actions;

  const ShowAlertDialog({
    Key? key,
    required this.title,
    required this.child,
    this.onTap,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: child,
      actions: actions ??
          <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("取消"),
            ),
            TextButton(
              onPressed: () {
                onTap == null ? null : onTap!();
                Navigator.of(context).pop();
              },
              child: const Text("确定"),
            ),
          ],
    );
  }
}
