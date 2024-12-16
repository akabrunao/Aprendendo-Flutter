import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'add_remove.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarBrandProvider(),
      child: const MyApp(),
    ),
  );
}

class CarBrandProvider extends ChangeNotifier {
  final List<String> _carBrands = [
    'Ford', 'Chevrolet', 'Toyota', 'Honda', 'Hyundai', 'BMW'
  ];

  List<String> get carBrands => List.unmodifiable(_carBrands);

  void addBrand(String brand) {
    _carBrands.add(brand);
    notifyListeners();
  }

  void removeBrand(String brand) {
    _carBrands.remove(brand);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const CarTabsPage(),
        ),
        GoRoute(
          path: '/add',
          builder: (context, state) => const AddBrandPage(),
        ),
        GoRoute(
          path: '/remove',
          builder: (context, state) => const RemoveBrandPage(),
        ),
      ],
    ),
  ],
);

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Explorer'),
      ),
      body: child,
    );
  }
}

class CarTabsPage extends StatelessWidget {
  const CarTabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: 'Brands'),
              Tab(icon: Icon(Icons.electric_car), text: 'Electric'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CarBrandsTab(),
            ElectricCarsTab(),
            SettingsTab(),
          ],
        ),
        floatingActionButton: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ExpandableAddFAB(),
            SizedBox(width: 10),
            ExpandableRemoveFAB(),
          ],
        ),
      ),
    );
  }
}

class CarBrandsTab extends StatelessWidget {
  const CarBrandsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final carBrands = context.watch<CarBrandProvider>().carBrands;

    return ListView.builder(
      itemCount: carBrands.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.directions_car),
          title: Text(carBrands[index]),
        );
      },
    );
  }
}

class ElectricCarsTab extends StatelessWidget {
  const ElectricCarsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Explore electric cars here!', style: TextStyle(fontSize: 18)),
    );
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings', style: TextStyle(fontSize: 18)),
    );
  }
}



class ExpandableAddFAB extends StatelessWidget {
  const ExpandableAddFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.directions_car),
          label: 'Add Car Brand',
          onTap: () => context.push('/add'), // Navega para a página de adicionar
        ),
      ],
    );
  }
}

class ExpandableRemoveFAB extends StatelessWidget {
  const ExpandableRemoveFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.remove,
      activeIcon: Icons.close,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.directions_car),
          label: 'Remove Car Brand',
          onTap: () => context.push('/remove'), // Navega para a página de remover
        ),
      ],
    );
  }
}