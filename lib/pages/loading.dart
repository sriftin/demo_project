


import 'package:demo_project/pages/home.dart';
import 'package:demo_project/pages/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:demo_project/widget/bg_img.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  void goHome()  {
    Future.delayed(Duration(seconds: 3), (){
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context)=>Home()));
    });
  }

  @override
  void initState() {
    super.initState();
    goHome();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BGimg(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SpinKitCircle(
              color: Colors.white,
              size: 90.0,
            ),
          ),
        ),
      ],
    );
  }
}


