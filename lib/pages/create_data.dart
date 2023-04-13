import 'package:children_health/models/place_model.dart';
import 'package:children_health/services/rtdb_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CreateData extends StatefulWidget {
  const CreateData({Key? key}) : super(key: key);

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  final str1controller=TextEditingController();
  final str2controller=TextEditingController();
  createData(){
    final String str1=str1controller.text.trim();
    final String str2=str2controller.text.trim();
    if(str1.isEmpty&& str2.isEmpty){
      return;
    }
    apiSendData(str1,str2);
  }
  apiSendData(String str1,String str2){
    var placeModel=PlaceModel(str1: str1, str2: str2);
    RTDBService.addPost(placeModel).then((value) => Navigator.of(context).pop({'data':'done'}));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:str1controller ,
              keyboardType: TextInputType.number,
              inputFormatters:<TextInputFormatter> [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly,

              ],
              decoration: InputDecoration(
                hintText: 'write longtuade',
              ),
            ),
           const SizedBox(height: 20,),
            TextField(
              controller:str2controller ,
              keyboardType: TextInputType.number,
              inputFormatters:<TextInputFormatter> [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly,

              ],
              decoration:const InputDecoration(
                hintText: 'write langtuade',
              ),
            ),
            SizedBox(height: 24,),
            MaterialButton(
                child: Text('Send data'),
                onPressed: (){
                  createData();
                }
            )
          ],
        ),
      ),
    );
  }
}
