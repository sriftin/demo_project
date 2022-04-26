import 'package:flutter/material.dart';

class BGimg extends StatelessWidget {
  const BGimg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/main.png'),
            fit: BoxFit.cover
        ),
      ),

    );
  }
}