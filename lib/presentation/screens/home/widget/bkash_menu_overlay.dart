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
