import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_area/src/pages/chat_page.dart';
import 'package:safe_area/src/pages/page_home_tabs/history_tab.dart';
import 'package:safe_area/src/pages/page_home_tabs/home_tab.dart';
import 'package:safe_area/src/pages/page_home_tabs/more_tan.dart';
import 'package:safe_area/src/pages/page_home_tabs/oferts_tab.dart';

import 'package:safe_area/src/widgets/boton_menu.dart';

import 'package:safe_area/src/widgets/my_appbar.dart';
import 'package:safe_area/src/widgets/my_page_view.dart';

import 'image_page.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  // en el caso de que usaramos pageView.builder//////
  // PageController _pageViewController;

  final _menu = [
    BotonMenuItem(
        iconPath: 'assets/icons/home-run.svg',
        label: 'Inicio',
        content: HomeTab()),
    BotonMenuItem(
        iconPath: 'assets/icons/historial.svg',
        label: 'Historial',
        content: HistoryTab()),
    BotonMenuItem(
        iconPath: 'assets/icons/ofertas.svg',
        label: 'Ofertas',
        content: OfertsTab()),
    BotonMenuItem(
        iconPath: 'assets/icons/menu.svg', label: 'Mas', content: MoreTab()),
  ];

  @override
  void initState() {
    super.initState();
    // en el caso de que usaramos pageView.builder
    // _pageViewController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  void dispose() {
    //en el caso de usar un widget pageView.builder
    // _pageViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   brightness: Brightness.dark,
      //   // con icontheme cambiamos el color de los inconos
      //   iconTheme: IconThemeData(color: Colors.blue),
      //   leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      //   actions: [
      //     IconButton(icon: Icon(Icons.send), onPressed: () {}),
      //     IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      //   ],
      // ),

      backgroundColor: Colors.white,

      ///navegacion
      bottomNavigationBar: BotonMenu(
        currentPage: _currentPage,
        onChanged: (int newCurrentPage) {
// ////////usamos de esta forma cuando tenemos un pageView.builder///////
          // _pageViewController.jumpToPage(newCurrentPage);
          setState(() {
            _currentPage = newCurrentPage;
          });
        },
        items: _menu,
      ),

      body: SafeArea(
        left: true,
        right: true,
        top: true,
        bottom: true,
        child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                //appBar
                MyAppBar(
                  leftIcon:
                      'https://image.flaticon.com/icons/svg/685/685662.svg',
                  rightIcon:
                      'https://image.flaticon.com/icons/svg/126/126501.svg',
                  onLeftClick: () {
                    Navigator.pushNamed(context, ImagePage.routName,
                        arguments:
                            ImagePageArgs(username: 'lennox', isActive: true));
                  },
                  onRightClick: () {
                    final route = MaterialPageRoute(
                        builder: (BuildContext context) => ChatPage(
                              username: 'pagina de chat',
                            ));
                    Navigator.push(context, route);
                  },
                ),
                Expanded(
                  //  ///////Con esete widget podemos cambiar las paginas haciendo scrooll a los lados////////////////////
                  // child: PageView.builder(
                  //   controller: _pageViewController,
                  //   onPageChanged: (int newPage) {
                  //     setState(() {
                  //       _currentPage = newPage;
                  //     });
                  //   },
                  //   itemBuilder: (context, index) {
                  //     return _menu[index].content;
                  //   },
                  //   itemCount: 4,
                  // ),
                  child: MyPageView(
                      currentPage: _currentPage,
                      children: _menu.map((item) => item.content).toList()),
                )
              ],
            )),
      ),
    );
  }

  Widget div() {
    return Container(
      height: 1,
      width: 100,
      margin: EdgeInsets.symmetric(vertical: 20),
      color: Colors.black38,
    );
  }

  // ignore: non_constant_identifier_names
  Widget Navegacion_boton() {
    return BottomNavigationBar(backgroundColor: Color(0xfff0f0f0), items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Inicio')),
      BottomNavigationBarItem(
          icon: Icon(Icons.history), title: Text('Historial')),
      BottomNavigationBarItem(icon: Icon(Icons.subject), title: Text('Oferas')),
      //  BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('Mas'))
    ]);
  }
}
