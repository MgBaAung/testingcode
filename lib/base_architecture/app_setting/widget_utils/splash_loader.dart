import 'package:flutter/material.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/app_route.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/navigation_service.dart';

class SplashLoader extends StatefulWidget {
  const SplashLoader({super.key});

  @override
  State<SplashLoader> createState() => _SplashLoaderState();
}

class _SplashLoaderState extends State<SplashLoader> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchAndInitApp();
    });
  }

  Future<void> _fetchAndInitApp() async {
    if (mounted) {
      Future.delayed(const Duration(seconds: 3), () {
        NavigationService.instance.pushNamedAndRemoveUntil(AppRoute.home);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
      ),
    );
  }
}
