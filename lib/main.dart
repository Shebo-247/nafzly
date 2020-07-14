import 'package:flutter/material.dart';
import 'package:nafzly/routers/pages_router.dart';
import 'package:nafzly/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: PagesRouter.allRoutes,
      initialRoute: homePage,
    );
  }
}
