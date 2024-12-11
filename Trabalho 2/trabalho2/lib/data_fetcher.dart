import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';

class DataFetcher extends StatefulWidget {
  const DataFetcher({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DataFetcherState createState() => _DataFetcherState();
}

class _DataFetcherState extends State<DataFetcher> {
  List<Color> _backgroundColors = []; // Lista para armazenar as cores de fundo

  Future<List<dynamic>> fetchData() async {
    // Espera 2 segundos antes de fazer a requisição
    await Future.delayed(const Duration(seconds: 2));

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: LoadingIndicator(
              indicatorType: Indicator.pacman,
              colors: [Colors.yellow, Colors.blue, Colors.blue],
              strokeWidth: 2,
              pathBackgroundColor: Colors.black,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else {
          final data = snapshot.data;

          // Inicializa a lista de cores com uma cor padrão (branca)
          if (_backgroundColors.isEmpty) {
            _backgroundColors = List<Color>.filled(data!.length, Colors.white);
          }

          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    // Altera a cor de fundo para uma cor diferente ao tocar
                    _backgroundColors[index] = _backgroundColors[index] == Colors.white
                        ? Colors.lightBlueAccent // Cor ao tocar
                        : Colors.white; // Cor padrão
                  });
                },
                child: Container(
                  color: _backgroundColors[index], // Define a cor de fundo do post
                  child: ListTile(
                    title: Text(data![index]['title']),
                    subtitle: Text(data[index]['body']),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
