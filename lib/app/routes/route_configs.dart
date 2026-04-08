import 'package:flutter/material.dart';
import 'package:learn_m/app/routes/route_names.dart';
import '../../features/welcome/screens/onboarding_screen.dart';

class AppRoutes {
  static String initialRoute = RouteNames.onboardingScreen;

  static final Map<String, WidgetBuilder> routes = {
    //Splash & Onboarding
    // RouteNames.splashScreen: (context) => const WelcomeScreen(),
    RouteNames.onboardingScreen: (context) => const OnboardingScreen(),

    //Auth
    // RouteNames.signUpSelectionScreen: (context) => const SignUpSelectionScreen(),
    // RouteNames.registerScreen: (context) => const RegisterScreen(),
    // RouteNames.preferenceScreen: (context) => const PreferencesScreen(),
    // RouteNames.loginScreen: (context) => const LoginScreen(),
    // RouteNames.forgetPassScreen: (context) => const ForgetPassScreen(),
    // RouteNames.verifyOtpScreen: (context) => const VerifyOtpScreen(),
    // RouteNames.setPassScreen: (context) => const SetPassScreen(),
    // RouteNames.chooseJourneyScreen: (context) => const ChoosePaymentPlanScreen(),
    // RouteNames.changePasswordScreen: (context) => const ChangePasswordScreen(),
    //
    // //Home
    // RouteNames.parentScreen: (context) => const ParentScreen(),
    // RouteNames.homeScreen: (context) => const HomeScreen(),
    // RouteNames.newQuoteEntry: (context) => const NewQuoteEntry(),
    // RouteNames.myQuotes: (context) => const MyQuotes(),
    // RouteNames.meditationAndWisdom: (context) => const MeditationAndWisdom(),
    // RouteNames.favourites: (context) => const Favourites(),
    //
    // RouteNames.emotionalBodyExcavation: (context) => const EmotionalBodyExcavationScreen(),
    // RouteNames.completedScreen: (context) => const CompletedScreen(),
    //
    // //Journal
    // RouteNames.journalScreen: (context) => const JournalScreen(),
    // RouteNames.newJournalTextAudio: (context) => const NewJournalTextAudio(),
    //
    // RouteNames.createPostScreen: (context) => const CreatePostScreen(),
    // RouteNames.postCommentScreen: (context) => const PostCommentScreen(),
    //
    // //Profile
    // RouteNames.profileScreen: (context) => const ProfileScreen(),
    // RouteNames.accountScreen: (context) => const AccountScreen(),
    // RouteNames.notificationScreen: (context) => const NotificationScreen(),
    // RouteNames.aboutScreen: (context) => const AboutScreen(),
    // RouteNames.termsOfServiceScreen: (context) => const TermsOfServiceScreen(),
    // RouteNames.privacyPolicyScreen: (context) => const PrivacyPolicyScreen(),
  };
}