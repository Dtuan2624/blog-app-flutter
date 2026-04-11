import 'package:flutter/material.dart';

class EditThreadScreen extends StatefulWidget {
  final Map thread;

  const EditThreadScreen({super.key, required this.thread});

  @override
  State<EditThreadScreen> createState() => _EditThreadScreenState();
}

class _EditThreadScreenState extends State<EditThreadScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.thread['title']);
    contentController = TextEditingController(text: widget.thread['content']);
  }

  void updateThread() {
    setState(() {
      widget.thread['title'] = titleController.text;
      widget.thread['content'] = contentController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Cập nhật thành công")),
    );

    Navigator.pop(context, widget.thread);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Thread")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: "Content"),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateThread,
              child: Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}