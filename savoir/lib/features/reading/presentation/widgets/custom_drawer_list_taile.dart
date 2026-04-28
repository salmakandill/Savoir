import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class CustomDrawerListTaile extends StatelessWidget {
 const CustomDrawerListTaile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.iconsColor,),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.firsttextColor,
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
