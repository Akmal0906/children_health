import 'package:children_health/models/place_model.dart';
import 'package:children_health/pages/create_data.dart';
import 'package:children_health/services/firebase_auth.dart';
import 'package:children_health/services/rtdb_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PlaceModel> list1 = [
    PlaceModel(str1: 21212121.toString(), str2: 22221.toString())
  ];
  Future datacome()async{
    Map map=await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CreateData()));
    if(map!=null&&map.containsKey('data')){
      print(map['data']);
      getNewData();

    }
  }

  Future getNewData() async {
    var list = await RTDBService.getPosts();

    setState(() {
      list1 = list;
      print(list1);
    });
  }

  @override
  void initState() {
    super.initState();
    getNewData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home screen'),
          actions: [
            IconButton(
                onPressed: () {
                  AuthService.signOutUser(context);
                  print('Sign out worked now');
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body:itemOfPost(list1.last),
    floatingActionButton: FloatingActionButton(
    child: Text('create data'),
    onPressed: () async{
      await datacome();
    },
    )
    ,
    );
  }

  Widget itemOfPost(PlaceModel placeModel) {
    return Container(
      child: Column(
        children: [
          Text(placeModel.str1),
          Text(placeModel.str2),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }
