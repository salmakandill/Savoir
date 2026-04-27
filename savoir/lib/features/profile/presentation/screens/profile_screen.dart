import 'package:flutter/material.dart';
import 'package:savoir/features/profile/presentation/screens/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],

      // AppBar
      appBar: AppBar(
        title: Text("Savoir"),
        centerTitle: true,
        backgroundColor: Colors.brown[200],
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // صورة البروفايل
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            SizedBox(height: 10),

            // الاسم
            Text(
              "Elena Thorne",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            // الوصف
            Text(
              "Lover of classics and historical fiction",
              style: TextStyle(color: Colors.grey[700]),
            ),

            SizedBox(height: 20),

            // الإحصائيات
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatBox("24", "Books Read"),
                _buildStatBox("12", "Day Streak"),
                _buildStatBox("156", "Hours Spent"),
              ],
            ),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Reading Goal",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            LinearProgressIndicator(
              value: 24 / 50,
              color: Colors.brown,
              backgroundColor: Colors.brown[100],
              minHeight: 8,
            ),
            SizedBox(height: 5),

            Text("24 / 50 Books"),
            Text(
              "You are 2 books ahead of schedule!",
              style: TextStyle(color: Colors.green),
            ),

            SizedBox(height: 20),

            // القائمة
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text("My Reviews"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favorite Authors"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.emoji_events),
              title: Text("Achievements"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),

            SizedBox(height: 20),

            // Ambient Warmth
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ambient Warmth",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        value: 0.5,
                        onChanged: (val) {},
                        activeColor: Colors.brown,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.nightlight_round, color: Colors.brown),
              ],
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        items: const [
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

  // Widget
  Widget _buildStatBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.brown[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(label),
        ],
      ),
    );
  }
}
