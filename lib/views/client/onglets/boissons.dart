import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

class Boissons extends StatefulWidget {
  const Boissons({super.key});

  @override
  State<Boissons> createState() => _BoissonsState();
}

class _BoissonsState extends State<Boissons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Boissons")));
  }
}
