import 'package:essivivi/theme/app_colors.dart';
import 'package:essivivi/views/client/onglets/accueil.dart';
import 'package:essivivi/views/client/onglets/boissons.dart';
import 'package:essivivi/views/client/onglets/commande.dart';
import 'package:essivivi/views/client/onglets/historique.dart';
import 'package:essivivi/views/client/onglets/profil.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class ClientNav extends StatefulWidget {
  const ClientNav({super.key});

  @override
  State<ClientNav> createState() => _ClientNavState();
}

class _ClientNavState extends State<ClientNav> {
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
      const Accueil(),
      const Boissons(),
      // index 2 réservé au FAB (ouvre Commande)
      const SizedBox.shrink(),
      const Historique(),
      const Profil(),
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
          backgroundColor: AppColors.green,
          child: const Icon(
            RemixIcons.add_large_line,
            color: Colors.white,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.muted,
          currentIndex: selectedIndex,
          onTap: onIndexTap,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.green,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(RemixIcons.home_2_line),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
              icon: Icon(RemixIcons.shopping_cart_2_line),
              label: "Boissons",
            ),
            BottomNavigationBarItem(icon: SizedBox.shrink(), label: ""),
            BottomNavigationBarItem(
              icon: Icon(RemixIcons.git_repository_commits_line),
              label: "Historique",
            ),
            BottomNavigationBarItem(
              icon: Icon(RemixIcons.user_3_line),
              label: "Profil",
            ),
          ],
        ),
      ),
    );
  }
}
