import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThreadListScreen(),
    );
  }
}

class ThreadListScreen extends StatelessWidget {
  final List<Map<String, String>> threads = List.generate(
    5,
    (index) => {
      "title": "Title",
      "author": "Author",
      "views": "View Number",
      "replies": "Replies"
    },
  );

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
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildTopBar(),
                      SizedBox(height: 10),

                      Expanded(
                        child: ListView(
                          children: threads
                              .map((t) => buildThreadItem(t, isMobile))
                              .toList(),
                        ),
                      ),
                    ],
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

 Widget buildTopBar() {
  String selected = "Latest";

  return Container(
    padding: EdgeInsets.all(10),
    color: Color(0xff5a5a5a),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Page select", style: TextStyle(color: Colors.white)),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Color(0xffbdbdbd),
          child: DropdownButton<String>(
            value: selected,
            underline: SizedBox(),
            items: ["Latest", "Views", "Replies"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
        ),
      ],
    ),
  );
}

  Widget buildThreadItem(Map<String, String> data, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      color: Color(0xffcfcfcf),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data["title"] ?? ""),
                SizedBox(height: 4),
                Text("by ${data["author"]}"),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data["views"] ?? ""),
                    Text(data["replies"] ?? ""),
                  ],
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data["title"] ?? ""),
                      SizedBox(height: 4),
                      Text("by ${data["author"]}"),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    data["views"] ?? "",
                    textAlign: TextAlign.right,
                  ),
                ),
                Expanded(
                  child: Text(
                    data["replies"] ?? "",
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
    );
  }
}
