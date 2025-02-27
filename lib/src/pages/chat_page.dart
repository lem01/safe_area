import 'package:flutter/material.dart';
import 'package:safe_area/src/widgets/my_appbar.dart';

class ChatPage extends StatefulWidget {
  final String username;

  //assert se usa para agregar balidaciones
  ChatPage({Key key, @required this.username})
      : assert(username != null),
        super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            MyAppBar(
              leftIcon: 'assets/icons/back.svg',
              rightIcon: 'assets/icons/chat.svg',
              onLeftClick: () => Navigator.pop(context),
              onRightClick: () {},
            ),
            Expanded(child: Text(widget.username))
          ],
        ),
      )),
    );
  }
}
