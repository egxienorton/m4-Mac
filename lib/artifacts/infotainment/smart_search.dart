import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:routemaster/routemaster.dart';

// App Features Map (outside of any class)
final Map<String, String> _appFeatures = {
  'Calculator': '/calculatorLauncher', // Replace with your actual route
  'FlashCards': '/flashCardsLauncher', // Replace with your actual route
  // Add other app features and their routes here
};

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchState {
  final List<String> suggestions;
  final String? searchQuery;
  final List<dynamic>? searchResults;

  SearchState({
    required this.suggestions,
    this.searchQuery,
    this.searchResults,
  });

  SearchState copyWith({
    List<String>? suggestions,
    String? searchQuery,
    List<dynamic>? searchResults,
  }) {
    return SearchState(
      suggestions: suggestions ?? this.suggestions,
      searchQuery: searchQuery ?? this.searchQuery,
      searchResults: searchResults ?? this.searchResults,
    );
  }
}

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier()
      : super(
          SearchState(
            suggestions: [],
          ),
        );

  final List<String> _dummySuggestions = [
    'Flutter',
    'Dart',
    'Android',
    'iOS',
    'Web Development',
    'How to create a Flutter app',
    'What is the difference between Dart and JavaScript?',
    'Weather app in Flutter',
  ];

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
    _filterSuggestions(query);
  }

  void _filterSuggestions(String query) {
    if (query.isEmpty) {
      state = state.copyWith(suggestions: _dummySuggestions);
    } else {
      final filteredSuggestions = _dummySuggestions
          .where((suggestion) =>
              suggestion.toLowerCase().contains(query.toLowerCase()))
          .toList();
      state = state.copyWith(suggestions: filteredSuggestions);
    }
  }

  Future<void> searchWithAPI(String query) async {
    if (query.isEmpty) {
      return;
    }

    try {
      // Simulate Google-like API request (replace with actual API call)
      final response =
          await http.get(Uri.parse('https://api.example.com/search?q=$query'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Process the search results
        final searchResults = data['results'];
        state = state.copyWith(searchResults: searchResults);
      } else {
        // Handle errors
        print('Search API request failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during search API call: $e');
    }
  }

  void navigateToFeature(String featureName) {
    final route = _appFeatures[featureName];
    if (route != null) {
      // Routemaster.of(context).push(route);
    } else {
      print('Route not found for feature: $featureName');
    }
  }
}

class SmartSearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);
    final searchController = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search or Ask Gemini...',
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () {
                  if (searchController.text.isNotEmpty) {
                    ref
                        .read(searchProvider.notifier)
                        .searchWithAPI(searchController.text);
                    Routemaster.of(context).push('/search_results');
                  }
                },
                icon: Icon(Icons.arrow_forward),
              ),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              searchController.text =
                  value; // Update the TextField as the user types
              ref.read(searchProvider.notifier).updateSearchQuery(value);
            },
            onSubmitted: (value) {
              ref.read(searchProvider.notifier).searchWithAPI(value);
            },
          ),
          if (searchState.searchQuery != null &&
              searchState.searchQuery!.isNotEmpty)
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: searchState.suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = searchState.suggestions[index];
                  return ListTile(
                    title: Text(suggestion),
                    onTap: () {
                      searchController.text = suggestion;
                      ref
                          .read(searchProvider.notifier)
                          .updateSearchQuery(suggestion);
                    },
                  );
                },
              ),
            ),
          if (searchState.searchResults != null &&
              searchState.searchResults!.isNotEmpty)
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: searchState.searchResults!.length,
                itemBuilder: (context, index) {
                  final result = searchState.searchResults![index];
                  if (_appFeatures.containsKey(result)) {
                    return ListTile(
                      leading: Icon(Icons.apps),
                      title: Text(result),
                      onTap: () {
                        Routemaster.of(context).push(_appFeatures[result]!);
                      },
                    );
                  } else {
                    return ListTile(
                      title: Text(result.toString()),
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}

// ... (Rest of your code for HomeScreenPage, NewsToobar, HomeIcon, XHomeIcon) ...
