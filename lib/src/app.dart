// import flutter helper Library
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget{
  createState(){
    return AppState();
  }

}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images=[];

  void fetchImage() async{
    counter++;
    final response = await http.get('https://picsum.photos/id/${counter.toString()}/info');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    print(json.decode(response.body));
    setState((){
      images.add(imageModel);
    });
  }

  Widget build(context){ //build method for showing things on the screen
    return MaterialApp(
    home: Scaffold(
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
         onPressed: fetchImage,
         child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title:Text('Picture Galery'),
      ),
    ),
  );
  }
}


//Must define a build method that returns
//the widget that *this* widget will show

