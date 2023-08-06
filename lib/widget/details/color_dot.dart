import 'package:flutter/material.dart';
import 'package:shop_app_flutter/component/constant.dart';

class ColorDot extends StatelessWidget {
  ColorDot({
    this.fillColor,
    this.isSelected= false,
  });

  final Color? fillColor;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
      padding: EdgeInsets.all(3.0),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected! ? kTextLightColor: Colors.transparent,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
        ),
      ),

    );
  }
}
