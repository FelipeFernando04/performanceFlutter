import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BrokenGridPage extends StatelessWidget {
  const BrokenGridPage({super.key});

  static const int _itemCount = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOA — GridView.builder'),
        backgroundColor: Colors.pink,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: _itemCount,
        itemBuilder: (context, i) {
          return ColoredBox(
            color: Colors.pinkAccent,
            child: Column(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/seed/$i/400/300',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text('Item $i'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
