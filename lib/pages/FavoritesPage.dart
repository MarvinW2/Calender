import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favorite = context.watch<MyAppState>();
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${favorite.favorites.length} favorites:'),
        ),
        for (var fav in favorite.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(fav.asLowerCase),
          ),
      ],
    );
  }
}