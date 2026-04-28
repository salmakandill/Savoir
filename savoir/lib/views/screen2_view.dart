import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../viewmodels/screen2_viewmodel.dart';
import '../widgets/reading_illustration.dart';

class Screen2View extends StatelessWidget {
  const Screen2View({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Screen2ViewModel(),
      child: Consumer<Screen2ViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            backgroundColor: const Color(0xFFF0EBE1),
            body: SafeArea(
              child: Column(children: [
                // Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Savoir', style: AppTextStyles.logo),
                    GestureDetector(
                      onTap: () => vm.onSkip(context),
                      child: Text('SKIP', style: AppTextStyles.skip),
                    ),
                  ],
                ),
                // Illustration
                const Expanded(
                  flex: 5,
                  child: Center(child: ReadingIllustration()),
                ),
                // Dots (الثاني active)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  _dot(false),
                  SizedBox(width: 6),
                  _dot(true),
                  SizedBox(width: 6),
                  _dot(false),
                ]),
                // Title
                Text('Read Anywhere, Anytime',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headline.copyWith(fontSize: 22)),
                // Description
                Text(
                  'Your entire library fits in your pocket. Sync your progress across devices...',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body,
                ),
                // Next Step Button
                ElevatedButton(
                  onPressed: () => vm.onNextStep(context),
                  child: Row(children: [
                    Text('Next Step', style: AppTextStyles.button),
                    Icon(Icons.arrow_forward, color: AppColors.white),
                  ]),
                ),
                // Step counter
                Text('Step 2 of 3', style: AppTextStyles.body),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget _dot(bool isActive) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isActive ? 24 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: isActive ? AppColors.dotActive : AppColors.dotInactive,
          borderRadius: BorderRadius.circular(4),
        ),
      );
}
