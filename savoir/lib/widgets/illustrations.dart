import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LibraryIllustration extends StatelessWidget {
  const LibraryIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
            left: 30,
            child: Container(
              width: 180,
              height: 145,
              decoration: BoxDecoration(
                color: AppColors.cardBeige,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.accent.withOpacity(0.25),
                      blurRadius: 18,
                      offset: const Offset(4, 8))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _line(width: 110),
                    const SizedBox(height: 8),
                    _line(width: 90),
                    const SizedBox(height: 8),
                    _line(width: 130),
                    const SizedBox(height: 8),
                    _line(width: 75),
                    const SizedBox(height: 8),
                    _line(width: 100),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 15,
            child: Transform.rotate(
              angle: 0.08,
              child: Container(
                width: 75,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 18,
            right: 40,
            child: Container(
              width: 80,
              height: 28,
              decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(14)),
              child: const Center(
                  child: Icon(Icons.add, color: AppColors.white, size: 14)),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 25,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  color: AppColors.iconCircle, shape: BoxShape.circle),
              child: const Icon(Icons.edit_outlined,
                  color: AppColors.primary, size: 20),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 78,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  color: AppColors.surface, shape: BoxShape.circle),
              child: const Icon(Icons.menu_book_outlined,
                  color: AppColors.textSecondary, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _line({required double width, Color? color}) {
    return Container(
      width: width,
      height: 8,
      decoration: BoxDecoration(
        color: color ?? AppColors.accent.withOpacity(0.35),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class DiscoverIllustration extends StatelessWidget {
  const DiscoverIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 15,
            left: 35,
            child: Container(
              width: 160,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.cardBeige,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.accent.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(4, 8))
                ],
              ),
              child: const Center(
                child: Icon(Icons.explore_outlined,
                    color: AppColors.primary, size: 60),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              width: 65,
              height: 85,
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.45),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.auto_stories,
                  color: AppColors.white, size: 30),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 28,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                  color: AppColors.iconCircle, shape: BoxShape.circle),
              child:
                  const Icon(Icons.search, color: AppColors.primary, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}

class ReadIllustration extends StatelessWidget {
  const ReadIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 15,
            left: 40,
            child: Container(
              width: 170,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.cardBeige,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.accent.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(4, 8))
                ],
              ),
              child: const Center(
                child: Icon(Icons.import_contacts_outlined,
                    color: AppColors.primary, size: 60),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 25,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                  color: AppColors.iconCircle, shape: BoxShape.circle),
              child: const Icon(Icons.bookmark_outline,
                  color: AppColors.primary, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}
