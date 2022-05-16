import 'package:flutter/material.dart';

class VerImg extends StatelessWidget {
  const VerImg({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
            image: AssetImage('assets/circles_dt.png'),
            // fit: BoxFit.cover
        ),
      ),
    );
  }
}