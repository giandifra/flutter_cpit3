import 'package:flutter/material.dart';

import '../../../utils.dart';

class FlutterArchitecturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Architettura in Flutter',style: pageTitle,),
          ),
          Expanded(child: Image.asset('assets/images/flutter_architecture.png')),
        ],
      ),
    );
  }
}
