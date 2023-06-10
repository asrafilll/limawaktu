import 'package:flutter/material.dart';
import 'package:limawaktu/services/city_services.dart';

// Implement a search form now to search and select the city before get the prayTime

class SearchForm extends SearchDelegate {
  final CityServices service = CityServices();
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.close),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: service.getCities(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(snapshot.data![index].nama),
            ),
            itemCount: snapshot.data!.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
