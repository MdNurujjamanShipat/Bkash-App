import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';

import '../../../../core/app_colors.dart';

import '../../login/login_screen.dart';

part 'menu_panel.dart';
part 'menu_header.dart';
part 'language_button.dart';
part 'ava_beta_box.dart';
part 'version_footer.dart';

class BkashMenuOverlay extends StatefulWidget {
  final VoidCallback onClose;
  const BkashMenuOverlay({super.key, required this.onClose});

  @override
  State<BkashMenuOverlay> createState() => _BkashMenuOverlayState();
}

class _BkashMenuOverlayState extends State<BkashMenuOverlay>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final SpringSimulation _springSimulation;

  @override
  void initState() {
    super.initState();
    const spring = SpringDescription(mass: 1, stiffness: 320, damping: 40);
    _springSimulation = SpringSimulation(spring, 0.0, 1.0, 0.0);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _controller.animateWith(_springSimulation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _closeMenu() async {
    final reverseSpring = SpringSimulation(
      const SpringDescription(mass: 1, stiffness: 320, damping: 40),
      1.0,
      0.0,
      0.0,
    );
    await _controller.animateWith(reverseSpring);
    if (mounted) widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final slideValue = 1.0 - _controller.value;
        return Transform.translate(
          offset: Offset(MediaQuery.of(context).size.width * slideValue, 0),
          child: child,
        );
      },
      child: GestureDetector(
        onTap: _closeMenu,
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: Colors.black.withValues(alpha: 0.4),
          child: Align(
            alignment: Alignment.centerRight,
            child: _MenuPanel(onClose: _closeMenu),
          ),
        ),
      ),
    );
  }
}

