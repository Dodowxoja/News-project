import 'package:flutter/material.dart';
import 'package:work/routes/my_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyRoutes _myRoutes = MyRoutes();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api',
      theme: ThemeData(),
      onGenerateRoute: _myRoutes.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
