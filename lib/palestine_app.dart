import 'package:app/themes/light_theme.dart';
import 'package:app/utils/keys.dart';
import 'package:app/views/home_screen.dart';
import 'package:flutter/material.dart';

class PalestineApp extends StatefulWidget {
  @override
  State<PalestineApp> createState() => _PalestineAppState();
}

class _PalestineAppState extends State<PalestineApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: primary,
      title: 'Hetaf',
      theme: lightThemeData,
      home: HomeScreen(),
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