// import 'package:bkash_app/core/app_colors.dart';
// import 'package:bkash_app/core/app_strings.dart';
// import 'package:bkash_app/presentation/screens/login/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/physics.dart';
// import 'package:flutter/scheduler.dart';
//
// // -------------------------------------------------------------------------
// // Simple model for a menu item
// // -------------------------------------------------------------------------
// class _MenuItem {
//   final String title;
//   final IconData icon;
//   final bool isNew;
//
//   const _MenuItem({
//     required this.title,
//     required this.icon,
//     this.isNew = false,
//   });
// }
//
// // -------------------------------------------------------------------------
// // Main overlay widget (handles spring animation and close behaviour)
// // -------------------------------------------------------------------------
// class BkashMenuOverlay extends StatefulWidget {
//   final VoidCallback onClose;
//
//   const BkashMenuOverlay({super.key, required this.onClose});
//
//   @override
//   State<BkashMenuOverlay> createState() => _BkashMenuOverlayState();
// }
//
// class _BkashMenuOverlayState extends State<BkashMenuOverlay>
//     with TickerProviderStateMixin {
//   late final AnimationController _controller;
//   late final SpringSimulation _springSimulation;
//
//   @override
//   void initState() {
//     super.initState();
//     const spring = SpringDescription(mass: 1, stiffness: 320, damping: 40);
//     _springSimulation = SpringSimulation(spring, 0.0, 1.0, 0.0);
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _controller.animateWith(_springSimulation);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Future<void> _closeMenu() async {
//     final reverseSpring = SpringSimulation(
//       const SpringDescription(mass: 1, stiffness: 320, damping: 40),
//       1.0,
//       0.0,
//       0.0,
//     );
//     await _controller.animateWith(reverseSpring);
//     if (mounted) {
//       widget.onClose();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         final slideValue = 1.0 - _controller.value;
//         return Transform.translate(
//           offset: Offset(MediaQuery.of(context).size.width * slideValue, 0),
//           child: child,
//         );
//       },
//       child: GestureDetector(
//         onTap: _closeMenu,
//         behavior: HitTestBehavior.opaque,
//         child: Container(
//           color: Colors.black.withValues(alpha: 0.4),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: _MenuPanel(onClose: _closeMenu),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // -------------------------------------------------------------------------
// // The actual white panel that slides in
// // -------------------------------------------------------------------------
// class _MenuPanel extends StatefulWidget {
//   final VoidCallback onClose;
//
//   const _MenuPanel({required this.onClose});
//
//   @override
//   State<_MenuPanel> createState() => _MenuPanelState();
// }
//
// class _MenuPanelState extends State<_MenuPanel> {
//   String _selectedLanguage = AppStrings.eng;
//
//   // List of menu items (same as before)
//   final List<_MenuItem> _menuItems = const [
//     _MenuItem(title: AppStrings.menuHome, icon: Icons.home_outlined),
//     _MenuItem(title: AppStrings.menuStatements, icon: Icons.receipt_outlined),
//     _MenuItem(title: AppStrings.menuLimit, icon: Icons.speed_outlined),
//     _MenuItem(
//       title: AppStrings.menuCustomerService,
//       icon: Icons.support_agent_outlined,
//     ),
//     _MenuItem(title: AppStrings.menuBkashMap, icon: Icons.map_outlined),
//     _MenuItem(
//       title: AppStrings.menuInformationUpdate,
//       icon: Icons.info_outline,
//     ),
//     _MenuItem(
//       title: AppStrings.menuNomineeUpdate,
//       icon: Icons.person_add_alt_1_outlined,
//     ),
//     _MenuItem(
//       title: AppStrings.menuDiscoverBkash,
//       icon: Icons.explore_outlined,
//       isNew: true,
//     ),
//     _MenuItem(
//       title: AppStrings.menuReferBkashApp,
//       icon: Icons.share_outlined,
//     ),
//     _MenuItem(title: AppStrings.menuLogout, icon: Icons.logout_outlined),
//   ];
//
//   void _onLanguageTap(String language) {
//     setState(() {
//       _selectedLanguage = language;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Language changed to $language')),
//     );
//   }
//
//   void _onMenuItemTap(String title) {
//     if (title == AppStrings.menuLogout) {
//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => const LoginScreen()),
//             (route) => false,
//       );
//     } else {
//       widget.onClose();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('$title tapped')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.75,
//       height: double.infinity,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           bottomLeft: Radius.circular(20),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 15,
//             offset: Offset(-3, 0),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _MenuHeader(
//             selectedLanguage: _selectedLanguage,
//             onLanguageTap: _onLanguageTap,
//           ),
//           const _AvaBetaBox(),
//           Expanded(
//             child: Material(
//               color: Colors.transparent,
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 itemCount: _menuItems.length,
//                 itemBuilder: (context, index) {
//                   final item = _menuItems[index];
//                   return ListTile(
//                     leading: Icon(item.icon, color: Colors.black87, size: 22),
//                     title: Row(
//                       children: [
//                         Text(
//                           item.title,
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: item.title == AppStrings.menuLogout
//                                 ? FontWeight.w600
//                                 : FontWeight.normal,
//                             color: item.title == AppStrings.menuLogout
//                                 ? AppColors.primary
//                                 : Colors.black87,
//                           ),
//                         ),
//                         if (item.isNew)
//                           Container(
//                             margin: const EdgeInsets.only(left: 8),
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 6,
//                               vertical: 2,
//                             ),
//                             decoration: BoxDecoration(
//                               color: AppColors.primary,
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                             child: const Text(
//                               'New!',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                     onTap: () => _onMenuItemTap(item.title),
//                   );
//                 },
//               ),
//             ),
//           ),
//           const _VersionFooter(),
//         ],
//       ),
//     );
//   }
// }
//
// // -------------------------------------------------------------------------
// // Header: "bKash Menu" + language switcher
// // -------------------------------------------------------------------------
// class _MenuHeader extends StatelessWidget {
//   final String selectedLanguage;
//   final void Function(String) onLanguageTap;
//
//   const _MenuHeader({
//     required this.selectedLanguage,
//     required this.onLanguageTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(
//         20,
//         MediaQuery.of(context).padding.top + 16,
//         16,
//         20,
//       ),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             AppStrings.bkashMenu,
//             style: TextStyle(
//               color: AppColors.primary,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Row(
//             children: [
//               _LanguageButton(
//                 text: AppStrings.eng,
//                 isSelected: selectedLanguage == AppStrings.eng,
//                 isLeft: true,
//                 onTap: () => onLanguageTap(AppStrings.eng),
//               ),
//               _LanguageButton(
//                 text: AppStrings.ban,
//                 isSelected: selectedLanguage == AppStrings.ban,
//                 isLeft: false,
//                 onTap: () => onLanguageTap(AppStrings.ban),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // -------------------------------------------------------------------------
// // Connected language buttons (ENG / BAN)
// // -------------------------------------------------------------------------
// class _LanguageButton extends StatelessWidget {
//   final String text;
//   final bool isSelected;
//   final bool isLeft;
//   final VoidCallback onTap;
//
//   const _LanguageButton({
//     required this.text,
//     required this.isSelected,
//     required this.isLeft,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.primary, width: 1.0),
//           borderRadius: isLeft
//               ? const BorderRadius.horizontal(
//             left: Radius.circular(16),
//             right: Radius.zero,
//           )
//               : const BorderRadius.horizontal(
//             left: Radius.zero,
//             right: Radius.circular(16),
//           ),
//           color: isSelected ? AppColors.primary : Colors.white,
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//             color: isSelected ? Colors.white : Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // -------------------------------------------------------------------------
// // AVA BETA box (with red border and badge)
// // -------------------------------------------------------------------------
// class _AvaBetaBox extends StatelessWidget {
//   const _AvaBetaBox();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.primary, width: 1.5),
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withValues(alpha: 0.05),
//               blurRadius: 4,
//               offset: const Offset(0, 1),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   AppStrings.ava,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.2,
//                     color: AppColors.primary,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                   decoration: BoxDecoration(
//                     color: AppColors.primary,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Text(
//                     AppStrings.beta,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4),
//             Text(
//               AppStrings.activeVirtualAssistant,
//               style: const TextStyle(fontSize: 13, color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // -------------------------------------------------------------------------
// // Version footer (centered)
// // -------------------------------------------------------------------------
// class _VersionFooter extends StatelessWidget {
//   const _VersionFooter();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: SizedBox(
//         width: double.infinity,
//         child: Text(
//           AppStrings.version,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.grey.shade500,
//             fontSize: 12,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
