/*
The filtered news list works but feels sluggish. 
Every time you change the search query or category filter, the entire list rebuilds even though only the filtering logic changes. 
The data fetching also re-triggers unnecessarily. 
Optimize by reducing unnecessary rebuilds and combining the filter logic efficiently.
*/

class NewsFilteredList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsList = ref.watch(newsListProvider); // Watches entire list
    final searchQuery = ref.watch(searchNotifierProvider); // Watches search
    final category = ref.watch(selectedCategoryProvider); // Watches category

    // Every state change rebuilds entire widget
    return newsList.when(
      data: (news) {
        final filtered = news
            .where((article) => article.title.contains(searchQuery))
            .where((article) => article.category == category)
            .toList();
        
        return ListView(
          children: filtered.map((article) => NewsCard(article: article)).toList(),
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => ErrorWidget(error: err),
    );
  }
}
