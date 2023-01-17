import 'package:flutter/material.dart';

class detailPage extends StatefulWidget {
  detailPage({super.key, this.data});
  dynamic data;

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _createBody("${widget.data["photo"]}", "${widget.data["title"]}", "${widget.data["goodSources"]}",
            "${widget.data["content"]}"));
  }

  Widget _createBody(String photo, String title, String goodSources, String content) {
    return Column(
      children: [
        Image.network(
          '$photo',
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        Text(
          "$title",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "$content",
            style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(height: 20),
        Text("$title İçeren Besinler",
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "$goodSources",
            style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
