// lib/presentation/screens/profile/profile_screen.dart
import 'package:bkash_app/core/app_colors.dart';
import 'package:bkash_app/core/app_strings.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary, // Red background as in image
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppStrings.profileTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info card (unchanged)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.userName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '+880 1912 474177',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Edit Profile tapped')),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                    ),
                    child: Text(
                      AppStrings.edit,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Section: Set Your Transaction Features
            _buildSectionTitle(AppStrings.transactionFeaturesTitle),
            _buildMenuItem(
              context,
              AppStrings.oneTapTransaction,
              Icons.flash_on,
            ),
            _buildMenuItem(context, AppStrings.bkashNfc, Icons.nfc),
            _buildMenuItem(context, AppStrings.savedCards, Icons.credit_card),
            _buildMenuItem(context, AppStrings.linkedApps, Icons.apps),
            _buildMenuItem(context, AppStrings.touchFaceId, Icons.fingerprint),
            const Divider(height: 24, thickness: 1, indent: 16, endIndent: 16),
            // Section: Select Your Preferences
            _buildSectionTitle(AppStrings.preferencesTitle),
            _buildMenuItem(context, AppStrings.selectTheme, Icons.palette),
            _buildMenuItem(
              context,
              AppStrings.notificationManagement,
              Icons.notifications,
            ),
            const Divider(height: 24, thickness: 1, indent: 16, endIndent: 16),
            // Section: Manage Your Account
            _buildSectionTitle(AppStrings.manageAccountTitle),
            _buildMenuItem(
              context,
              AppStrings.updateBkashNumber,
              Icons.phone_android,
            ),
            _buildMenuItem(context, AppStrings.others, Icons.more_horiz),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87, size: 24),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, color: Colors.black87),
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title tapped')),
        );
      },
    );
  }
}



// // lib/presentation/screens/profile/profile_screen.dart
// import 'package:bkash_app/core/app_colors.dart';
// import 'package:bkash_app/core/app_strings.dart';
// import 'package:flutter/material.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           AppStrings.profileTitle,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // User info card
//             Container(
//               margin: const EdgeInsets.all(16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withValues(alpha: 0.05),
//                     blurRadius: 8,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         AppStrings.userName,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       const Text(
//                         '+880 1912 474177',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Edit Profile tapped')),
//                       );
//                     },
//                     style: TextButton.styleFrom(
//                       foregroundColor: AppColors.primary,
//                     ),
//                     child: Text(
//                       AppStrings.edit,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Section: Set Your Transaction Features
//             _buildSectionTitle(AppStrings.transactionFeaturesTitle),
//             _buildMenuItem(context, AppStrings.oneTapTransaction),
//             _buildMenuItem(context, AppStrings.bkashNfc),
//             _buildMenuItem(context, AppStrings.savedCards),
//             _buildMenuItem(context, AppStrings.linkedApps),
//             _buildMenuItem(context, AppStrings.touchFaceId),
//             const Divider(height: 24, thickness: 1, indent: 16, endIndent: 16),
//             // Section: Select Your Preferences
//             _buildSectionTitle(AppStrings.preferencesTitle),
//             _buildMenuItem(context, AppStrings.selectTheme),
//             _buildMenuItem(context, AppStrings.notificationManagement),
//             const Divider(height: 24, thickness: 1, indent: 16, endIndent: 16),
//             // Section: Manage Your Account
//             _buildSectionTitle(AppStrings.manageAccountTitle),
//             _buildMenuItem(context, AppStrings.updateBkashNumber),
//             _buildMenuItem(context, AppStrings.others),
//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMenuItem(BuildContext context, String title) {
//     return ListTile(
//       title: Text(
//         title,
//         style: const TextStyle(fontSize: 15, color: Colors.black87),
//       ),
//       onTap: () {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('$title tapped')),
//         );
//       },
//     );
//   }
// }