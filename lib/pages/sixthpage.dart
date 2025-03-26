import 'package:flutter/material.dart';

class SixthPage extends StatelessWidget {
  final String bookName;
  final String category;
  final String price;
  final String author;
 const SixthPage({
    required this.bookName,
    required this.category,
    required this.price,
    required this.author,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sixth Page - Book Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Book Name: $bookName', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Category: $category', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Price: $price', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Author: $author', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
