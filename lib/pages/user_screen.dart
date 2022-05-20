import 'package:demo_project/widget/appbar.dart';
import 'package:demo_project/widget/bg_img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class UserScreen extends StatefulWidget {
  String phone;
  UserScreen({Key key, this.phone}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool value = false;
  bool value1 = false;
  bool value2 = false;
  bool wrongId = false;
  String userFullName;
  String dayPicker;
  static const contact = MethodChannel("user/user");
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _eMail = TextEditingController();
  TextEditingController _id = TextEditingController();
  DateTime _bd = null;
  

  void newUser() async {
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Icon(Icons.done, size: 60,),
          content: Directionality(
            textDirection: TextDirection.rtl,
            // child: Text( '${_firstName.text} ${_lastName.text} ,תודה שנרשנת לסמלת ',
            child: Text( '${userFullName} ,תודה שנרשמת לסמלת ',
              style: TextStyle(color: Colors.blueAccent, fontSize: 24,),
              textAlign: TextAlign.center,
            ),
          ),
        ),
    );
  }
  void missingDetails(){
    showDialog(context: context, builder: (context)=>
        AlertDialog(
          title: Align(
            alignment: Alignment.centerRight,
              child: Text("אחד מהנתונים חסר")),
        ));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.only(right: 30,left: 30,top: 50),
          child: Column(
            children: [
              Center(
                child: Text(
                  'רישום והשלמת פרטים',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: _firstName,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 22,right: 15),
                  hintText: "שם פרטי",
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
                ),
                style: TextStyle(fontSize: 18,letterSpacing: 0.8),
              ),
              SizedBox(height: 7,),
              TextField(
                controller: _lastName,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 22,right: 15),
                  hintText: "שם משפחה",
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
                ),
                style: TextStyle(fontSize: 18,letterSpacing: 0.8),
              ),
              SizedBox(height: 7,),
              TextField(
                controller: _eMail,
                textAlign: TextAlign.end,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 22,right: 15),
                  hintText: "אימייל",
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
                ),
                style: TextStyle(fontSize: 18,letterSpacing: 0.8),
              ),
              SizedBox(height: 7,),
              TextField(
                controller: _id,
                textAlign: TextAlign.end,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 22,right: 15),
                  hintText: "תעודת זהות",
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
                ),
                style: TextStyle(fontSize: 18,letterSpacing: 0.8),
              ),
              SizedBox(height: 7,),
                  ElevatedButton(
                      onPressed: () async{
                        await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2023)
                        ).then((date) {
                          setState(() {
                            _bd = date;
                            dayPicker = _bd.toString();
                          });
                        });
                      },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(_bd == null ? 'תאריך לידה' : dayPicker.toString().substring(0,10),
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                        ),
                  ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(400, 45),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                  ),
              SizedBox(height: 7,),
              Row(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Expanded(
                      child: Text(
                        'הריני מאשר/ת קבלת פניות שיווקיות בדוא"ל/ פקס/ מסרון/וואטסאפ מקבוצות סמל"ת ולהיכלל במאגר המידע של הקבוצה',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 13,
                        letterSpacing: -0.4,
                        color: Colors.grey[700]
                      ),
                      ),
                    ),
                  ),
                  Checkbox(value: value, onChanged: (value) {
                    setState(() {
                      this.value = value;
                    });
                  } ),
                ],
              ),
              Row(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Expanded(
                      child: Text(
                        'הריני מאשר/ת את תנאי השימוש במדיניות הפרטיות בשירות',
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 13,
                            letterSpacing: -0.4,
                            color: Colors.grey[700]
                        ),
                      ),
                    ),
                  ),
                  Checkbox(value: value1, onChanged: (value) {
                    setState(() {
                      this.value1 = value;
                    });
                  } ),
                ],
              ),
              Row(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Expanded(
                      child: Text(
                        'הריני מאשר/ת להעביר את פרטי לצורך הצעות רלוונטיות לצד שלישי',
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 13,
                            letterSpacing: -0.4,
                            color: Colors.grey[700]
                        ),
                      ),
                    ),
                  ),
                  Checkbox(value: value2, onChanged: (value) {
                    setState(() {
                      this.value2 = value;
                    });
                  } ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(value==false || value1==false || value2 == false || _id.text.isEmpty|| _eMail.text.isEmpty|| _firstName.text.isEmpty|| _lastName.text.isEmpty || _bd==null) {
                        missingDetails();
                      }else {
                        user();
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 45),
                    primary: Colors.teal[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                  child: Text(
                    'שמור',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
  Future <void> user() async {
    var sendMap = <String,dynamic> {
      "phoneNumber" : widget.phone.toString(),
      "firsName" : _firstName.text,
      "lastName" : _lastName.text,
      "eMail": _eMail.text,
      "id" : _id.text
    };
    String value;
    try{
      value = await contact.invokeMethod("contact",sendMap);
    } catch (e){
      print(e);
    }
    print(value);
    setState(() {
      userFullName = value;
      newUser();
    });
  }
}
