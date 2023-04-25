import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/sign_in_screen.dart';
import 'package:greengrocer/src/auth/sign_up_screen.dart';
import 'package:greengrocer/src/base/base_screen.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: CustomColors.customSwatchColor,
      ),
      home: const SignInScreen(),
      routes: {
        '/login' : (context) => const SignInScreen(),
        '/cadastro' : (context) => SignUpScreen(),
        '/base' : (context) =>  const BaseScreen()  
      }
    );
  }
 

}
