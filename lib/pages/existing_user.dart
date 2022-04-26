import 'package:demo_project/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExistingUser extends StatefulWidget {
  const ExistingUser({Key? key}) : super(key: key);

  @override
  State<ExistingUser> createState() => _ExistingUserState();
}

class _ExistingUserState extends State<ExistingUser> {
  static const userData = MethodChannel("user/existing");
  String? userName;
@override
  void initState() {
    super.initState();
    existingInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: TopBar(),
      body: AlertDialog(
        title: Icon(Icons.emoji_emotions_outlined,size: 80,color: Colors.teal[400],),
        content: Text('${userName} כיף שחזרת! לבחירת '
            '\n ,תמהל ייתרת התשלום הנוח לך'
            '\n באפשרותך להיעזר בסימולטור סמלת',
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,),
        actions: [
          Center(
            child: ElevatedButton(
                onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.teal[400],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        ),
      ),
      child: Text(
        'המשך',
        style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w900),
      ),
    ),
            ),
        ],
      ),
    );
  }
  Future<void> existingInfo() async{
    String? value;
    try{
      value = await userData.invokeMethod("existing");
    } catch (e){
      print(e);
    }
    setState(() {
      userName = value;
    });
  }
}
