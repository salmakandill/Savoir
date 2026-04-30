import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class ReadingSettingsSheet extends StatelessWidget {
  const ReadingSettingsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.1,
      maxChildSize: 0.4,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.creamBackground,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 4)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Tt",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.cardsBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "SMALL",
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.greyText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    buildVerticalDivider(),
                    const SizedBox(width: 8),
                    // إعداد "DEFAULT"
                    Column(
                      children: [
                        const Text(
                          "Tt",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.cardsBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "DEFAULT",
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.greyText,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 2),
                        ],
                      ),
                      padding: const EdgeInsets.all(1),
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.creamBackground,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 2),
                        ],
                      ),
                      padding: const EdgeInsets.all(1),
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.list, color: AppColors.cardsBackground),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.creamBackground,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "PROGRESS",
                          style: TextStyle(
                            color: AppColors.greyText,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        Text(
                          "12 mins left in chapter",
                          style: TextStyle(
                            color: AppColors.greyText,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "64% Completed",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: 0.64,
                      backgroundColor: AppColors.greyText,
                      color: AppColors.cardsBackground,
                      minHeight: 2,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "PAGE 142",
                          style: TextStyle(
                            color: AppColors.greyText,
                            fontSize: 10,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const Text(
                          "PAGE 220",
                          style: TextStyle(
                            color: AppColors.greyText,
                            fontSize: 10,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget buildVerticalDivider() {
    return Container(height: 24, width: 1, color: Colors.grey[200]);
  }
}
