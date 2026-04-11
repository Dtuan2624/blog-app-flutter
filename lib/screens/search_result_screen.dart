import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  final List threads; // truyền danh sách thread vào

  const SearchResultScreen({super.key, required this.threads});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  TextEditingController searchController = TextEditingController();
  List filteredThreads = [];

  @override
  void initState() {
    super.initState();
    filteredThreads = widget.threads;
  }

  void search(String keyword) {
    final results = widget.threads.where((thread) {
      final title = thread['title'].toLowerCase();
      return title.contains(keyword.toLowerCase());
    }).toList();

    setState(() {
      filteredThreads = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Threads")),
      body: Column(
        children: [
          // 🔍 Ô tìm kiếm
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Nhập tiêu đề...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: search,
            ),
          ),

          // 📋 Kết quả
          Expanded(
            child: ListView.builder(
              itemCount: filteredThreads.length,
              itemBuilder: (context, index) {
                final thread = filteredThreads[index];
                return ListTile(
                  title: Text(thread['title']),
                  subtitle: Text(thread['content']),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}