import 'package:flutter/material.dart';
import 'package:inewsfeed/modules/homepage/presentation/providers/news_provider.dart';
import 'package:inewsfeed/shared/status.dart';
import 'package:provider/provider.dart';

class NewsHomepage extends StatelessWidget {
  const NewsHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        switch (newsProvider.topHeadlinesNewsProvider.status.apiStatus) {
          case ApiStatus.loading:
            return const CircularProgressIndicator();
          case ApiStatus.success:
            return Text(
                "data fetched ${(newsProvider.topHeadlinesNewsProvider.status.data!.articles ?? []).length}");
          case ApiStatus.error:
            return const Text("error occurred, unable to fetch data}");
          case ApiStatus.none:
            return const Placeholder();
        }
      },
    );
  }
}
