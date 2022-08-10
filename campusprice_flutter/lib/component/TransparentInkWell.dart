import 'package:flutter/material.dart';

class TransparentInkWell extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  const TransparentInkWell({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        debugPrint('click TransparentInkWell');
        onTap();
      },
      child: child,
    );
  }
}
