import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_area/src/pages/login_page.dart';
import 'package:safe_area/src/widgets/avatar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreTab extends StatefulWidget {
  MoreTab({Key key}) : super(key: key);

  @override
  _MoreTabState createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeNmae, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xfff8f8f8),
              padding: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Avatar(size: 150
                      // sizebtnEdit: contraints.maxHeight * 0.1,
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Lennox Monge',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
