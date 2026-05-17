// lib/presentation/screens/home/home_screen.dart
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
                      // bKash logo (colored red)
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset('assets/bkash.png', height: 32),
                      ),
                      // Small menu icon at bottom‑right corner (touching the edge)
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
                            color: Colors.black, // black as requested
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
          children: [
            const MenuGrid(),
            Image.asset('assets/offfer_banner.png'),
          ],
        ),
      ),
    );
  }
}



// // lib/presentation/screens/home/home_screen.dart
// import 'package:bkash_app/core/app_colors.dart';
// import 'package:bkash_app/presentation/screens/home/widget/bkash_menu_overlay.dart';
// import 'package:bkash_app/presentation/screens/home/widget/home_app_bar.dart';
// import 'package:bkash_app/presentation/screens/home/widget/menu_grid.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   OverlayEntry? _menuOverlayEntry;
//
//   void _showMenu() {
//     if (_menuOverlayEntry != null) return;
//
//     _menuOverlayEntry = OverlayEntry(
//       builder: (context) => BkashMenuOverlay(
//         onClose: () {
//           _hideMenu();
//         },
//       ),
//     );
//
//     Overlay.of(context).insert(_menuOverlayEntry!);
//   }
//
//   void _hideMenu() {
//     _menuOverlayEntry?.remove();
//     _menuOverlayEntry = null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: _menuOverlayEntry == null,
//       onPopInvoked: (didPop) {
//         if (_menuOverlayEntry != null) {
//           _hideMenu();
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.primary,
//           title: const HomeAppBar(),
//           toolbarHeight: 100,
//           automaticallyImplyLeading: false,
//           // UPDATE: Single CircleAvatar containing both bKash logo and a small menu icon
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 16.0),
//               child: GestureDetector(
//                 onTap: _showMenu,
//                 child: CircleAvatar(
//                   radius: 23,
//                   backgroundColor: Colors.white,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       // bKash logo (colored red)
//                       ColorFiltered(
//                         colorFilter: ColorFilter.mode(
//                           AppColors.primary,
//                           BlendMode.srcIn,
//                         ),
//                         child: Image.asset('assets/bkash.png', height: 30),
//                       ),
//                       // Small menu icon at bottom‑right corner
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Container(
//                           padding: const EdgeInsets.all(1),
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(
//                             Icons.menu,
//                             color: AppColors.black,
//                             size: 13,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             const MenuGrid(),
//             Image.asset('assets/offfer_banner.png'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//


// // lib/presentation/screens/home/home_screen.dart
// import 'package:bkash_app/core/app_colors.dart';
// import 'package:bkash_app/presentation/screens/home/widget/bkash_menu_overlay.dart';
// import 'package:bkash_app/presentation/screens/home/widget/home_app_bar.dart';
// import 'package:bkash_app/presentation/screens/home/widget/menu_grid.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   OverlayEntry? _menuOverlayEntry;
//
//   void _showMenu() {
//     if (_menuOverlayEntry != null) return;
//
//     _menuOverlayEntry = OverlayEntry(
//       builder: (context) => BkashMenuOverlay(
//         onClose: () {
//           _hideMenu();
//         },
//       ),
//     );
//
//     Overlay.of(context).insert(_menuOverlayEntry!);
//   }
//
//   void _hideMenu() {
//     _menuOverlayEntry?.remove();
//     _menuOverlayEntry = null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: _menuOverlayEntry == null,
//       onPopInvoked: (didPop) {
//         if (_menuOverlayEntry != null) {
//           _hideMenu();
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.primary,
//           title: const HomeAppBar(),
//           toolbarHeight: 100,
//           automaticallyImplyLeading: false,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: CircleAvatar(
//                 radius: 23,
//                 backgroundColor: Colors.white,
//                 // UPDATE: Applied red color filter to the bKash logo
//                 child: ColorFiltered(
//                   colorFilter: ColorFilter.mode(
//                     AppColors.primary,
//                     BlendMode.srcIn,
//                   ),
//                   child: Image.asset('assets/bkash.png', height: 25),
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.menu, color: Colors.white),
//               onPressed: _showMenu,
//               tooltip: 'Menu',
//             ),
//             const SizedBox(width: 8),
//           ],
//         ),
//         body: Column(
//           children: [
//             const MenuGrid(),
//             Image.asset('assets/offfer_banner.png'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//



// // lib/presentation/screens/home/home_screen.dart
// import 'package:bkash_app/core/app_colors.dart';
// import 'package:bkash_app/presentation/screens/home/widget/bkash_menu_overlay.dart';
// import 'package:bkash_app/presentation/screens/home/widget/home_app_bar.dart';
// import 'package:bkash_app/presentation/screens/home/widget/menu_grid.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   OverlayEntry? _menuOverlayEntry;
//
//   void _showMenu() {
//     if (_menuOverlayEntry != null) return;
//
//     _menuOverlayEntry = OverlayEntry(
//       builder: (context) => BkashMenuOverlay(
//         onClose: () {
//           _hideMenu();
//         },
//       ),
//     );
//
//     Overlay.of(context).insert(_menuOverlayEntry!);
//   }
//
//   void _hideMenu() {
//     _menuOverlayEntry?.remove();
//     _menuOverlayEntry = null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: _menuOverlayEntry == null,
//       onPopInvoked: (didPop) {
//         if (_menuOverlayEntry != null) {
//           _hideMenu();
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.primary,
//           title: const HomeAppBar(),
//           toolbarHeight: 100,
//           automaticallyImplyLeading: false,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: CircleAvatar(
//                 radius: 16,
//                 backgroundColor: Colors.white,
//                 child: Image.asset('assets/bkash.png', height: 20),
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.menu, color: Colors.white),
//               onPressed: _showMenu,
//               tooltip: 'Menu',
//             ),
//             const SizedBox(width: 8),
//           ],
//         ),
//         body: Column(
//           children: [
//             const MenuGrid(),
//             Image.asset('assets/offfer_banner.png'),
//           ],
//         ),
//       ),
//     );
//   }
// }



