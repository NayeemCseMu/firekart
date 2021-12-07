import 'package:flutter/material.dart';
import 'package:fluttercommerce/core/navigation/navigation_handler.dart';
import 'package:fluttercommerce/features/app/res/app_theme.dart';
import 'package:fluttercommerce/core/message_handler/message_handler.dart';
import 'package:fluttercommerce/features/module_init.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.appTheme(),
      debugShowCheckedModeBanner: false,
      routerDelegate: NavigationHandler.routerDelegate,
      routeInformationParser: NavigationHandler.routeInformationParser,
      scaffoldMessengerKey: MessageHandler.scaffoldMessengerKey,
    );
  }

  @override
  void dispose() {
    super.dispose();
    ModuleInit.closeModules();
  }
}