import 'package:material_ui/material_ui.dart';

class Boisson extends StatefulWidget {
  const Boisson({super.key});

  @override
  State<Boisson> createState() => _BoissonState();
}

class _BoissonState extends State<Boisson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('client')));
  }
}
