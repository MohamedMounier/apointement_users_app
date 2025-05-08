import 'package:appointment_users/core/app.dart';
import 'package:appointment_users/core/utils/resources/app_strings.dart';
import 'package:appointment_users/core/utils/responsive/responsive_layout.dart';
import 'package:appointment_users/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'di/di_container.dart';
import 'di/di_initializer.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await initDi(diContainer, Environment.dev);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  runApp(const MyApp());
}


