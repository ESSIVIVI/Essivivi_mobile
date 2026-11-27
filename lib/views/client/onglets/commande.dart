import 'package:material_ui/material_ui.dart';

class Commande extends StatefulWidget {
  const Commande({super.key});

  @override
  State<Commande> createState() => _CommandeState();
}

class _CommandeState extends State<Commande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Commande")));
  }
}
