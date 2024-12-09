import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ThemePreviewScreen(),
    );
  }
}

class ThemePreviewScreen extends StatelessWidget {
  const ThemePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Número de abas
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Buttons', icon: Icon(Icons.touch_app)),
              Tab(text: 'Inputs', icon: Icon(Icons.input)),
              Tab(text: 'Selections', icon: Icon(Icons.check_box)),
              Tab(text: 'Text', icon: Icon(Icons.text_fields)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildButtonsTab(),
            _buildInputsTab(),
            _buildSelectionsTab(),
            _buildTextTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsTab() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Elevated button')),
              const SizedBox(width: 10),
              const ElevatedButton(onPressed: null, child: Text('Disabled')),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.thumb_up), label: const Text('Elevated button icon')),
              const SizedBox(width: 10),
              ElevatedButton.icon(onPressed: null, icon: const Icon(Icons.thumb_up), label: const Text('Disabled')),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              FilledButton(onPressed: () {}, child: const Text('Filled button')),
              const SizedBox(width: 10),
              const FilledButton(onPressed: null, child: Text('Disabled')),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.thumb_up), label: const Text('Filled button icon')),
              const SizedBox(width: 10),
              FilledButton.icon(onPressed: null, icon: const Icon(Icons.thumb_up), label: const Text('Disabled')),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              OutlinedButton(onPressed: () {}, child: const Text('Outlined button')),
              const SizedBox(width: 10),
              const OutlinedButton(onPressed: null, child: Text('Disabled')),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.thumb_up), label: const Text('Outlined button icon')),
              const SizedBox(width: 10),
              OutlinedButton.icon(onPressed: null, icon: const Icon(Icons.thumb_up), label: const Text('Disabled')),
            ],
          ),
        ],
      ),
    );

  }

  Widget _buildInputsTab() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Label',
              errorText: 'Error message',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Helper: Input',
              hintText: 'Suffix',
            ),
          ),
          SizedBox(height: 20),
          // Adicione mais campos conforme necessário
        ],
      ),
    );
  }

  Widget _buildSelectionsTab() {
    return const Center(
      child: Text('Selections Section'),
    );
  }

    Widget _buildTextTab() {
    return const Center(
      child: Text('Text Section'),
    );
  }
}
