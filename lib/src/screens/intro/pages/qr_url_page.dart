import 'package:flutter/material.dart';

import '../../../utils.dart';

class QrUrlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Repository',
              style: pageTitle,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/url_cpit3.png'),
          ),
          Text(
            'https://github.com/giandifra/flutter_cpit3/',
            style: TextStyle(fontSize: 20),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
