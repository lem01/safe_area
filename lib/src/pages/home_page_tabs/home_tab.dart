import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_area/src/widgets/avatar.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final estilo = TextStyle(fontSize: 18, color: Colors.black87);
  // bool _isEnable = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: LayoutBuilder(builder: (context, contraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: contraints.maxHeight * 0.50,
                  color: Color(0xfff8f8f8),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Avatar(
                        size: contraints.maxHeight * 0.30,
                        // sizebtnEdit: contraints.maxHeight * 0.1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Bienvenido',
                        style: estilo,
                      ),
                      Text(
                        'Lennox Monge',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  // width: 100,
                  // color: Colors.blue,
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return Container(
                        width: 120,
                        height: 120,
                        color: Colors.black12,
                        margin: EdgeInsets.all(5),
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  // width: 100,
                  // color: Colors.blue,
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return Container(
                        width: 120,
                        height: 120,
                        color: Colors.black12,
                        margin: EdgeInsets.all(5),
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  // width: 100,
                  // color: Colors.blue,
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return Container(
                        width: 120,
                        height: 120,
                        color: Colors.black12,
                        margin: EdgeInsets.all(5),
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  // width: 100,
                  // color: Colors.blue,
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return Container(
                        width: 120,
                        height: 120,
                        color: Colors.black12,
                        margin: EdgeInsets.all(5),
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),

                // SizedBox(
                //   height: 10,
                // ),
                //creamos el widged cronometro y le ponemos una condicion
                // _isEnable == true
                //     ? Cronometro(
                //         initTime: 0,
                //         fonSize: 40,
                //       )
                //     : Container(),
                // SizedBox(
                //   height: 10,
                // ),
                // CupertinoButton(
                //     padding: EdgeInsets.symmetric(horizontal: 20),
                //     color: Colors.blue,
                //     child: Text('Enable: $_isEnable'),
                //     onPressed: () {
                //       setState(() {
                //         _isEnable = !_isEnable;
                //       });
                //     }),
                // SizedBox(
                //   height: 20,
                // ),
                // CupertinoButton(
                //     padding: EdgeInsets.symmetric(horizontal: 20),
                //     color: Colors.green,
                //     child: Text('Go to Chat'),
                //     onPressed: () {
                //       setState(() {
                //         // Navigator.pushNamed(context, ChatPage().toString());
                //       });
                //     })

                // MyBtn(
                //   label: 'My post',
                //   onPressed: () {
                //     Navigator.pushNamed(context, PostPage.routeName);
                //   },
                // )
              ],
            ),
          );
        }));
  }

// en el caso de usar pageView.builder
  // @override
  // bool get wantKeepAlive => true;
}