// main code given teachers
// // lib/presentation/screens/home/home_screen.dart
// import 'package:bkash_app/core/app_colors.dart';
// import 'package:bkash_app/presentation/screens/home/widget/bkash_menu_overlay.dart';
// import 'package:bkash_app/presentation/screens/home/widget/home_app_bar.dart';
// import 'package:bkash_app/presentation/screens/home/widget/menu_grid.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   bool _isMenuVisible = false;
//
//   void _showMenu() {
//     setState(() {
//       _isMenuVisible = true;
//     });
//   }
//
//   void _hideMenu() {
//     setState(() {
//       _isMenuVisible = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: !_isMenuVisible,
//       onPopInvoked: (didPop) {
//         if (_isMenuVisible) {
//           _hideMenu();
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.primary,
//           title: const HomeAppBar(),
//           toolbarHeight: 100,
//           automaticallyImplyLeading: false,
//           // UPDATE: Added bKash icon and menu icon to the right side
//           actions: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: CircleAvatar(
//                 radius: 16,
//                 backgroundColor: Colors.white,
//                 child: Image.asset('assets/bkash.png', height: 20),
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.menu, color: Colors.white),
//               onPressed: _showMenu,
//               tooltip: 'Menu',
//             ),
//             const SizedBox(width: 8),
//           ],
//         ),
//         body: Stack(
//           children: [
//             Column(
//               children: [
//                 const MenuGrid(),
//                 Image.asset('assets/offfer_banner.png'),
//               ],
//             ),
//             // UPDATE: Overlay menu that slides in from right
//             if (_isMenuVisible)
//               BkashMenuOverlay(
//                 onClose: _hideMenu,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//







// import 'package:bkash_app/core/app_colors.dart';
// import 'package:bkash_app/presentation/screens/home/widget/home_app_bar.dart';
// import 'package:bkash_app/presentation/screens/home/widget/menu_grid.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.primary,
//         title: HomeAppBar(),
//         toolbarHeight: 100,
//         automaticallyImplyLeading: false,
//       ),
//       body: Column(
//         spacing: 12,
//         children: [MenuGrid(), Image.asset('assets/offfer_banner.png')],
//       ),
//     );
//   }
// }