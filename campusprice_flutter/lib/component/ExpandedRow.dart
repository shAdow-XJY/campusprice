import 'package:flutter/material.dart';

class ExpandedRow extends StatelessWidget {

  final Widget child;
  final int sizeRatio;
  final int childRatio;

  const ExpandedRow({
    Key? key,
    required this.child,
    this.sizeRatio = 1,
    this.childRatio = 2,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: sizeRatio,
          child: const SizedBox(),
        ),
        Expanded(
            flex: childRatio,
            child: child,
        ),
        Expanded(
          flex: sizeRatio,
          child: const SizedBox(),
        ),
      ],
    );
  }
}
