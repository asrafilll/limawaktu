import 'package:flutter/material.dart';
import 'package:limawaktu/models/city.dart';
import 'package:limawaktu/services/city_services.dart';

// Implement a search form now to search and select the city before get the prayTime

class SearchForm extends SearchDelegate {
  final CityServices service = CityServices();

  final Function(String cityId) onCitySelected;
  SearchForm({required this.onCitySelected});

  List<CityModel> data = [];
  void getData() async {
    data = await service.getCities();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.chevron_left),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    getData();
    List<CityModel> suggestions = data.where((data) {
      final result = data.nama.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return FutureBuilder(
      future: service.getCities(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                query.isEmpty
                    ? query = snapshot.data![index].nama
                    : query = suggestions[index].nama;

                String cityId = query.isEmpty
                    ? snapshot.data![index].id
                    : suggestions[index].id;
                onCitySelected(cityId);
                close(context, suggestions[index].nama);
              },
              title: query.isEmpty
                  ? Text(snapshot.data![index].nama)
                  : Text(suggestions[index].nama),
            ),
            itemCount:
                query.isEmpty ? snapshot.data!.length : suggestions.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
