import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafzly/providers/jobs_provider.dart';
import 'package:nafzly/providers/saved_jobs_provider.dart';
import 'package:nafzly/providers/users_provider.dart';
import 'package:nafzly/routers/pages_router.dart';
import 'package:nafzly/services/services.dart';
import 'package:nafzly/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>(
          create: (_) => FirebaseAuth.instance.onAuthStateChanged,
        ),
        Provider(
          create: (_) => Services(),
        ),
        ChangeNotifierProvider(
          create: (_) => SavedJobsProvider(),
        ),
      ],
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: PagesRouter.allRoutes,
        initialRoute: homePage,
      ),
    );
  }
}
