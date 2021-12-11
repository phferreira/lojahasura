import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja Hasura',
      theme: ThemeData(
        primaryColor: const Color(0xff797ec2),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xff797ec2), secondary: const Color(0xff72afdd))),
    ).modular();
  }
}
