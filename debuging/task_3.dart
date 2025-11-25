/*
The search bar accepts text input, but the UI doesn't respond to search queries. 
The filtered results don't update.
*/

class SearchNotifier extends StateNotifier<String> {
  SearchNotifier() : super('');

  void updateSearch(String query) {
    log("SEARCH FOR: $query");
  }
}

final searchNotifierProvider = StateNotifierProvider<SearchNotifier, String>((ref) {
  return SearchNotifier();
});

class NewsSearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchNotifierProvider);

    return TextField(
      onChanged: (query) {
        ref.read(searchNotifierProvider. notifier).updateSearch(query);
      },
      decoration: InputDecoration(hintText: 'Search news...'),
    );
  }
}
