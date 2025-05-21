import 'package:code_queez/core/config/global.dart';
import 'package:code_queez/core/config/route.dart';
import 'package:code_queez/core/theme/custom_theme.dart';
import 'package:code_queez/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:requests_inspector/requests_inspector.dart';

void main() {
  runApp(const RequestsInspector(
    enabled: kDebugMode,
    showInspectorOn: ShowInspectorOn.Both,
    navigatorKey: null,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    gNavigatorKey = _navigatorKey;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouter.generateRoute,
      title: 'Flutter Demo',
      theme: CustomTheme.themeData,
      home: const HomeScreen(),
    );
  }
}
