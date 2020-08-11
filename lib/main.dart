import 'package:flutter/material.dart';
import 'package:safe_area/src/pages/home_page.dart';
import 'package:flutter/services.dart';
import 'package:safe_area/src/pages/image_page.dart';
import 'package:safe_area/src/pages/login_page.dart';
import 'package:safe_area/src/pages/post_page.dart';
import 'package:safe_area/src/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GestureDetector(
      onTap: () {
        /////////////////////////Creo una variable foco///////////////////////
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: SplashPage(),
        routes: {
          ImagePage.routName: (context) => ImagePage(),
          'home': (_) => HomePage(),
          PostPage.routeName: (_) => PostPage(),
          LoginPage.routeNmae: (context) => LoginPage()
        },
        theme: ThemeData(fontFamily: 'Roboto'),
      ),
    );
  }
}
