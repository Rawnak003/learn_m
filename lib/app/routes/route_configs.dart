import 'package:flutter/material.dart';
import 'package:learn_m/app/routes/route_names.dart';
import '../../features/auth/presentation/views/auth_screen/auth_screen.dart';
import '../../features/welcome/presentation/views/onboarding_screen.dart';

class AppRoutes {
  static String initialRoute = RouteNames.onboardingScreen;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onboardingScreen:
        return _buildRoute(const OnboardingScreen());

      case RouteNames.authScreen:
        return _buildRoute(const AuthScreen());

      default:
        return null;
    }
  }

  static PageRouteBuilder _buildRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,

      transitionDuration: const Duration(milliseconds: 350),

      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return FadeTransition(
          opacity: curvedAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          ),
        );
      },
    );
  }
}
