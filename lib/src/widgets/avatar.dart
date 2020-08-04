import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'circule_container.dart';

class Avatar extends StatefulWidget {
  final double size, sizebtnEdit;
  const Avatar({Key key, this.size = 150, this.sizebtnEdit = 60})
      : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  // primera manera de hacerlo//////////////////////////////////
  // File _file;
  // final picker = ImagePicker();

  // Future _getImage() async {
  //   //final File file = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   final file = await picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _file = File(file.path);
  //   });
  // }

  // tercera manera de hacerlo//////////////////////////////////
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // tercera manera de hacerlo(desactualizado)//////////////////////////////////
  // File _file;
  // _openGallery() async {
  //   final File file = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _file = file;
  //   });
  // }

  // _openCamera() async {
  //   final File file = await ImagePicker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _file = file;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size,
        height: widget.size,
        child: Stack(
          children: [
            _image == null
                ? SvgPicture.asset('assets/icons/login.svg')
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.file(
                      _image,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
            Positioned(
                top: 10,
                right: 10,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 30,
                  child: CirculeContainer(
                    child: Icon(Icons.edit),
                    size: widget.sizebtnEdit,
                  ),
                  onPressed: () => getImage(),
                ))
          ],
        ));
  }
}
