import 'package:flutter/material.dart';

bool isVisible = true;
bool buttonVisible = false;

class SubaruAd extends StatefulWidget {
  const SubaruAd({
    Key? key,
  }) : super(key: key);

  @override
  State<SubaruAd> createState() => _SubaruAdState();
}

class _SubaruAdState extends State<SubaruAd> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        buttonVisible = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Visibility(
        visible: isVisible,
        child: Container(
          child: InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/popup.png'),
              height: 500,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5.0, 35, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: buttonVisible,
                      child: FloatingActionButton.small(
                        onPressed: () => setState(() => isVisible = !isVisible),
                        child: Icon(Icons.highlight_remove),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
