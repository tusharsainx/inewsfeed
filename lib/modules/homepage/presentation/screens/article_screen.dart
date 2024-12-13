import 'package:flutter/material.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_article_data_model.dart';
import 'package:inewsfeed/shared/custom_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({
    super.key,
    required this.model,
  });

  final NewsArticleDataModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Article Detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Article Title
                Text(
                  model.title ?? "No Title Available",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Article Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: media.size.width - 40,
                    height: 200,
                    child: CustomNetworkImage(
                      imageUrl: model.urlToImage ?? "",
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Article Content
                Text(
                  model.content ?? model.description ?? "Content not available",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 30),

                // Source and Author
                Text(
                  "Source: ${model.source?.name ?? "Unknown"}",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Author: ${model.author ?? "Anonymous"}",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),

                // Link to Full Article
                if (model.url != null)
                  SizedBox(
                    height: 50,
                    width: media.size.width - 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          theme.colorScheme.primary,
                        ),
                      ),
                      onPressed: () async {
                        final url = Uri.parse(model.url!);

                        await launchUrl(url);
                        // } else {
                        //   if (context.mounted) {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(
                        //         content: const Text("Could not launch URL"),
                        //         backgroundColor: theme.colorScheme.error,
                        //       ),
                        //     );
                        // }
                        // }
                      },
                      child: Text(
                        "Read Complete Article",
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
