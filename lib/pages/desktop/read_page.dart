import 'dart:io';

import 'package:flutter/material.dart';
import '../../models/book_model.dart';

class ReadPage extends StatelessWidget {
  final Book book;

  const ReadPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.name), centerTitle: true),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 1000,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hiển thị thông tin của Book
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Price: \$${book.price}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Size: ${book.size}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(book.description, style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const Divider(),

                // Display images from the book.data folder
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Images:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: List.generate(book.dataNum, (index) {
                          final assetPath = '${book.data}/${index + 1}.jpg';
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Image.asset(
                              assetPath,
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
