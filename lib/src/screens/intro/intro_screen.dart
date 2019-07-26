import 'package:flutter/material.dart';
import 'package:flutter_cpit3/src/screens/intro/pages/about_page.dart';

import 'package:flutter_cpit3/src/screens/intro/pages/flutter_architecture_page.dart';
import 'package:flutter_cpit3/src/screens/intro/pages/flutter_description_page.dart';
import 'package:flutter_cpit3/src/screens/intro/pages/flutter_page.dart';
import 'package:flutter_cpit3/src/screens/intro/pages/flutter_web_architecture_page.dart';
import 'package:flutter_cpit3/src/screens/intro/pages/hummingbird_page.dart';
import 'package:flutter_cpit3/src/screens/intro/pages/qr_git_page.dart';
import 'package:flutter_cpit3/src/screens/intro/pages/qr_url_page.dart';
import 'package:flutter_cpit3/src/screens/intro/pages/thanks_page.dart';
import 'package:flutter_cpit3/src/screens/intro/pages/title_page.dart';

class _PageSelector extends StatelessWidget {
  const _PageSelector({this.length});

  final int length;

  void _handleArrowButtonPress(BuildContext context, int delta) {
    final TabController controller = DefaultTabController.of(context);
    if (!controller.indexIsChanging)
      controller.animateTo((controller.index + delta).clamp(0, length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    print(size.height);
    print(size.width);
    final TabController controller = DefaultTabController.of(context);
    final Color color = Theme.of(context).accentColor;
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        children: <Widget>[
          Expanded(
            child: TabBarView(children: [
              AboutPage(),
              TitlePage(),
              FlutterPage(),
              FlutterDescriptionPage(),
              FlutterArchitecturePage(),
              FlutterWebArchitecturePage(),
              HummingbirdPage(),
              QrUrlPage(),
              QrGitPage(),
              ThanksPage(),
            ]),
          ),
          Container(
              margin: const EdgeInsets.all(16.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    FloatingActionButton(
                        heroTag: '1',
                        child: const Icon(Icons.chevron_left),
                        onPressed: () {
                          _handleArrowButtonPress(context, -1);
                        },
                        tooltip: 'Page back'),
                    Spacer(),
                    TabPageSelector(controller: controller),
                    Spacer(),
                    FloatingActionButton(
                        heroTag: '2',
                        child: const Icon(Icons.chevron_right),
                        onPressed: () {
                          _handleArrowButtonPress(context, 1);
                        },
                        tooltip: 'Page forward')
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween)),
        ],
      ),
    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 10,
        child: _PageSelector(length: 10),
      ),
    );
  }
}
