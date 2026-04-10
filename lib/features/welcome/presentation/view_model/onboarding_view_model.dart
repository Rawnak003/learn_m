import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/local_storage_services/shared_preference_data.dart';

final onboardingProvider = NotifierProvider<OnboardingNotifier, int>(OnboardingNotifier.new);

class OnboardingNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void next() {
    if (state < 2) state++;
  }

  void skip() {
    state = 2;
  }

  Future<void> completeOnboarding() async {
    await SharedPreferenceData.setOnboardingSeen();
  }
}