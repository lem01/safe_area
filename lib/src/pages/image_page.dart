import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_area/src/widgets/my_appbar.dart';

class ImagePageArgs {
  final String username;
  final bool isActive;

  ImagePageArgs({@required this.username, @required this.isActive});
}

class ImagePage extends StatefulWidget {
  static final routName = 'image';

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    ImagePageArgs arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            MyAppBar(
              leftIcon: 'assets/icons/image.svg',
              rightIcon: 'assets/icons/chat.svg',
              onLeftClick: () => Navigator.pop(context),
              onRightClick: () {},
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (_, index) {
                  return Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    child: Text('${index + 1}'),
                  );
                },
                itemCount: 1000,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
