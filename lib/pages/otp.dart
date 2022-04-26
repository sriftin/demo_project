import 'dart:ffi';

import 'package:demo_project/pages/loading.dart';
import 'package:demo_project/pages/user_screen.dart';
import 'package:demo_project/widget/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:demo_project/pages/phone_number.dart';

import 'existing_user.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone,);
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}
class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinOTPFocus = FocusNode();
  String? verificationCode;
  bool done = false;
  bool wrongCode = false;
  static const phoneNumber = MethodChannel("phone/number");


  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Colors.white,
    ),
  );

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  changeText() {
    codeSent: (String vID, int? respondToken) {
      setState(() {
        verificationCode = vID;
      });
    };
    if (wrongCode == false) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          'קוד האימות נשלח אליך',
          style: TextStyle(
              color: Colors.teal[400],
              fontSize: 20,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.right,
        ),
      );
    } else {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          'הקוד שגוי אנא נסה שנית',
          style: TextStyle(
              color: Colors.red[400],
              fontSize: 20,
              fontWeight: FontWeight.w800),
          textAlign: TextAlign.right,
        ),
      );
    }
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+972${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              done = true;
              wrongCode = false;
            }
          });
        },
        verificationFailed: (FirebaseException e) {
          print(e.message);
          wrongCode == true;
        },
        codeSent: (String vID, int? respondToken) {
          setState(() {
            verificationCode = vID;
          });
        },
        codeAutoRetrievalTimeout: (String vID) {
          setState(() {
            verificationCode = vID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  void verDialog() async {
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Icon(Icons.done, size: 60,),
          content: Text("הקוד התקבל",
            style: TextStyle(color: Colors.blueAccent, fontSize: 24,),
            textAlign: TextAlign.center,
          ),
        ),
    );
    passNumber();
  }

  @override
  Widget build(BuildContext context) {
    var last4 = widget.phone.substring(widget.phone.length - 4);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[400],
      appBar: TopBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
            child: Center(
              child: Container(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    ' שלחנו SMS עם קוד חד-פעמי לטלפון הנייד שלך המסתיים בספרות ${last4}',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 110),
              child: changeText()
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, right: 40, left: 40),
            child: PinPut(
              fieldsCount: 6,
              textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.black),
              eachFieldWidth: 45,
              eachFieldHeight: 45,
              focusNode: _pinOTPFocus,
              controller: _pinOTPCodeController,
              submittedFieldDecoration: pinOTPCodeDecoration,
              selectedFieldDecoration: pinOTPCodeDecoration,
              followingFieldDecoration: pinOTPCodeDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                      verificationId: verificationCode!, smsCode: pin))
                      .then((value) {
                    if (value.user != null) {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => CodeSuc()));
                      done = true;
                      wrongCode = false;
                      setState(() {
                        changeText();
                      });
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  wrongCode = true;
                  setState(() {
                    changeText();
                  });
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(60, 8, 60, 0),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (done == true) {
                  verDialog();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserScreen()));
                }
                else {

                }
              },
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
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                wrongCode = false;
                changeText();
              });
            },
            child: Text(
              'שלחו לי קוד חדש',
              style: TextStyle(
                color: Colors.teal[400],
                fontSize: 24,
                letterSpacing: 1,
                fontWeight: FontWeight.w200,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future <void> passNumber() async {
    var sendMap = <String, dynamic>{
      "phoneNumber": widget.phone.toString()
    };
    String? value;

    try {
      value = await phoneNumber.invokeMethod("passNumber", sendMap);
    } catch (e) {
      print(e);
    }
    print(value);
    if (value == "0") {
      await Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => UserScreen(phone: widget.phone,)));
      });
    } else {
      await Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ExistingUser()));
      });
    }
  }
}
