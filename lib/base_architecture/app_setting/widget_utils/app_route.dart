import 'package:flutter/material.dart';
import 'package:testingapp/base_architecture/presentation/pages/appointment_screen/appointment_page.dart';
import 'package:testingapp/base_architecture/presentation/pages/customer_screen/creat_customer_page.dart';
import 'package:testingapp/base_architecture/presentation/pages/customer_screen/customer_listview_page.dart';
import 'package:testingapp/base_architecture/presentation/pages/home_screen/about_page.dart';
import 'package:testingapp/base_architecture/presentation/pages/home_screen/contact_page.dart';
import 'package:testingapp/base_architecture/presentation/pages/home_screen/faq_page.dart';
import 'package:testingapp/base_architecture/presentation/pages/home_screen/home_page.dart';
import 'package:testingapp/base_architecture/presentation/pages/home_screen/notification.dart';

class AppRoute {
  static const product = '/product';

  static dynamic callData;

  static const home = '/home';
  static const customer = '/customer';
  static const appointMent = '/appointment';
  static const customerList = '/customerList';
  static const faq = "/faq";
  static const notification = "/notification";
  static const contact = "/contact";
  static const about = "about";

  static Route<Object>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) {
            return MainWrapper();
          },
          settings: settings,
        );
      case customer:
        return MaterialPageRoute(
          builder: (context) {
            return CustomerInfoScreen();
          },
          settings: settings,
        );

      case appointMent:
        return MaterialPageRoute(
          builder: (context) => AppointmentCalendarScreen(),
          settings: settings,
        );
      case customerList:
        return MaterialPageRoute(
          builder: (context) {
            var selectedDay = settings.arguments as DateTime;
            return CustomerListScreen(date: selectedDay);
          },
          settings: settings,
        );
      case faq:
        return MaterialPageRoute(
          builder: (context) => FAQPage(),
          settings: settings,
        );
      case notification:
        return MaterialPageRoute(
          builder: (context) => NotificationPage(),
          settings: settings,
        );
      case about:
        return MaterialPageRoute(
          builder: (context) => AboutPage(),
          settings: settings,
        );
      case contact:
        return MaterialPageRoute(
          builder: (context) => ContactUsPage(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
