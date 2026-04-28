import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class CustomReadiglistContainer extends StatelessWidget {
  const CustomReadiglistContainer({
    super.key,
    required this.listname,
    required this.booknum,
    required this.title,
    required this.author,
    required this.imageURL,
    required this.icon,
    required this.iconcolor,
    this.onTap,
  });
  final String listname, booknum, title, author, imageURL;
  final IconData icon;
  final Color iconcolor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, size: 25, color: iconcolor),
                SizedBox(width: 10),
                Text(
                  listname,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.firsttextColor,
                  ),
                ),
                Spacer(),
                Text(
                  booknum,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.firsttextColor,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: AppColors.cardsBackground,
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 250,
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
                          imageURL,
                          fit: BoxFit.cover,
                          height: 160,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.firsttextColor,
                                  ),
                                ),
                                Text(
                                  author,
                                  style: TextStyle(
                                    color: AppColors.thirdTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz_outlined,
                              color: AppColors.cardsBackground,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
