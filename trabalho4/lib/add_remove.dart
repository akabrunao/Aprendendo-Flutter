import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class AddBrandPage extends StatefulWidget {
  const AddBrandPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddBrandPageState createState() => _AddBrandPageState();
}

class _AddBrandPageState extends State<AddBrandPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Car Brand')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Car Brand Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newBrand = _controller.text.trim();
                if (newBrand.isNotEmpty) {
                  context.read<CarBrandProvider>().addBrand(newBrand);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Brand'),
            ),
          ],
        ),
      ),
    );
  }
}

class RemoveBrandPage extends StatelessWidget {
  const RemoveBrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carBrands = context.watch<CarBrandProvider>().carBrands;

    return Scaffold(
      appBar: AppBar(title: const Text('Remove Car Brand')),
      body: ListView.builder(
        itemCount: carBrands.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(carBrands[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<CarBrandProvider>().removeBrand(carBrands[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
