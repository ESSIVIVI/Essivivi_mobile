import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Profil")));
  }
}
