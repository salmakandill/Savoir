import 'package:flutter/material.dart';
import '../models/onboarding_page_model.dart';
import '../theme/app_theme.dart';
import 'illustrations.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPageModel page;

  const OnboardingPageWidget({super.key, required this.page});

  Widget _buildIllustration() {
    switch (page.illustrationType) {
      case 'discover':
        return const DiscoverIllustration();
      case 'read':
        return const ReadIllustration();
      default:
        return const LibraryIllustration();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _buildIllustration(),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(page.title,
                    textAlign: TextAlign.center, style: AppTextStyles.headline),
                const SizedBox(height: 16),
                Text(page.description,
                    textAlign: TextAlign.center, style: AppTextStyles.body),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
