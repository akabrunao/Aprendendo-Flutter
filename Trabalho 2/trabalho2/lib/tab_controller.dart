// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThemePreviewScreen(),
    );
  }
}

class ThemePreviewScreen extends StatefulWidget {
  ThemePreviewScreen({super.key});

  _ThemePreviewScreenState createState() => _ThemePreviewScreenState();

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
            _buildSelectionsTab(),
            _buildButtonsTab(),
            _buildInputsTab(),
            _buildTextTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsTab() {
    return SingleChildScrollView(
      child: Padding(
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
            const SizedBox(height: 20),
            Row(
              children: [
                TextButton(onPressed: () {}, child: const Text('Text button')),
                const SizedBox(width: 10),
                const TextButton(onPressed: null, child: Text('Disabled')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                TextButton.icon(onPressed: () {}, icon: const Icon(Icons.thumb_up), label: const Text('Text button icon')),
                const SizedBox(width: 10),
                TextButton.icon(onPressed: null, icon: const Icon(Icons.thumb_up), label: const Text('Disabled')),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Expanded(child: Text("Icon buttons")),
                const Text("Enabled"),
                IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                const SizedBox(width: 10),
                const Text("Disabled"),
                const IconButton(onPressed: null, icon: Icon(Icons.thumb_down)),
              ],
            )
          ],
        ),
      ),
    );

  }

  Widget _buildInputsTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Input',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Input',
                hintText: 'Hint',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hintText: "Hint",
                helperText: 'Helper',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: 'Input',
              decoration: const InputDecoration(
                prefix: Text('Prefix: '),	
                suffix: Text('Suffix'),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Label',
                errorText: 'Error',
              ),
            ),
            // Adicione mais campos conforme necessário
          ],
        ),
      ),
    );
  }

  bool _isSwitched = false;
  Widget _buildSelectionsTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Switch'),
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value; // Atualiza o estado do Switch
                    });
                  },
                ),
              ],
            ),
            // Adicione mais widgets aqui se necessário
          ],
        ),
      ),
    );
  }



  Widget _buildTextTab() {
    return const Center(
      child: Text('Text Section'),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
