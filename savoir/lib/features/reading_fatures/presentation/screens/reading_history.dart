import 'package:flutter/material.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_listheader.dart';

import 'package:savoir/models/app_colors.dart';

class ReadingHistory extends StatefulWidget {
  const ReadingHistory({super.key});

  @override
  State<ReadingHistory> createState() => _ReadingHistoryState();
}

class _ReadingHistoryState extends State<ReadingHistory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomListheader(
            title: 'Currently Reading',
            subtitle: '3 BOOKS',
            subtitleColor: AppColors.thirdTextColor,
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 310,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (context, index) => SizedBox(width: 20),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/bookcover.webp',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The Shadow of the Wind',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.frsittextColor,
                            ),
                          ),
                          Text(
                            'Carlos Ruiz Zafón',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.thirdTextColor,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: 0.65,
                                    minHeight: 5,
                                    color: AppColors.cardsBackground,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '65%',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.cardsBackground,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 24),
          CustomListheader(
            title: 'Reading History',
            subtitle: 'View All',
            subtitleColor: AppColors.cardsBackground,
          ),
          SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 6,
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/images/harry-potter-and-the-deathly-hallows.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                  SizedBox(width: 22),
                  SizedBox(
                    width: 150,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harry Potter And The Deathly Hallows',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.frsittextColor,
                          ),
                        ),
                        Text(
                          'J.K Rowling',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.thirdTextColor,
                          ),
                        ),
                        Text(
                          'Finished reading 2 days ago • 12 hours total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            color: AppColors.thirdTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
