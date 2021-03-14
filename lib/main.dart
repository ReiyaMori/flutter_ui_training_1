import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:ui_training_1/main_model.dart';

//アニメーションのない静的UI
//参考：https://www.flutter-study.dev/create-ui/admin-mobile
//https://arrowww.space/watching-ui-modeling-etude

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Ad Mob',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: AdminMobilePage(),
    );
  }
}

//メインページ
class AdminMobilePage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (_)=>MainModel(),
      child: Scaffold(
        //SideBarとBodyの分離
        body: Row(
          children: <Widget>[
            _SideNavigation(),
            Builder(
                builder: (context){
                  final List<Widget> _page = [_PostsIndex(),_People(),_MyPage(),_BookMark()];
                  final _selectedIndex = context.select((MainModel model) => model.selectedIndex);
                  return Expanded(child: _page[_selectedIndex]);
                }
            )
          ],
        ),
      ),
    );
  }
}

//サイドナビゲーション
class _SideNavigation extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    //MainModelから呼び出し
    final _selectedIndex = context.select((MainModel model) => model.selectedIndex);
    // TODO: implement build
    return NavigationRail(
      minWidth:65,
      selectedIndex:_selectedIndex,
      onDestinationSelected: (index){
        //MainModelから呼び出し
        context.read<MainModel>().selected(index);
      },
      destinations: [
        NavigationRailDestination(padding: EdgeInsets.only(top:30),icon: Icon(Icons.thumbs_up_down),label: Text('thumbs_up_down')),
        NavigationRailDestination(icon: Icon(Icons.people),label: Text('people')),
        NavigationRailDestination(icon: Icon(Icons.face), label: Text('face')),
        NavigationRailDestination(icon: Icon(Icons.bookmark),label: Text('bookmark'))
      ],
    );

  }
}

//Post一覧
class _PostsIndex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    bool _showAppbar = context.select((MainModel model) => model.showAppbar);
    context.read<MainModel>().isScroll();
    context.read<MainModel>().model_dispose();

    // TODO: implement build
    return AnimatedContainer(
      duration: Duration(milliseconds:200 ),
      padding: _showAppbar?EdgeInsets.only(top:48):EdgeInsets.only(top:0),
      child: Stack(
        children: <Widget>[
          AnimatedOpacity(
            opacity: _showAppbar?1.0:0.0,
            duration: Duration(milliseconds: 800),
            child: _PostsIndexHeader(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              AnimatedContainer(
                height: _showAppbar?65:0,
                duration: Duration(milliseconds: 200),
              ),
              Expanded(child: _Posts())
            ],
          )
        ])
    );
  }
}

//post一覧のヘッダー
class _PostsIndexHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              //リストタイルで整形
              child: ListTile(
                leading: ClipOval(
                  child: Container(
                      color: Colors.grey[300],
                      width: 48, height: 48,
                      child: Icon(Icons.storage, color: Colors.grey[800],)
                  ),
                ),
                title: Text('Posts'),
                subtitle: Text('20 Posts' ),
                onTap: (){},
              )
          ),
          Expanded(
              flex: 1,
              child: ListTile(
                leading: ClipOval(
                  child: Container(
                      color: Colors.grey[300],
                      width: 48, height: 48,
                      child: Icon(Icons.style, color: Colors.grey[800],)
                  ),
                ),
                title: Text('All types', ),
                subtitle: Text(''),
                onTap: (){},
              )
          )
        ],
      ),
    );
  }
}

class _Posts extends StatelessWidget{

