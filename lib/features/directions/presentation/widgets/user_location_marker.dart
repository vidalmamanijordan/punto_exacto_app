import 'package:flutter/material.dart';

class UserLocationMarker extends StatefulWidget {
  const UserLocationMarker({super.key});

  @override
  State<UserLocationMarker> createState() => _UserLocationMarkerState();
}

class _UserLocationMarkerState extends State<UserLocationMarker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, _) {
        final scale = 1 + (_pulseController.value * 1.2);
        final opacity = (1 - _pulseController.value).clamp(0.0, 1.0);

        return Stack(
          alignment: Alignment.center,
          children: [
            // Halo pulsante, como el "radar" de ubicación
            Transform.scale(
              scale: scale,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withValues(alpha: opacity * 0.35),
                ),
              ),
            ),
            // El punto sólido central
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
