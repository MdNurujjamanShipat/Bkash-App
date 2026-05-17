part of 'bkash_menu_overlay.dart';

class _MenuItem {
  final String title;
  final IconData icon;
  final bool isNew;
  const _MenuItem({
    required this.title,
    required this.icon,
    this.isNew = false,
  });
}

class _MenuPanel extends StatefulWidget {
  final VoidCallback onClose;
  const _MenuPanel({required this.onClose});

  @override
  State<_MenuPanel> createState() => _MenuPanelState();
}

class _MenuPanelState extends State<_MenuPanel> {
  String _selectedLanguage = 'ENG';

  final List<_MenuItem> _menuItems = const [
    _MenuItem(title: 'Home', icon: Icons.home_outlined),
    _MenuItem(title: 'Statements', icon: Icons.receipt_outlined),
    _MenuItem(title: 'Limit', icon: Icons.speed_outlined),
    _MenuItem(title: 'Customer Service', icon: Icons.support_agent_outlined),
    _MenuItem(title: 'bKash Map', icon: Icons.map_outlined),
    _MenuItem(title: 'Information Update', icon: Icons.info_outline),
    _MenuItem(title: 'Nominee Update', icon: Icons.person_add_alt_1_outlined),
    _MenuItem(
      title: 'Discover bKash',
      icon: Icons.explore_outlined,
      isNew: true,
    ),
    _MenuItem(title: 'Refer bKash App', icon: Icons.share_outlined),
    _MenuItem(title: 'Log out', icon: Icons.logout_outlined),
  ];

  void _onLanguageTap(String language) {
    setState(() => _selectedLanguage = language);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Language changed to $language')));
  }

  void _onMenuItemTap(String title) {
    if (title == 'Log out') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    } else {
      widget.onClose();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$title tapped')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(-3, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MenuHeader(
            selectedLanguage: _selectedLanguage,
            onLanguageTap: _onLanguageTap,
          ),
          const _AvaBetaBox(),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  return ListTile(
                    leading: Icon(item.icon, color: Colors.black87, size: 22),
                    title: Row(
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: item.title == 'Log out'
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: item.title == 'Log out'
                                ? AppColors.primary
                                : Colors.black87,
                          ),
                        ),
                        if (item.isNew)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'New!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    onTap: () => _onMenuItemTap(item.title),
                  );
                },
              ),
            ),
          ),
          const _VersionFooter(),
        ],
      ),
    );
  }
}
