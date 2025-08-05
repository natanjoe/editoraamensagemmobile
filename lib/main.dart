import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'core/constants/palette.dart';
import 'views/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Parse SDK
  const String appId = 'j02lf0wIeQGlGKEci5wmbOyVw6JApNEEn1oQDv9x';
  const String clientKey = '9OXjIGMdChZtMWs6vaJ3j4GPJOfiDt9coNOatF4b';
  const String serverUrl = 'https://parseapi.back4app.com/';

  await Parse().initialize(
    appId,
    serverUrl,
    clientKey: clientKey,
    autoSendSessionId: true,
    debug: true, // mostra logs no console
  );

  runApp(const EditoraMensagemApp());
}

class EditoraMensagemApp extends StatelessWidget {
  const EditoraMensagemApp({super.key});

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
