import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safe_area/src/pages/login_page.dart';
import 'package:safe_area/src/utils/dialogs.dart';
import 'package:safe_area/src/widgets/avatar.dart';
import 'package:safe_area/src/widgets/left_right_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreTab extends StatefulWidget {
  MoreTab({Key key}) : super(key: key);

  @override
  _MoreTabState createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  String _emailText;

  _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeNmae, (route) => false);
  }

  _confirm() async {
    final isOk = await Dialogs.confirm(context,
        title: "ACCIÓN REQUERIDA",
        body: "Esta seguro de que desea cerrar sesion?");
    if (isOk) {
      _logOut();
    }
  }

  _setEmail() {
    Dialogs.inputEmail(context, onOk: (String text) {
      print('input Dialog $text');
      _emailText = text;
      setState(() {});
    }, placeholder: "example@domain.com", label: "Ingrese un email");
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
            LeftRihtIconButton(
              leftIcon: 'assets/icons/mail.svg',
              rightContent: Text(
                _emailText != null ? _emailText : 'lemci@example.com',
                style: TextStyle(color: Color(0xffaaaaaa)),
              ),
              label: 'E-mail',
              onPressed: () {
                _setEmail();
              },
            ),
            LeftRihtIconButton(
              leftIcon: 'assets/icons/security.svg',
              rightContent: SvgPicture.asset(
                'assets/icons/arrow-rigth.svg',
                width: 20,
              ),
              label: 'Configuraciones de privacidad',
              onPressed: () {},
            ),
            LeftRihtIconButton(
              leftIcon: 'assets/icons/notification.svg',
              rightContent: Text(
                'ACTIVADO',
                style: TextStyle(color: Color(0xffaaaaaa), letterSpacing: 0.5),
              ),
              label: 'Notificaicones Push',
              onPressed: () {},
            ),
            LeftRihtIconButton(
              leftIcon: 'assets/icons/logout.svg',
              label: 'Cerrar Sesion',
              onPressed: _confirm,
            )
          ],
        ),
      ),
    );
  }
}
