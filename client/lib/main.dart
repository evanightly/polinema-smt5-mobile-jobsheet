import 'package:client/config/default_style.dart';
import 'package:client/widgets/employees.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultStyle,
      title: 'Employee Management App',
      home: const Employees(),
    );
  }
}
