// ignore_for_file: must_be_immutable

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

class ThemePreviewScreen extends StatefulWidget {
  const ThemePreviewScreen({super.key});

  @override
  _ThemePreviewScreenState createState() => _ThemePreviewScreenState();
}

class _ThemePreviewScreenState extends State<ThemePreviewScreen> {
  bool _isSwitched = false;
  bool? _isChecked = false;
  int? _selectedRadioValue;
  double _sliderValue1 = 0.2;
  double _sliderValue2 = 20;
  final double _sliderValue3 = 0.2;
  DateTime? _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Número de abas
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Buttons', icon: Icon(Icons.touch_app)),
              Tab(text: 'Inputs', icon: Icon(Icons.input)),
              Tab(text: 'Selections', icon: Icon(Icons.check_box)),
              Tab(text: 'Text', icon: Icon(Icons.text_fields)),
              Tab(text: 'Web', icon: Icon(Icons.web)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildButtonsTab(),
            _buildInputsTab(),
            _buildSelectionsTab(),
            _buildTextTab(context),
            _buildWebTab(),
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
                ElevatedButton(
                    onPressed: () {}, child: const Text('Elevated button')),
                const SizedBox(width: 10),
                const ElevatedButton(onPressed: null, child: Text('Disabled')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up),
                    label: const Text('Elevated button icon')),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.thumb_up),
                    label: const Text('Disabled')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                FilledButton(
                    onPressed: () {}, child: const Text('Filled button')),
                const SizedBox(width: 10),
                const FilledButton(onPressed: null, child: Text('Disabled')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up),
                    label: const Text('Filled button icon')),
                const SizedBox(width: 10),
                FilledButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.thumb_up),
                    label: const Text('Disabled')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                OutlinedButton(
                    onPressed: () {}, child: const Text('Outlined button')),
                const SizedBox(width: 10),
                const OutlinedButton(onPressed: null, child: Text('Disabled')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up),
                    label: const Text('Outlined button icon')),
                const SizedBox(width: 10),
                OutlinedButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.thumb_up),
                    label: const Text('Disabled')),
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
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up),
                    label: const Text('Text button icon')),
                const SizedBox(width: 10),
                TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.thumb_up),
                    label: const Text('Disabled')),
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

  Widget _buildSelectionsTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Switch enabled'),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Switch disabled',
                  style: TextStyle(color: Colors.grey),
                ),
                Switch(value: false, onChanged: null),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Checkbox enabled'),
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Checkbox disabled', style: TextStyle(color: Colors.grey)),
                Checkbox(value: false, onChanged: null),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Radio 1'),
                Radio(
                  value: 1,
                  groupValue: _selectedRadioValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadioValue = value as int;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Radio 2'),
                Radio(
                    value: 2,
                    groupValue: _selectedRadioValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadioValue = value as int;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Radio 3'),
                Radio(
                    value: 3,
                    groupValue: _selectedRadioValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadioValue = value as int;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Radio disabled',
                    style: TextStyle(color: Colors.grey)),
                Radio(
                    value: 4, groupValue: _selectedRadioValue, onChanged: null),
              ],
            ),
            const Divider(),
            Column(
              children: [
                const Text("Sliders"),
                Slider(
                  activeColor: Colors.purple[900],
                  value: _sliderValue1,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue1 = value;
                    });
                  },
                  min: 0.0,
                  max: 1.0,
                ),
                Slider(
                  activeColor: Colors.purple[900],
                  value: _sliderValue2,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue2 = value;
                    });
                  },
                  min: 0.0,
                  max: 100.0,
                  divisions: 5,
                  label: _sliderValue2.toStringAsFixed(0),
                ),
                Slider(
                  activeColor: Colors.purple[900],
                  value: _sliderValue3,
                  onChanged: null,
                  min: 0.0,
                  max: 1.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextTab(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Display large',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Display medium',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Display small',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Headline large',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Headline medium',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Headline small',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Title large',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Title medium',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Title small',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Label large',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Label medium',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Label small',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Body large',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Body medium',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Body small',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

	  Widget _buildWebTab() {
			return Text('Web tab');
	  }
}
