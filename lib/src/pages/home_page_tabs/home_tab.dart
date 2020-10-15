import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_area/api/account_api.dart';
import 'package:shimmer/shimmer.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  AccountApi _accountApi = AccountApi();
  List<dynamic> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    _load();
    super.initState();
  }

  _load() async {
    final users = await _accountApi.getUsers(2);
    setState(() {
      _users.addAll(users);
      _isLoading = false;
    });
  }

  Widget _shimmer() {
    return Container(
      height: 120,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Shimmer(
            gradient: LinearGradient(
                begin: Alignment.center,
                colors: [Colors.grey[50], Colors.black12]),
            period: Duration(
              seconds: 2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffcccccc),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 13,
                    width: 50,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            // gradient: LinearGradient()
          );
        },
        itemCount: 7,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _isLoading
            ? _shimmer()
            : Container(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    final dynamic item = _users[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 80),
                        child: Column(children: [
                          Expanded(
                            child: ClipOval(
                              child: Image.network(
                                item["avatar"],
                              ),
                            ),
                          ),
                          Text(item["first_name"]),
                        ]),
                      ),
                    );
                  },
                  itemCount: _users.length,
                  scrollDirection: Axis.horizontal,
                ),
              )
      ],
    );
  }

// en el caso de usar pageView.builder
  // @override
  // bool get wantKeepAlive => true;
}
