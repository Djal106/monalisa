import 'package:flutter/material.dart';
import 'package:monalisa/stateful.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primaryColor: Colors.brown,
    );

    return MaterialApp(
      title: "Museum",
      theme: theme,
      home: const Artwork(),
    );
  }
}