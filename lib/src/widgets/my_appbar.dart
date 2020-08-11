import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {
  final String leftIcon, rightIcon;
  final VoidCallback onLeftClick, onRightClick;

  MyAppBar(
      {Key key,
      @required this.leftIcon,
      @required this.rightIcon,
      @required this.onLeftClick,
      @required this.onRightClick})
      : super(key: key);
//'https://image.flaticon.com/icons/svg/685/685662.svg'
//'https://image.flaticon.com/icons/svg/126/126501.svg'
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xffeeeeeee),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
              padding: EdgeInsets.all(15),
              child: SvgPicture.asset(
                leftIcon,
                width: 30,
                color: Colors.black,
              ),
              onPressed: onLeftClick),
          Image.asset(
            'assets/images/logo 2.png',
            width: 250,
            height: 35,
            color: Color(0xff304ffe),
          ),
          CupertinoButton(
            onPressed: onRightClick,
            //color: Colors.blue,
            padding: EdgeInsets.all(0),
            child: Stack(children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset(
                  rightIcon,
                  width: 30,
                ),
              ),
              Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}
