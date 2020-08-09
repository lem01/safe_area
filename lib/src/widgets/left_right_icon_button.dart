import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeftRihtIconButton extends StatelessWidget {
  final String leftIcon, rightIcon, label;
  final VoidCallback onPressed;

  const LeftRihtIconButton(
      {Key key, this.leftIcon, this.rightIcon, this.label = '', this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        // color: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Row(
                children: [
                  if (leftIcon != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        leftIcon,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            if (rightIcon != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  rightIcon,
                  width: 30,
                  height: 25,
                ),
              )
          ],
        ),
      ),
    );
  }
}
