import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TodoResponsive());
}

class TodoResponsive extends StatefulWidget {
  const TodoResponsive({Key key}) : super(key: key);

  @override
  _TodoResponsiveState createState() => _TodoResponsiveState();
}

class _TodoResponsiveState extends State<TodoResponsive> {
  final _routerDelegate = TodoRouterDelegate();
  final _routeInformationParser = TodoRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Todo App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 224, 206, 208),
      ),
    );
  }
}
