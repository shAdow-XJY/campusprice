import 'package:flutter/material.dart';

class ImageGridItem extends StatelessWidget {
  final String assetImageUrl;
  final Color? borderColor;

  const ImageGridItem({
    Key? key,
    required this.assetImageUrl,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: borderColor ?? Theme.of(context).primaryColor),
        image: DecorationImage(
            image: AssetImage(assetImageUrl),
            fit: BoxFit.cover
        ),
      ),
    );
  }
}