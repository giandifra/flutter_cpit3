import 'package:flutter/material.dart';

import '../../../utils.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Chi sono?',
              style: pageTitle,
            ),
          ),
          Spacer(),
          CircleAvatar(
              radius: 50.0,
              backgroundImage:
                  Image.asset('assets/images/profile_image.png').image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Gian Marco Di Francesco',
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo_twitter.png',
                  height: 30,
                ),
                Text('@DiFraGM'),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
