import 'package:flutter/material.dart';
import 'package:inewsfeed/modules/homepage/presentation/providers/news_provider.dart';
import 'package:inewsfeed/modules/homepage/presentation/screens/article_screen.dart';
import 'package:inewsfeed/shared/custom_network_image.dart';
import 'package:inewsfeed/shared/theme_change_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class NewsHomepage extends StatefulWidget {
  const NewsHomepage({super.key});

  @override
  State<NewsHomepage> createState() => _NewsHomepageState();
}

class _NewsHomepageState extends State<NewsHomepage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      Provider.of<NewsProvider>(context, listen: false)
          .fetchTopHeadlines(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeChangeProvider =
        Provider.of<ThemeChangeProvider>(context, listen: false);
    return RefreshIndicator(
      onRefresh: () async {
        Provider.of<NewsProvider>(context, listen: false)
            .fetchTopHeadlines(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "iNewsFeed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          backgroundColor: theme.colorScheme.primary,
          actions: [
            IconButton(
              onPressed: () {
                themeChangeProvider.setTheme(
                    themeChangeProvider.themeMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light);
              },
              icon: Icon(
                color: theme.colorScheme.onSurface,
                themeChangeProvider.themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
          ],
          // elevation: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Consumer<NewsProvider>(
            builder: (context, newsProvider, child) {
              if (newsProvider.isLoadingTopHeadlines) {
                return const _LoadingState();
              } else {
                return _LoadedState(
                  newsProvider: newsProvider,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 6,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: theme.colorScheme.surfaceContainerHighest,
          highlightColor: theme.colorScheme.surface,
          child: Container(
            height: 200,
            width: media.size.width,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      },
    );
  }
}

class _LoadedState extends StatelessWidget {
  const _LoadedState({required this.newsProvider});
  final NewsProvider newsProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);

    final dateFormatter = DateFormat('MMMM d, yyyy');
    final timeFormatter = DateFormat('hh:mm a');

    if (newsProvider.topHeadlines.articles?.isEmpty ?? true) {
      return Center(
        child: Text(
          "No articles found!",
          style: theme.textTheme.bodyLarge,
        ),
      );
    }

    return ListView.separated(
      itemCount: newsProvider.topHeadlines.articles!.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final article = newsProvider.topHeadlines.articles![index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleScreen(
                  model: article,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
              border: Border.all(
                color: theme.colorScheme.outline.withOpacity(0.3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: SizedBox(
                      height: media.size.width * 0.5,
                      width: media.size.width * 0.4,
                      child: CustomNetworkImage(
                          imageUrl: article.urlToImage ?? ""),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title ?? 'No Title',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Source: ${article.source?.name ?? "Unknown"}",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Published: ${dateFormatter.format(article.publishedAt!)}, ${timeFormatter.format(article.publishedAt!)}",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                        if (article.description != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            article.description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
