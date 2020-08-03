import 'package:flutter/material.dart';

import 'package:safe_area/src/widgets/my_appbar.dart';

class PostPage extends StatefulWidget {
  static final routeName = 'post';

  PostPage({Key key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            MyAppBar(
                leftIcon: 'https://image.flaticon.com/icons/svg/860/860790.svg',
                rightIcon:
                    'https://image.flaticon.com/icons/svg/126/126501.svg',
                onLeftClick: () => Navigator.pop(context),
                onRightClick: () {
                  _data.add('item ${DateTime.now()}');

                  _data.insert(_data.length > 0 ? _data.length - 1 : 0,
                      '${DateTime.now()}');

                  setState(() {});
                }),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int position) {
                  final String item = _data[position];
                  return ListTile(
                    title: Text(item),
                    subtitle: Text('subtitulo'),
                    leading: Icon(Icons.wallpaper),
                    onTap: () {},
                    onLongPress: () {
                      setState(() {
                        _data.removeAt(position);
                      });
                    },
                  );
                },
                itemCount: _data.length,
              ),
            )
          ],
        ),
      )),
    );
  }
}
