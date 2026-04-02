import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {"title": "My first post", "date": "2026-01-01"},
    {"title": "Another post", "date": "2026-01-02"},
    {"title": "Flutter is fun", "date": "2026-01-03"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e3e6),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 700;

          return Column(
            children: [
              buildHeader(constraints.maxWidth),
              buildSearchBar(),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: isMobile
                        ? buildMobileLayout()
                        : buildDesktopLayout(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildHeader(double width) {
    bool isMobile = width < 700;

    return Container(
      color: Color(0xff7a2c2c),
      padding: EdgeInsets.all(16),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildLogo(),
                SizedBox(height: 10),
                buildLogin(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLogo(),
                buildLogin(),
              ],
            ),
    );
  }

  Widget buildLogo() {
    return Container(
      height: 40,
      color: Color(0xffcaa300),
      alignment: Alignment.center,
      child: Text("Logo"),
    );
  }

  Widget buildLogin() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        "LOGIN/REGISTER",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 250,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search bar",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: buildProfileCard()),
        SizedBox(width: 16),
        Expanded(flex: 2, child: buildPostList()),
      ],
    );
  }

  Widget buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildProfileCard(),
        SizedBox(height: 16),
        buildPostList(),
      ],
    );
  }

  Widget buildProfileCard() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Color(0xffcfcfcf),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text("Avatar"),
          ),
          SizedBox(height: 10),
          Text("Username"),
          SizedBox(height: 6),
          Text("Email@example.com"),
          SizedBox(height: 6),
          Text("Joined: 2026"),
        ],
      ),
    );
  }

  Widget buildPostList() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Color(0xffbdbdbd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            color: Color(0xff6b6b6b),
            child: Text(
              "User Posts",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          ...posts.map((p) => buildPostItem(p)),
        ],
      ),
    );
  }

  Widget buildPostItem(Map<String, String> data) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      color: Color(0xffe8e8e8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data["title"] ?? ""),
          SizedBox(height: 4),
          Text(data["date"] ?? ""),
        ],
      ),
    );
  }
}
