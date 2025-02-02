import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia/firebase_options.dart';
import 'package:socialmedia/pages/profile_page.dart';
import 'package:socialmedia/pages/settings_page.dart';
import 'package:socialmedia/pages/users_page.dart';
import 'package:socialmedia/services/auth/auth_gate.dart';
import 'package:socialmedia/themes/theme_provider.dart';

void main() async {
  //initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //run app
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/profile_page': (context) => ProfilePage(),
        '/users_page': (context) => UsersPage(),
        '/settings_page': (context) => SettingsPage(),
      },
    );
  }
}
