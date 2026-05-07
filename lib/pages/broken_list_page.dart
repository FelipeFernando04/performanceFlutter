import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BrokenListPage extends StatelessWidget {
  const BrokenListPage({super.key});

  static const int _itemCount = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOA — ListView.builder'),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: _itemCount,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/seed/$i/400/300',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => const SizedBox(
                    height: 200,
                    child: Center(child: Icon(Icons.error)),
                  ),
                ),
                const SizedBox(height: 12),
                Text('Item $i'),
              ],
            ),
          );
        },
      ),
    );
  }
}
