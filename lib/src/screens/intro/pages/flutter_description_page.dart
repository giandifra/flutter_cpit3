import 'package:flutter/material.dart';

import '../../../utils.dart';

class FlutterDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    final desc = TextStyle(
      fontSize: 18,
    );
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Caratteristiche principali',
                style: pageTitle,
              ),
            ),
//          Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'App graficamente espressive',
                style: title,
              ),
            ),
            Text(
              'Controllo completo di ogni pixel sullo schermo',
              style: desc,
            ),
            Text(
              'Set di widget per Android e iOS (Material e Cupertino)',
              style: desc,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Velocità',
                style: title,
              ),
            ),
            Text(
              'Motore grafico Skia Graphics 2D (con accelerazione hardware)',
              style: desc,
            ),
            Text(
              'Rendering 60 fps',
              style: desc,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Codice compilato (in nativo)',
                style: title,
              ),
            ),
            Text(
              'Non è interpretato, non passa attraverso una macchina virtuale',
              style: desc,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hot Reload',
                style: title,
              ),
            ),
            Text(
              'I cambiamenti del codice sono subito visibili sull’app senza bisogno di riavviarla',
              style: desc,
            ),
            Text(
              'Sviluppatori fino a 3 volte più produttivi',
              style: desc,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Open Source',
                style: title,
              ),
            ),
            Text(
              'Ci sono già molti plugin con accesso al codice nativo',
              style: desc,
            ),
//          Spacer(),
          ],
        ),
      ),
    );
  }
}
