import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[900],
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.white)
          ),
          colorScheme: ColorScheme(
            primary: Colors.purple[200],
            onPrimary: Colors.black54,
            secondary: Colors.purple[800],
            onSecondary: Colors.black87,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.orange,
            onBackground: Colors.orangeAccent,
            surface: Colors.black,
            onSurface: Colors.purple,
            brightness: Brightness.dark,
          )),
      home: InputPage(),
    );
  }
}


