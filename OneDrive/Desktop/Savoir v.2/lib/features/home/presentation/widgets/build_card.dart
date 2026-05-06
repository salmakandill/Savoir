import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class BuildCardwidget extends StatelessWidget {
  const BuildCardwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: 384,
      margin: EdgeInsets.only(right: 16, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff1A3E3E), Color(0xff0D2121)],
                ),

                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/abstract-textured-backgound.jpg',
                  ),
                  opacity: 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "ТМЫЕ ПОLIL\nГЕТИНЬЪ ТОГ\nLAVTOK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.background..withOpacity(0.6),
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.cardsBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "READERS' CHOICE",
                      style: TextStyle(
                        color: AppColors.background,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "The Art of Stillness",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Pico Iyer",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
