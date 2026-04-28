import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../viewmodels/screen3_viewmodel.dart';

class Screen3View extends StatelessWidget {
  const Screen3View({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Screen3ViewModel(),
      child: Consumer<Screen3ViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            backgroundColor: const Color(0xFFF0EBE1),
            body: SafeArea(
              child: Column(
                children: [
                  // ─── Top Bar ─────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Savoir', style: AppTextStyles.logo),
                        GestureDetector(
                          onTap: () => vm.onSkip(context),
                          child: Text('Skip', style: AppTextStyles.skip),
                        ),
                      ],
                    ),
                  ),

                  // ─── الصورة ──────────────────────────────────
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/images/discover.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ─── Title ───────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'Discover Your Next\nStory',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headline,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ─── Description ─────────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Text(
                      'Uncover literary gems tailored specifically for your unique taste.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body,
                    ),
                  ),

                  // ─── Dots (التالت active) ─────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _dot(false),
                        const SizedBox(width: 6),
                        _dot(false),
                        const SizedBox(width: 6),
                        _dot(true),
                      ],
                    ),
                  ),

                  // ─── Continue Journey Button ──────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () => vm.onContinueJourney(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Continue Journey',
                                style: AppTextStyles.button),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward,
                                color: AppColors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // ─── Part counter ─────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.menu_book_outlined,
                          color: AppColors.textSecondary, size: 14),
                      const SizedBox(width: 6),
                      Text('PART 1 OF 3',
                          style: AppTextStyles.body
                              .copyWith(fontSize: 11, letterSpacing: 1.2)),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
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
