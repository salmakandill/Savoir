import 'package:flutter/material.dart';
import '../models/onboarding_page_model.dart';
import '../views/screen2_view.dart'; // ← ربط Screen 2

class OnboardingViewModel extends ChangeNotifier {
  int _currentPage = 0;

  final List<OnboardingPageModel> pages = const [
    OnboardingPageModel(
      title: 'Build Your Digital\nLibrary',
      description: 'Curate a timeless collection of wisdom and wonder...',
      illustrationType: 'library',
    ),
    OnboardingPageModel(
      title: 'Discover New\nWorlds',
      description: 'Explore thousands of titles across every genre...',
      illustrationType: 'discover',
    ),
    OnboardingPageModel(
      title: 'Read Anytime,\nAnywhere',
      description: 'Your library travels with you...',
      illustrationType: 'read',
    ),
  ];

  int get currentPage => _currentPage;
  int get totalPages => pages.length;
  bool get isLastPage => _currentPage == pages.length - 1;

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void skip(PageController controller) {
    controller.jumpToPage(pages.length - 1);
  }

  void onGetStarted(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Screen2View()),
    );
  }

  void onSignIn(BuildContext context) {
    // Navigate to sign-in screen
  }
}
