import 'package:bkash_app/core/app_colors.dart';
import 'package:bkash_app/presentation/screens/home/widget/bkash_menu_overlay.dart';
import 'package:bkash_app/presentation/screens/home/widget/home_app_bar.dart';
import 'package:bkash_app/presentation/screens/home/widget/menu_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  OverlayEntry? _menuOverlayEntry;

  void _showMenu() {
    if (_menuOverlayEntry != null) return;

    _menuOverlayEntry = OverlayEntry(
      builder: (context) => BkashMenuOverlay(
        onClose: () {
          _hideMenu();
        },
      ),
    );

    Overlay.of(context).insert(_menuOverlayEntry!);
  }

  void _hideMenu() {
    _menuOverlayEntry?.remove();
    _menuOverlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _menuOverlayEntry == null,
      onPopInvoked: (didPop) {
        if (_menuOverlayEntry != null) {
          _hideMenu();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const HomeAppBar(),
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: _showMenu,
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset('assets/bkash.png', height: 32),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [const MenuGrid(), Image.asset('assets/offfer_banner.png')],
        ),
      ),
    );
  }
}
