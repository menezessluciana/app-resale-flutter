import 'package:app_resale/app/routers/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
       builder: ExtendedNavigator<Router>(
        key: Get.key,
        router: Router(),
      ),
    );
  }
}