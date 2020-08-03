import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_area/src/widgets/circule_container.dart';

class Cronometro extends StatefulWidget {
  final double initTime, fonSize;

  const Cronometro({Key key, @required this.initTime, @required this.fonSize})
      : super(key: key);
  @override
  _CronometroPageState createState() => _CronometroPageState();
}

class _CronometroPageState extends State<Cronometro> {
  double _time;

  Timer _timer;

  @override
  void initState() {
    super.initState();
    print('init state');
    _time = widget.initTime;
  }

  @override
  void dispose() {
    // utilizamos el Dispose para liberar los recursos , por ejemplo si tenemos algun
    // evento escucha, o talves una tarea en segundo plano aqui deberiamos detenerlo.
    print('dispose');
    _stop();
    super.dispose();
  }

  void _start() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer _) {
      setState(() {
        _time++;
      });
    });
  }

  // ignore: unused_element
  void _stop() {
    //      primera manera de hacer el if distinto de null
    //if (_timer != null) _timer.cancel();
    //    esta manera es como si pusieramos  if preguntando si es distinto de null
    print('cancelado');
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            _time.toString(),
            style: TextStyle(fontSize: widget.fonSize ?? 35),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                  child:
                      CirculeContainer(child: Icon(Icons.play_arrow), size: 55),
                  onPressed: _start),
              CupertinoButton(
                  child: CirculeContainer(child: Icon(Icons.stop), size: 55),
                  onPressed: _stop)
            ],
          )
        ],
      ),
    );
  }
}
