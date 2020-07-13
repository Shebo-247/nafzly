import 'package:flutter/material.dart';
import 'package:nafzly/pages/chat_page.dart';
import 'package:nafzly/pages/home_page.dart';
import 'package:nafzly/pages/jobs_page.dart';
import 'package:nafzly/pages/login_page.dart';
import 'package:nafzly/pages/not_exist_page.dart';
import 'package:nafzly/pages/saved_jobs_page.dart';
import 'package:nafzly/pages/signup_page.dart';
import 'package:nafzly/utils/constants.dart';

class PagesRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch(settings.name){
      case homePage:
        return MaterialPageRoute(builder: (context)=> HomePage());
        break;
      case loginPage:
        return MaterialPageRoute(builder: (context)=> LoginPage());
        break;
      case signUpPage:
        return MaterialPageRoute(builder: (context)=> SignUpPage());
        break;
      case jobsPage:
        return MaterialPageRoute(builder: (context)=> JobsPage());
        break;
      case chatPage:
        return MaterialPageRoute(builder: (context)=> ChatPage());
        break;
      case savedJobsPage:
        return MaterialPageRoute(builder: (context)=> SavedJobsPage());
        break;
    }

    return MaterialPageRoute(builder: (context)=> NotExistPage());
  }
}
