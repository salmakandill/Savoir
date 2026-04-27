import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.brown[200],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                title: Text(
                  "Clara Bennett",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Avid Reader • 42 books this year"),
              ),
            ),

            SizedBox(height: 20),

            // Account
            Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email Address"),
              subtitle: Text("clara.bennett@readalog.com"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Password & Security"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification Preferences"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),

            SizedBox(height: 20),

            // Reading Experience
            Text(
              "Reading Experience",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SwitchListTile(
              secondary: Icon(Icons.wb_sunny_outlined),
              title: Text("Candlelight Mode"),
              subtitle: Text("Warm light for eye comfort"),
              value: true,
              activeColor: Colors.brown,
              onChanged: (val) {},
            ),

            // Text Size
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.text_fields, color: Colors.brown),
                      SizedBox(width: 16),
                      Text("Text Size"),
                      Spacer(),
                      Text("Large", style: TextStyle(color: Colors.brown[700])),
                    ],
                  ),
                  Slider(
                    value: 0.7,
                    activeColor: Colors.brown,
                    inactiveColor: Colors.brown[100],
                    onChanged: (val) {},
                  ),
                ],
              ),
            ),

            // Line Spacing
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.format_line_spacing, color: Colors.brown),
                      SizedBox(width: 16),
                      Text("Line Spacing"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ["Comfort", "Compact", "Wide"].map((option) {
                      return ChoiceChip(
                        label: Text(option),
                        selected: option == "Comfort",
                        selectedColor: Colors.brown[300],
                        onSelected: (_) {},
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // General
            Text(
              "General",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text("Privacy & Policy"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact Us"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),

            SizedBox(height: 20),

            Center(
              child: Text(
                "Readiv v2.4.0 • Made for Slow Reading",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
}
