import 'package:essivivi/views/livreur/onglets/acceuil.dart';
import 'package:essivivi/views/livreur/onglets/activite.dart';
import 'package:essivivi/views/livreur/onglets/carte.dart';
import 'package:essivivi/views/livreur/onglets/client.dart';
import 'package:essivivi/views/livreur/onglets/new_commande.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:remixicon/remixicon.dart';

class LivreurNav extends StatefulWidget {
  const LivreurNav({super.key});

  @override
  State<LivreurNav> createState() => _LivreurNavState();
}

class _LivreurNavState extends State<LivreurNav> {
  int selectedIndex = 0;

  void onIndexTap(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Commande()),
      );
      return;
    }
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List widgetList = [
      const Acceuil(),
      const Boisson(),
      // index 2 réservé au FAB (ouvre NewCommande)
      const SizedBox.shrink(),
      const Historique(),
      const Activite(),
    ];

    final currentPage = widgetList.elementAt(selectedIndex);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (selectedIndex == 0) {
          SystemNavigator.pop();
          return;
        }
        setState(() => selectedIndex = 0);
      },
      child: Scaffold(
        body: currentPage,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Commande()),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          backgroundColor: const Color(0xFF1c058c),
          child: const Icon(
            RemixIcons.add_large_line,
            color: Colors.white,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.blueGrey,
          currentIndex: selectedIndex,
          onTap: onIndexTap,
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xFF1c058c),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(RemixIcons.home_2_line),
              label: "Acceuil",
            ),
            BottomNavigationBarItem(
              icon: Icon(RemixIcons.group_line),
              label: "clients",
            ),
            BottomNavigationBarItem(icon: SizedBox.shrink(), label: ""),
            BottomNavigationBarItem(
              icon: Icon(RemixIcons.map_pin_2_line),
              label: "Carte",
            ),
            BottomNavigationBarItem(
              icon: Icon(RemixIcons.bar_chart_box_line),
              label: "Activité",
            ),
          ],
        ),
      ),
    );
  }
}