  List _postsData = [
    {
      'name': 'Pean',
      'message':'Weak reason. No action required.',
      'textReason':'Report Details',
      'colorPrimary':Colors.greenAccent,
      'colorPositive':Colors.greenAccent,
      'textPositive':'Keep',
      'colorNegative': Colors.blueAccent,
      'textNegative': 'Archive',
    },
    {
      'name': 'Namaga Tema',
      'message': 'Not recomended for publication.',
      'textReason': 'Pending Reason',
      'colorPrimary': Colors.deepOrangeAccent,
      'colorPositive': Colors.blueAccent,
      'textPositive': 'Publish',
      'colorNegative': Colors.deepOrangeAccent,
      'textNegative': 'Decline',
    },
    {
      'name': 'Pean',
      'message':'Weak reason. No action required.',
      'textReason':'Report Details',
      'colorPrimary':Colors.greenAccent,
      'colorPositive':Colors.greenAccent,
      'textPositive':'Keep',
      'colorNegative': Colors.blueAccent,
      'textNegative': 'Archive',
    },
    {
      'name': 'Namaga Tema',
      'message': 'Not recomended for publication.',
      'textReason': 'Pending Reason',
      'colorPrimary': Colors.deepOrangeAccent,
      'colorPositive': Colors.blueAccent,
      'textPositive': 'Publish',
      'colorNegative': Colors.deepOrangeAccent,
      'textNegative': 'Decline',
    },
    {
      'name': 'Pean',
      'message':'Weak reason. No action required.',
      'textReason':'Report Details',
      'colorPrimary':Colors.greenAccent,
      'colorPositive':Colors.greenAccent,
      'textPositive':'Keep',
      'colorNegative': Colors.blueAccent,
      'textNegative': 'Archive',
    },
    {
      'name': 'Namaga Tema',
      'message': 'Not recomended for publication.',
      'textReason': 'Pending Reason',
      'colorPrimary': Colors.deepOrangeAccent,
      'colorPositive': Colors.blueAccent,
      'textPositive': 'Publish',
      'colorNegative': Colors.deepOrangeAccent,
      'textNegative': 'Decline',
    },
  ];

  @override
  Widget build(BuildContext context) {
    ScrollController scrollViewController = context.select((MainModel model) => model.scrollViewController);
    // TODO: implement build
    //繰り返し処理で表示
    return ListView.builder(
      controller: scrollViewController,
      itemCount: _postsData.length,
      itemBuilder: (context,index){
        return _PostCard(
            name: _postsData[index]['name'],
            message: _postsData[index]['message'],
            textReason: _postsData[index]['textReason'],
            colorPrimary: _postsData[index]['colorPrimary'],
            colorPositive: _postsData[index]['colorPositive'],
            textPositive: _postsData[index]['textPositive'],
            colorNegative: _postsData[index]['colorNegative'],
            textNegative: _postsData[index]['textNegative']
        );
      },
    );
  }
}


//格PostのUI
class _PostCard extends StatelessWidget{
  final String name;
  final String message;
  final String textReason;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;
  final Color colorNegative;
  final String textNegative;

  const _PostCard({
    required this.name,
    required this.message,
    required this.textReason,
    required this.colorPrimary,
    required this.colorPositive,
    required this.textPositive,
    required this.colorNegative,
    required this.textNegative,
  }) : super();

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: ClipOval(
                child: Container(
                  color: colorPrimary,
                  width: 48, height: 48,
                  child: Center(
                    child: Text(
                      name.substring(0,1),
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                  ),
                ),
              ),
              title: Text(name),
              subtitle: Text('2min ago'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 72),
                  Container(
                    width: 16,height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary,width: 4),
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(child: Text(message))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: colorPrimary, width: 2))
                    ),
                    child: Text(textReason, style: TextStyle(color: Colors.blueAccent),),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: colorNegative,
                      ),
                      onPressed: () {},
                      child: Text(textNegative),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: colorPositive,
                        backgroundColor: colorPositive.withOpacity(0.2),
                      ),
                      onPressed: () {},
                      child: Text(textPositive),
                    ),
                  ),
                ],
              ),
            )
        ]),
      ),
    );
  }
}

class _People extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: Text('People'),);
  }
}

class _MyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: Text('MyPage'),);
  }
}

class _BookMark extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: Text('BookMark'),);
  }
}



