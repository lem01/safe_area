import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeftRihtIconButton extends StatelessWidget {
  final String leftIcon, rightIcon, label;

  const LeftRihtIconButton({Key key, this.leftIcon, this.rightIcon, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if (leftIcon == null) SvgPicture.asset(leftIcon),
          Text(label)
        ],
      ),
    );
  }
}
