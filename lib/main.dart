import 'package:flutter/material.dart';
import 'package:whats_pie/pages/home_page/home_page.dart';

void main() async => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whats Pie',
        home: const HomePage(title: 'Whats Pie'),
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)));
  }
}
