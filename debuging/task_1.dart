/*
The application crashes or becomes sluggish after navigating away
from the news list screen multiple times. Memory usage continuously increases. 
*/


class NewsListWidget extends StatefulWidget {
  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = newsService.getNewsStream().listen((news) {
      setState(() {
        newsList.addAll(news);
      });
    });
  }

  @override
  void dispose() {
    super. dispose();
  }
}
