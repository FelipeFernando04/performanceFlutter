import 'package:flutter/material.dart';
import 'pages/broken_list_page.dart';
import 'pages/broken_grid_page.dart';

void main() {
  runApp(const MyApp());
}

// MyApp agora é StatelessWidget — não havia motivo para ser Stateful
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VERSÃO CORRIGIDA ✅'),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Lista BOA (ListView.builder)'),
            // Navegação correta com Navigator.push — não usa runApp()
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) =>  BrokenListPage()),
            ),
          ),
          ListTile(
            title: const Text('Grid BOM (GridView.builder)'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) =>  BrokenGridPage()),
            ),
          ),
        ],
      ),
    );
  }
}
