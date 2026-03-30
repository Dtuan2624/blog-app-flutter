import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThreadScreen(),
    );
  }
}

class ThreadScreen extends StatelessWidget {
  final List<Map<String, String>> comments = [
    {
      "user": "Username",
      "content": "Content",
      "time": "Datetime"
    },
    {
      "user": "Username",
      "content": "Content",
      "time": "Datetime"
    },
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
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildTitle(),
                        buildAuthor(),
                        SizedBox(height: 10),
                        ...comments.map(
                          (c) => buildComment(c, isMobile),
                        ),
                        SizedBox(height: 16),
                        buildCommentInput(),
                      ],
                    ),
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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

  Widget buildTitle() {
    return Container(
      padding: EdgeInsets.all(12),
      color: Color(0xffbdbdbd),
      child: Text("Title"),
    );
  }

  Widget buildAuthor() {
    return Container(
      padding: EdgeInsets.all(12),
      color: Color(0xff9e9e9e),
      child: Text("Author Username"),
    );
  }

  Widget buildComment(Map<String, String> data, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(10),
      color: Color(0xffcfcfcf),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildUserBox(data, isMobile),
                SizedBox(height: 8),
                buildContentBox(data),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildUserBox(data, isMobile),
                SizedBox(width: 10),
                Expanded(child: buildContentBox(data)),
              ],
            ),
    );
  }

  Widget buildUserBox(Map<String, String> data, bool isMobile) {
  return Container(
    width: isMobile ? double.infinity : 120,
    padding: EdgeInsets.all(10),
    color: Color(0xff6b6b6b),
    child: isMobile
        ? Row(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text("Avatar"),
              ),
              SizedBox(width: 10),
              Text(
                data["user"] ?? "",
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        : Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text("User avatar"),
              ),
              SizedBox(height: 6),
              Text(
                data["user"] ?? "",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
  );
}

  Widget buildContentBox(Map<String, String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data["time"] ?? ""),
        SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          color: Color(0xffe8e8e8),
          child: Text(data["content"] ?? ""),
        ),
      ],
    );
  }

  Widget buildCommentInput() {
    return Container(
      padding: EdgeInsets.all(12),
      color: Color(0xffbdbdbd),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Write your comment",
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
