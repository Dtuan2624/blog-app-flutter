import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateThreadScreen(),
    );
  }
}

class CreateThreadScreen extends StatefulWidget {
  @override
  State<CreateThreadScreen> createState() => _CreateThreadScreenState();
}

class _CreateThreadScreenState extends State<CreateThreadScreen> {
  String selectedCategory = "General";

  List<String> categories = [
    "General",
    "Technology",
    "Gaming",
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
                    child: Center(
                      child: Container(
                        width: isMobile ? double.infinity : 600,
                        child: buildForm(),
                      ),
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

  Widget buildForm() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Color(0xffcfcfcf),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Create Thread"),
          SizedBox(height: 16),

          DropdownButtonFormField<String>(
            value: selectedCategory,
            items: categories
                .map((c) => DropdownMenuItem(
                      value: c,
                      child: Text(c),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedCategory = value;
                });
              }
            },
            decoration: InputDecoration(
              labelText: "Category",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 10),

          TextField(
            decoration: InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 10),

          TextField(
            maxLines: 6,
            decoration: InputDecoration(
              labelText: "Content",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 20),

          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Thread created")),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                "Create",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
