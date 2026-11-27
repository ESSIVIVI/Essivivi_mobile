import 'package:material_ui/material_ui.dart';

class Activite extends StatefulWidget {
  const Activite({super.key});

  @override
  State<Activite> createState() => _ActiviteState();
}

class _ActiviteState extends State<Activite> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('activité')));
  }
}
