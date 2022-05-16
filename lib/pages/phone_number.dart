import 'package:demo_project/pages/loading.dart';
import 'package:demo_project/pages/otp.dart';
import 'package:demo_project/pages/user_screen.dart';
import 'package:demo_project/widget/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNum extends StatefulWidget {
  const PhoneNum({Key key}) : super(key: key);

  @override
  State<PhoneNum> createState() => _PhoneNumState();
}

class _PhoneNumState extends State<PhoneNum> {


  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: TopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 65),
                child: Center(
                  child: Text(
                    'להמשך ומעקב אחר תהליך הרכישה אנו זקוקים למספר הטלפון שלך',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 21),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(right: 40, left: 40),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "501234567",
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
                    border: InputBorder.none,
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color :Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 0,left: 10),
                    child: Text('+972', style: TextStyle(fontSize: 18),),
                  ),
                ),
                style: TextStyle(fontSize: 18,letterSpacing: 0.8),
                keyboardType: TextInputType.number,
                controller: controller,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>OTPScreen(controller.text)));
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 45),
                  primary: Colors.teal[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                ),
                child: Text(
                  'המשך',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                  child: Image.asset('assets/circles_dt.png')
              ),
          ],
        ),
      ),
    );
  }
}
