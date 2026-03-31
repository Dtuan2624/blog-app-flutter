
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> categories = [
    "Category Card",
    "Category Card",
    "Category Card",
  ];

  final List<String> topics = [
    "Topic card",
    "Topic card",
    "Topic card",
    "Topic card",
    "Topic card",
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
              buildHeader(),
              buildSearchBar(),

              Expanded(
                child: isMobile
                    ? buildMobileLayout()
                    : buildDesktopLayout(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 700;

        return Container(
          color: Color(0xff7a2c2c),
          padding: EdgeInsets.all(16),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildLogo(),
              SizedBox(height: 10),
              buildLoginButton(),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildLogo(),
              buildLoginButton(),
            ],
          ),
        );
      },
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

  Widget buildLoginButton() {
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
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDesktopLayout() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: buildSection()),
          SizedBox(width: 16),
          Expanded(flex: 1, child: buildLatest(topics)),
        ],
      ),
    );
  }

  Widget buildMobileLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildLatest(topics.take(3).toList()),
            SizedBox(height: 16),
            buildSection(),
          ],
        ),
      ),
    );
  }

  Widget buildSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: Color(0xffcfcfcf),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            color: Color(0xff5a5a5a),
            child: Text(
              "Sections",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          ...categories.map((c) => buildCard(c)),
        ],
      ),
    );
  }

  Widget buildLatest(List<String> data) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: Color(0xffbdbdbd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            color: Color(0xff6b6b6b),
            child: Text(
              "Lastest Topic",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          ...data.map((t) => buildCard(t)),
        ],
      ),
    );
  }

  Widget buildCard(String text) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      color: Color(0xffe8e8e8),
      child: Text(text),
    );
  }
}
