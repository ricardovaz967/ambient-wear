import 'package:flutter/material.dart';
import 'package:flutter_os_wear/screens/name_screen.dart';
import 'package:flutter_os_wear/utils.dart';
import 'package:flutter_os_wear/wear.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WatchShape(
        builder: (context, shape) {
          var screenSize = MediaQuery.of(context).size;
          final shape = InheritedShape.of(context).shape;
          if (shape == Shape.round) {
            // boxInsetLength requires radius, so divide by 2
            screenSize = Size(boxInsetLength(screenSize.width / 2),
                boxInsetLength(screenSize.height / 2));
          }
          var screenHeight = screenSize.height;
          var screenWidth = screenSize.width;

          return Center(
            child: Container(
              color: Colors.white,
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  FlutterLogo(size: 70),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 6.0,
                      textStyle: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return NameScreen(screenHeight, screenWidth);
                        }),
                      );
                    },
                    child: Text('Start'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
