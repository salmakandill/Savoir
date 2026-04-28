import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class OtpBox extends StatelessWidget {
  final String? text;
  const OtpBox({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 45,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: Center(
        child: Text(
          text ?? "•",
          style: const TextStyle(fontSize: 20, color:AppColors.cardsBackground),
        ),
      ),
    );
  }
}

class SecurityNoticeCard extends StatelessWidget {
  const SecurityNoticeCard({super.key});

  @override
  Widget build(BuildContext context) {
    
    const Color contentColor = AppColors.cardsBackground;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:AppColors.background,
        borderRadius: BorderRadius.circular(20), 
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline, size: 22, color: AppColors.cardsBackground),
              const SizedBox(width: 10),
              Text(
                "Security First",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color:AppColors.cardsBackground,
                     fontFamily: "Newsreader"
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "To protect your literary collection, Al-Qira'ah uses two-step verification for all new device logins.",
            style: TextStyle(
              fontSize: 13,
              color: AppColors.secondTextColor,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}