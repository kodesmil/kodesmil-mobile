import 'package:mobx/mobx.dart';
import 'package:module_auth/di/auth_component.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStore with _$OnboardingStore;

abstract class _OnboardingStore with Store {
  final sharedPreferenceHelper = localModule.provideSharedPreferenceHelper();

  @action
  Future onboardingDisplayed() async {
    await sharedPreferenceHelper.hasSeenOnboarding();
  }
}