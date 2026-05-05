import 'package:flutter/material.dart';
import 'package:savoir/features/details/data/models/also_liked_books_model.dart';
import 'package:savoir/features/home/presentation/widgets/build_card.dart';
import 'package:savoir/features/home/presentation/widgets/genres_item.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_drawer.dart';
import 'package:savoir/models/app_colors.dart';
import '../widgets/build_continue_reading_card.dart';
import '../widgets/build_card_of_recommended_for_you.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,

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
            child: Icon(
              Icons.notifications_none,
              color: AppColors.cardsBackground,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => BuildCardwidget(),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Explore Genres',
                style: TextStyle(color: AppColors.textColor4, fontSize: 24),
              ),
              SizedBox(height: 4),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GenresItemwidget(
                      title: 'All',
                      isSelected: index == 0,
                      onTap: () {},
                    );
                  },
                ),
              ),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Continue Reading',
                    style: TextStyle(color: AppColors.textColor4, fontSize: 24),
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
              BuildContinueReadingCardwidget(),
              const SizedBox(height: 40),
              Text(
                "Recommended for You",
                style: TextStyle(
                  color: AppColors.textColor4,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
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
                itemBuilder: (context, index) => BuildCardOfRecommendedForYouwidget(
                  likedBooks: AlsoLikedBooksModel(
                    id: index,
                    title: "Book Name $index",
                    category: "Category",
                    image:
                        "https://images.search.yahoo.com/search/images;_ylt=AwrNODtsBPlpPwIAXx9XNyoA;_ylu=Y29sbwNiZjEEcG9zAzEEdnRpZAMEc2VjA3Nj?type=E210US91105G0&p=book+image&fr=mcafee&th=301&tw=474&imgurl=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F1209397.jpg&rurl=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbooks%2F&size=2136KB&name=500%2B+Beautiful+Books+Photos+%C2%B7+Pexels+%C2%B7+Free+Stock+Photos&oid=4&h=3107&w=4880&turl=https%3A%2F%2Ftse1.mm.bing.net%2Fth%2Fid%2FOIP.BRfzuv_lNslKjMToY7T3FQHaEt%3Fpid%3DApi&tt=500%2B+Beautiful+Books+Photos+%C2%B7+Pexels+%C2%B7+Free+Stock+Photos&sigr=FFHKg_.Ycw79&sigit=Y_mgyJIffszM&sigi=.9825JsZjRuN&sign=WCHbrNmyCqfz&sigt=WCHbrNmyCqfz",
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
