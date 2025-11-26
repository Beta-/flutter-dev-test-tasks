/*
The article detail screen crashes when trying to load a specific article. 
*/

final newsDetailProvider = FutureProvider<NewsArticle>((ref, String articleId) async {
  return await newsService.fetchArticleDetail(articleId);
});

class NewsDetailScreen extends ConsumerWidget {
  final String articleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final article = ref.watch(newsDetailProvider(articleId)); // Error!
    // ...
  }
}
