import 'package:flutter/material.dart';

import '../../../utils.dart';

class QrGitPage extends StatelessWidget {
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
              'Applicativo Web',
              style: pageTitle,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/git_cpit3.png'),
          ),
          Text(
            'https://cpit3.digit.srl/',
            style: TextStyle(fontSize: 20),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
