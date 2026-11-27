import 'package:essivivi/views/auth/auth_theme.dart';
import 'package:essivivi/views/auth/connection.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Essivivi',
      theme: ThemeData(
        scaffoldBackgroundColor: AuthColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AuthColors.green),
      ),
      home: const Connection(),
      debugShowCheckedModeBanner: false,
    );
  }
}
