import 'package:flutter/material.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_readiglist_container.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final List<Map<String, dynamic>> books = [
    {
      'name': 'Want To Read',
      'num': '2',
      'title': "Harry Potter And The Goblet Of Fire",
      'icon': Icons.bookmark_outline_sharp,
      'color': Colors.deepOrange,
    },
    {
      'name': 'Reading',
      'num': '2',
      'title': "Harry Potter and the Sorcerer's Ston",
      'icon': Icons.auto_stories_outlined,
      'color': Colors.green,
    },
    {
      'name': 'Finished',
      'num': '8',
      'title': "Harry Potter and the Sorcerer's Ston",
      'icon': Icons.verified_user_outlined,
      'color': Colors.blueAccent,
    },
    {
      'name': 'Favorite',
      'num': '2',
      'title': "Harry Potter and the Sorcerer's Ston",
      'icon': Icons.favorite_border,
      'color': Colors.pinkAccent,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: books.length,
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemBuilder: (context, index) {
        final book = books[index];
        return CustomReadiglistContainer(
          listname: book['name'],
          booknum: book['num'],
          title: book['title'],
          author: 'J.K Rowling',
          imageURL: 'assets/images/test.jfif',
          icon: book['icon'],
          iconcolor: book['color'],
        );
      },
    );
  }
}
