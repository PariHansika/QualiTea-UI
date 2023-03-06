import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class uploadImage extends StatefulWidget {
  uploadImage() : super();

  final String title = "Upload Image";

  uploadImageDemo createState() => uploadImageDemo();
}


class uploadImageDemo extends State<uploadImage> {

  Future<File> file;
  String status = '';

  ChooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source : ImageSource.gallery);
    });
    
  }

  startUpload() {}

Widget showImage() {
  return FutureBuilder<File>(
    future: file,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
      if (snapshot.connectionState == ConnectionState.done &&
      null != snapshot.data) {
        return Flexible(
          child: Image.file(
            snapshot.data!,
            fit: BoxFit.fill,
          ),
          );
      }else if (null != snapshot.error) {
        return const Text(
          'Error Picking Image',
          textAlign: TextAlign.center,
        );
      }else {
        return const Text(
          'No Image Selected',
          textAlign: TextAlign.center,
        );
      }
    }
  );
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
      ),
      body: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  onPressed: ChooseImage,
                  child: Text('Choose Image'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                showImage(),
                SizedBox(
                  height: 20.0,
                ),
                OutlinedButton(
                  onPressed: startUpload,
                  child: Text('Upload Image'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Color.fromARGB(255, 195, 255, 160),
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                )
              ])),
    );
  }
}
  // Widget build(BuildContext context){
  //   return Scaffold(
  //     body: ListView(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 10),
  //           decoration: BoxDecoration(
  //             color: Color.fromARGB(0, 196, 15, 15),
  //             borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(20),
  //             )
  //           ),
  //         )
  //       ]
  //     ),
  //   );
  // }

