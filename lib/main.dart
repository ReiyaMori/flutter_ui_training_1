import 'package:flutter/material.dart';

//アニメーションのない静的UI
//参考：https://www.flutter-study.dev/create-ui/admin-mobile
//https://arrowww.space/watching-ui-modeling-etude

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'ui training 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: AdminMobilePage(),
    );
  }
}

class AdminMobilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //SideBarとBodyの分離
      body: Row(
        children: <Widget>[
          Expanded(flex:1, child: SideNavigation()),
          Expanded(flex:5 ,child: PostsIndex())
        ],
      ),
    );
  }
}

class SideNavigation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();

  }
}

class PostsIndex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: Colors.grey,);
  }
}