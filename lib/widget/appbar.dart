import 'package:flutter/material.dart';

AppBar TopBar() {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/top_strip.png')
        ),
      ),
    ),
  );
}