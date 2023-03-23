import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'extension/string_extension.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          //colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00FF00)),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(0, 255, 0, 1.0)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favoritesSet = <WordPair>{};

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favoritesSet.contains(current)) {
      favoritesSet.remove(current);
    } else {
      favoritesSet.add(current);
    }

    notifyListeners();
  }

  void removeFavorite(index) {
    favoritesSet.remove(favoritesSet.elementAt(index));
    notifyListeners();
  }

  bool isCurrentInFavorites() {
    return favoritesSet.contains(current);
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favoritesSet.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("No favorites yet."),
        ],
      );
    } else {
      final itemCount = appState.favoritesSet.length;

      return ListView.builder(
        itemCount: itemCount + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            // return the header
            return Column(
              children: [
                const SizedBox(height: 16),
                Text("You have $itemCount favorites:"),
                const SizedBox(height: 10),
              ],
            );
          }
          index -= 1;

          var item = appState.favoritesSet.elementAt(index);
          return FavoriteItem(
              item: item,
              onTab: () {
                appState.removeFavorite(index);
              });
        },
      );
    }
  }

// BuildContext context, int index, Animation<double> animation
}

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.item,
    required this.onTab,
  });

  final WordPair item;
  final GestureTapCallback onTab;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.favorite),
        onTap: onTab,
        title: Text("${item.first.capitalize()} ${item.second.capitalize()}"));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  Widget getPage() {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return page;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  // print('selected: $value');
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: getPage(),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    IconData icon;
    if (appState.isCurrentInFavorites()) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displayMedium
        ?.copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text("${pair.first.capitalize()} ${pair.second.capitalize()}",
            style: style, semanticsLabel: "${pair.first} ${pair.second}"),
      ),
    );
    return Text(pair.asLowerCase);
  }
}
