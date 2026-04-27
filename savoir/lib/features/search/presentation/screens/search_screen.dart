import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[50],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.wb_sunny_outlined, color: Colors.brown[300]),
          onPressed: () {},
        ),
        title: Text(
          "Savoir",
          style: TextStyle(
            color: Colors.brown[400],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: Colors.brown[300]),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search books...",
                hintStyle: TextStyle(color: Colors.brown[300]),
                prefixIcon: Icon(Icons.search, color: Colors.brown[300]),
                filled: true,
                fillColor: Colors.brown[100],
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 20),

            // Recent Searches
            Text(
              "Recent searches",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                _buildTag("Classic Literature"),
                _buildTag("Space Exploration"),
                _buildTag("Poetry"),
              ],
            ),

            SizedBox(height: 20),

            // Suggested Books
            Text(
              "Suggested books",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            _buildBookCard(
              "Klara and the Sun",
              "Kazuo Ishiguro",
              "Fiction",
              4.1,
              "assets/klara.png",
            ),
            _buildBookCard(
              "The Song of Achilles",
              "Madeline Miller",
              "Mythology",
              4.4,
              "assets/achilles.png",
            ),
            _buildBookCard(
              "Dune",
              "Frank Herbert",
              "Sci-Fi",
              4.3,
              "assets/dune.png",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "Library",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Discover"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.brown[100],
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  Widget _buildBookCard(
    String title,
    String author,
    String genre,
    double rating,
    String imagePath,
  ) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 6),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 55,
              height: 75,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 55,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.brown[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.book, color: Colors.white),
              ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author,
                style: TextStyle(color: Colors.brown[400], fontSize: 12),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.brown[400], size: 14),
                  SizedBox(width: 4),
                  Text(
                    "$rating • $genre",
                    style: TextStyle(color: Colors.brown[400], fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(color: Colors.brown[100]),
      ],
    );
  }
}
