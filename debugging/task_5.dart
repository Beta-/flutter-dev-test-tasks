/*
When the app first loads, the screen appears blank with no indication that data is being fetched. 
If an error occurs, the user sees nothing—no error message, no retry option. 
Improve the user feedback during async operations.
*/


class NewsList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsListProvider);
    
    return newsAsync.when(
      data: (news) => ListView(
        children: news.map((article) => NewsCard(article: article)).toList(),
      ),
      loading: () => Center(child: Text('Loading...')), 
      error: (error, stack) => SizedBox(), 
    );
  }
}
