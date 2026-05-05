import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class OtpContainer extends StatelessWidget {
  const OtpContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFF5EEDC), Color(0xffE6CCB2)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 22,
                color: AppColors.cardsBackground,
              ),
              SizedBox(width: 10),
              Text(
                "Security First",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppColors.cardsBackground,
                  fontFamily: "Newsreader",
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "To protect your literary collection, Savoir uses two-step verification for all new device logins.",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.frsittextColor,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
