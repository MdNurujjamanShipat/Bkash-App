part of 'bkash_menu_overlay.dart';

class _MenuHeader extends StatelessWidget {
  final String selectedLanguage;
  final void Function(String) onLanguageTap;
  const _MenuHeader({
    required this.selectedLanguage,
    required this.onLanguageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 16,
        16,
        20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'bKash Menu',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              _LanguageButton(
                text: 'ENG',
                isSelected: selectedLanguage == 'ENG',
                isLeft: true,
                onTap: () => onLanguageTap('ENG'),
              ),
              _LanguageButton(
                text: 'BAN',
                isSelected: selectedLanguage == 'BAN',
                isLeft: false,
                onTap: () => onLanguageTap('BAN'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
