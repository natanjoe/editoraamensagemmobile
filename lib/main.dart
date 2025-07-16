import 'package:flutter/material.dart';
import 'core/constants/palette.dart';
import 'views/home/home_page.dart';

void main() {
  runApp(const EditoraMensagemApp());
}

class EditoraMensagemApp extends StatelessWidget {
  const EditoraMensagemApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editora A Mensagem',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: AppColors.textSecondary),
        ),
      ),
      home: const HomePage(),
    );
  }
}
