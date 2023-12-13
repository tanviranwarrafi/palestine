import 'dart:io';

import 'package:app/palestine_app.dart';
import 'package:app/provider/providers.dart';
import 'package:app/screen_craft.dart';
import 'package:app/services/http_overrides.dart';
import 'package:app/utils/default_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di.dart' as dependency_injection;

/// flutter build appbundle --release
/// flutter build apk --split-per-abi
/// flutter pub run import_sorter:main lib
/// keytool -list -v -keystore /Users/md.tanviranwarrafi/RafiTanvir/projects/freelanceing/immitrack/android_key/immitrack.jks -alias key

Future<void> main() async {
  await dependency_injection.init();
  await _initPalestineApp();
  runApp(MultiProvider(providers: providers, child: screenCraft()));
}

Widget screenCraft() => ScreenCraft(builder: (context, orientation) => PalestineApp());

Future<void> _initPalestineApp() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await sl<NotificationService>().initNotificationService();
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await portraitMode();
}
