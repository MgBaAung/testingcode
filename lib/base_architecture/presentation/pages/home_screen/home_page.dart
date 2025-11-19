import 'package:flutter/material.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/app_route.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/navigation_service.dart';
import 'package:testingapp/base_architecture/presentation/pages/home_screen/about_page.dart';
import 'package:testingapp/base_architecture/presentation/pages/home_screen/contact_page.dart'
    hide orangeTheme;
import 'package:testingapp/base_architecture/presentation/pages/home_screen/widgets/home_widget.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Center(child: Text(title));
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get _widgetOptions => <Widget>[
    HomeContentView(onNavigateBottomBar: _onItemTapped),
    const ContactUsPage(),
    const AboutPage(),
  ];

  List<PreferredSizeWidget> get _titiles => [
    AppBar(
      title: const Text(
        'Customer Appointment System',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: DropdownButton<String>(
            value: 'Eng',
            icon: const Icon(Icons.arrow_drop_down),
            underline: Container(),
            onChanged: (String? newValue) {},
            items: <String>['Eng', 'Myan'].map<DropdownMenuItem<String>>((
              String value,
            ) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ),
      ],
    ),
    AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: orangeTheme,
      title: const Text(
        'Contact Us (ဆက်သွယ်ရန်)',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      elevation: 0,
    ),
    AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: orangeTheme,
      title: const Text(
        'About Us (ကျွန်ုပ်တို့အကြောင်း)',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      elevation: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titiles.elementAt(_selectedIndex),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contact Us'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContentView extends StatelessWidget {
  final Function(int) onNavigateBottomBar;

  const HomeContentView({super.key, required this.onNavigateBottomBar});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Appointment',
        'icon': Icons.calendar_today,
        'destination': AppRoute.appointMent,
        'index': -1,
      },
      {
        'title': 'Customer',
        'icon': Icons.people_alt,
        'destination': AppRoute.customer,
        'index': -1,
      },
      {
        'title': 'About Us',
        'icon': Icons.info_outline,
        'destination': AppRoute.about,
        'index': 2,
      },
      {
        'title': 'Contact Us',
        'icon': Icons.phone,
        'destination': AppRoute.contact,
        'index': 1,
      },
      {
        'title': 'FAQ',
        'icon': Icons.help_outline,
        'destination': AppRoute.faq,
        'index': -1,
      },
      {
        'title': 'Notification',
        'icon': Icons.notifications_none,
        'destination': AppRoute.notification,
        'index': -1,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final String title = item['title'] as String;
          final int bottomIndex = item['index'] as int;

          return HomeWidget(
            title: title,
            onTap: () {
              if (bottomIndex != -1) {
                onNavigateBottomBar(bottomIndex);
              } else {
                NavigationService.instance.pushNamed(item['destination']);
              }
            },
            icon: item['icon'] as IconData,
          );
        },
      ),
    );
  }
}
