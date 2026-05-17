part of 'bkash_menu_overlay.dart';

class _LanguageButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isLeft;
  final VoidCallback onTap;
  const _LanguageButton({
    required this.text,
    required this.isSelected,
    required this.isLeft,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 1.0),
          borderRadius: isLeft
              ? const BorderRadius.horizontal(
                  left: Radius.circular(16),
                  right: Radius.zero,
                )
              : const BorderRadius.horizontal(
                  left: Radius.zero,
                  right: Radius.circular(16),
                ),
          color: isSelected ? AppColors.primary : Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
