import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testingapp/base_architecture/app_setting/theme/app_decoration.dart';
import 'package:testingapp/base_architecture/app_setting/utils/pref_utils.dart';
import 'package:testingapp/base_architecture/app_setting/utils/size_utils.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/app_route.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/navigation_service.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/splash_loader.dart';
import 'package:testingapp/base_architecture/data/local_datasource/token_manager.dart';
import 'package:testingapp/base_architecture/data/network_datasource/http_network.dart';
import 'package:testingapp/base_architecture/domain/entity/customer_entity.dart';

late final Box<CustomerEntity> customerBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  CustomerEntity.register();

  customerBox = await Hive.openBox<CustomerEntity>('Customers');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setUp();
    super.initState();
  }

  void setUp() async {
    prefUtils = PrefUtils();
    await prefUtils.init();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, orientation, deviceType) {
        return FutureBuilder(
          future: themeNotifier.loadTheme(),
          builder: (_, sna) {
            return ListenableBuilder(
              listenable: themeNotifier,
              builder: (_, child) {
                return MultiRepositoryProvider(
                  providers: [
                    RepositoryProvider<TokenManager>(
                      create: (_) => TokenManager(),
                    ),
                    RepositoryProvider<HttpNetworkClient>(
                      create: (_) => HttpNetworkClient(),
                    ),
                  ],
                  child: MaterialApp(
                    title: 'Remoting',
                    navigatorObservers: <NavigatorObserver>[
                      //  NavigationService.instance.routeObserver
                    ],
                    theme: themeNotifier.themeData(),
                    onGenerateRoute: AppRoute.generateRoute,
                    debugShowCheckedModeBanner: false,
                    locale: themeNotifier.currentLocale,
                    navigatorKey: NavigationService.instance.navigationKey,
                    home: SplashLoader(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
