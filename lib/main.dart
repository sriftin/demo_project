
import 'package:demo_project/pages/otp.dart';
import 'package:demo_project/pages/user_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/pages/loading.dart';
import 'package:demo_project/pages/home.dart';
import 'package:demo_project/pages/phone_number.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Loading(),
  ));
}

