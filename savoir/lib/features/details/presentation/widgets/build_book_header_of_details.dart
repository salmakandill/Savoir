import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/details/data/models/book_details_model.dart';
import 'package:savoir/features/details/presentation/widgets/download_and_list_buttom.dart';
import 'package:savoir/features/details/presentation/widgets/read_now_buttom.dart';
import 'package:savoir/features/reading_fatures/data/models/my_list_model.dart';
import 'package:savoir/features/reading_fatures/presentation/cubits/my_list_cubit.dart';
import 'package:savoir/models/app_colors.dart';

class BuildBookHeaderOfDetailswidget extends StatelessWidget {
  const BuildBookHeaderOfDetailswidget({super.key, required this.book});
  final BookDetailsModel book;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyListCubit(),
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  height: 384,
                  width: 256,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(book.image ?? "", fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: 15,
                  child: Icon(
                    Icons.bookmark,
                    color: Color(0xff8D4F1D),
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Text(
            book.title ?? "Unknown Title",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif',
            ),
          ),
          const SizedBox(height: 8),

          Text(
            book.authorname ?? "Unknown Author",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: index < (book.rating ?? 0).floor()
                      ? AppColors.cardsBackground
                      : AppColors.containercolor,
                  size: 18,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "${book.rating ?? 0} (2.4k reviews)",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 24),

          ReadNowButtomwidget(books: book),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: DownloadAndListButtomwidget(
                  icon: Icons.file_download_outlined,
                  label: "Download",
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: DownloadAndListButtomwidget(
                  icon: Icons.add,
                  label: "My List",
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text("Want to Read"),
                              onTap: () {
                                context.read<MyListCubit>().addBooks(
                                  book: MyListModel(
                                    id: book.id!,
                                    title: book.title ?? "",
                                    author: book.authorname ?? "",
                                    image: book.image ?? "",
                                    category: "wantToRead",
                                  ),
                                  category: "wantToRead",
                                );
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text("Reading"),
                              onTap: () {
                                context.read<MyListCubit>().addBooks(
                                  book: MyListModel(
                                    id: book.id!,
                                    title: book.title ?? "",
                                    author: book.authorname ?? "",
                                    image: book.image ?? "",
                                    category: "reading",
                                  ),
                                  category: "reading",
                                );
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text("Finished"),
                              onTap: () {
                                context.read<MyListCubit>().addBooks(
                                  book: MyListModel(
                                    id: book.id!,
                                    title: book.title ?? "",
                                    author: book.authorname ?? "",
                                    image: book.image ?? "",
                                    category: "finished",
                                  ),
                                  category: "finished",
                                );
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text("Favorite"),
                              onTap: () {
                                context.read<MyListCubit>().addBooks(
                                  book: MyListModel(
                                    id: book.id!,
                                    title: book.title ?? "",
                                    author: book.authorname ?? "",
                                    image: book.image ?? "",
                                    category: "favorite",
                                  ),
                                  category: "favorite",
                                );
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
