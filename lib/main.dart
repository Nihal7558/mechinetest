import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mechine_test/firebase_options.dart';
import 'package:mechine_test/view%20page/home_page.dart';
import 'package:mechine_test/view%20page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: loginpage(),
    );
  }
}
