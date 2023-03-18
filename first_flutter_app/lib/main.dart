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

  bool isCurrentInFavorites() {
    return favoritesSet.contains(current);
  }
}

class MyHomePage extends StatelessWidget {
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

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('A random name:'),
            const SizedBox(
              height: 10,
            ),
            BigCard(pair: pair),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                    icon: Icon(icon),
                    onPressed: () {
                      appState.toggleFavorite();
                    },
                    label: const Text("Favorite")
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                    onPressed: () {
                      appState.getNext();
                    },
                    child: const Text("Next")
                ),
              ],
            ),
          ],
        ),
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
