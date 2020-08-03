import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BotonMenuItem {
  final String iconPath, label;
  final Widget content;

  BotonMenuItem(
      {@required this.iconPath, @required this.label, @required this.content});
}

class BotonMenu extends StatelessWidget {
  final List<BotonMenuItem> items;
  final int currentPage;

  //esta funcion que creamos es una funcion callback
  final void Function(int) onChanged;

  BotonMenu({@required this.items, this.currentPage, this.onChanged})
      : assert(items != null && items.length > 0),
        assert(currentPage != null && currentPage >= 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final bool isActive = index == currentPage;
            final BotonMenuItem item = items[index];
            return Expanded(
              child: Container(
                // color: Colors.blue,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => onChanged(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        item.iconPath,
                        width: 40,
                        height: 35,
                        color: isActive == true ? Colors.blue : Colors.black,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(item.label,
                          style: TextStyle(
                              fontSize: 12,
                              color: isActive == true
                                  ? Colors.black
                                  : Colors.black))
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
