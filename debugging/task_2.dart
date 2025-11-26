/*
Pull-to-refresh gesture registers visually but the news list doesn't update with fresh data. 
The old cached articles remain displayed. 
*/

final newsListProvider = FutureProvider<List<NewsArticle>>((ref) async {
  return await newsService.fetchNews();
});

class NewsListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsList = ref.watch(newsListProvider);
    
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
      },
      child: newsList.when(
        data: (news) => ListView(...),
        loading: () => CircularProgressIndicator(),
        error: (err, stack) => Text('Error: $err'),
      ),
    );
  }
}
