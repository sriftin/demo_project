import 'package:demo_project/pages/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/widget/bg_img.dart';
import 'package:demo_project/widget/subaru_ad.dart';
import 'package:demo_project/widget/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

bool _visible = true;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BGimg(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: TopBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SubaruAd(),
              SizedBox(height: 20),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context)=>PhoneNum()));
                  },
                  child: Text('להתחברות',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



