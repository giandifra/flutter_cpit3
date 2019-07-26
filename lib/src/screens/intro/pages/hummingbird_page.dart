import 'package:flutter/material.dart';

class HummingbirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/logo_hummingbird.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "- Implementazione di Flutter renderizzata "
              "tramite le tecnologie standard del web: HTML, CSS, JavaScript\n"
              "- Compila il codice Dart in un applicativo che può essere incorporato "
              "in un browser o rilasciato in un server web",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
