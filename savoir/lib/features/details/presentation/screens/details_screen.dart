import 'package:flutter/material.dart';
import 'package:savoir/features/details/presentation/widgets/book_details.dart';
import 'package:savoir/features/details/presentation/widgets/book_details_publish_pages_number.dart';
import 'package:savoir/features/details/presentation/widgets/build_book_header_of_details.dart';
import 'package:savoir/features/details/presentation/widgets/item_of_genres.dart';
import 'package:savoir/features/home/presentation/widgets/build_card_of_recommended_for_you.dart';
import 'package:savoir/models/app_colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: AppColors.cardsBackground),
          ),
        ),
        title: Text(
          'Savoir',
          style: TextStyle(
            color: AppColors.cardsBackground,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.share, color: AppColors.cardsBackground),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildBookHeaderOfDetailswidget(),
              SizedBox(height: 48),
              BookDetailswidget(),
              SizedBox(height: 48),
              Text(
                'Synopsis',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),
              Text(
                'Night fell quickly. The temperaturedropped, and the boy wrapped his heavycloak tighter around his shoulders. Hebuilt a small fire using dry desert scrub. Ashe watched the flames dance, he thoughtof Fatima. She was waiting for him at theoasis, her eyes reflecting the same starlighthe saw now. Her love was not a chain, buta wind at his back.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),
              Text(
                'Night fell quickly. The temperaturedropped, and the boy wrapped his heavycloak tighter around his shoulders. Hebuilt a small fire using dry desert scrub. Ashe watched the flames dance, he thoughtof Fatima. She was waiting for him at theoasis, her eyes reflecting the same starlighthe saw now. Her love was not a chain, buta wind at his back.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemOfGenreswidget(
                      title: 'Literary Fiction',
                      isSelected: index == 0,
                      onTap: () {},
                    );
                  },
                ),
              ),
              SizedBox(height: 48),
              Text(
                'Book Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),
              BookDetailsPublishPagesNumberwidget(),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Readers also liked',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(color: AppColors.cardsBackground),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.55,
                ),
                itemCount: 10,
                itemBuilder: (context, index) =>
                    BuildCardOfRecommendedForYouwidget(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.cardsBackground,
        elevation: 4,
        shape: CircleBorder(),
        child: Icon(Icons.bookmark, color: Colors.white, size: 28),
      ),
    );
  }
}
