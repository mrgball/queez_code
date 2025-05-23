import 'dart:async'; //
import 'package:code_queez/core/shared/screen/error_screen.dart';
import 'package:code_queez/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:code_queez/core/config/global.dart';
import 'package:code_queez/core/config/route.dart';
import 'package:code_queez/core/theme/custom_theme.dart';
import 'package:code_queez/core/utils/injector.dart';
import 'package:code_queez/features/home/presentation/screen/home_screen.dart';
import 'package:code_queez/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:requests_inspector/requests_inspector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  initLocator();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorScreen(error: details.exception, stackTrace: details.stack);
  };

  runApp(const MyApp());
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuizBloc()),
        BlocProvider(create: (context) => HomeBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: MyRouter.generateRoute,
        title: 'Flutter Demo',
        theme: CustomTheme.themeData,
        home: const HomeScreen(),
      ),
    );
  }
}
