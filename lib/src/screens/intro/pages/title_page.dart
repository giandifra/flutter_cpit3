import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: height / 10,
            margin: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/gdg.png',
                ),
                Spacer(),
                Image.asset(
                  'assets/images/logo_digit.png',
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FlutterLogo(),
              )),
          Text(
            'Flutter: da mobile a web in 3600 sec',
            style: TextStyle(fontSize: 30.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
