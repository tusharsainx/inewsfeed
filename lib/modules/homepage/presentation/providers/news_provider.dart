import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_top_headlines_data_model.dart';
import 'package:inewsfeed/modules/homepage/domain/repository/news_repository.dart';
import 'package:inewsfeed/modules/homepage/presentation/providers/api_provider.dart';
import 'package:inewsfeed/shared/assets_helper.dart';
import 'package:inewsfeed/shared/generic_error_screen.dart';
import 'package:inewsfeed/shared/logger.dart';
import 'package:inewsfeed/shared/network_requester/inf_exception.dart';

class NewsProvider extends ChangeNotifier {
  final NewsRepository newsRepository;
  final ApiProvider<NewsTopHeadlinesDataModel> topHeadlinesNewsProvider;

  NewsProvider(this.newsRepository, this.topHeadlinesNewsProvider);

  void _handleError(int statusCode, String statusMsg, BuildContext context) {
    if (statusCode == 500) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GenericErrorScreen(
            title: "Internal Server Error!",
            description:
                "You should never receive this error because our clever coders catch them all ... but if you are unlucky enough to get one, please report it to us through https://support.spotify.com/us/contact-spotify-support/",
            imagePath: AssetsHelper.serverDown,
          ),
        ),
      );
    } else if (statusCode == 503) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const GenericErrorScreen(
                    title: "Service Unavailable!",
                    description:
                        "The server is currently unable to handle the request due to a temporary condition which will be alleviated after some delay.",
                    imagePath: AssetsHelper.serverUnavailable,
                  )));
    } else if (statusCode == 429) {
      // Too Many Requests - Rate limiting has been applied.
    } else if (statusCode == 404) {
      // Not Found - The requested resource could not be found. This error can be due to a temporary or permanent condition.
    }
    logger.e("Request failed with status: $statusCode, $statusMsg");
  }

  void fetchTopHeadlines(BuildContext context) async {
    try {
      topHeadlinesNewsProvider.setLoading();
      final newsData = await newsRepository.getNewsTopHeadlinesData();
      topHeadlinesNewsProvider.setSuccess(newsData);
    } catch (e) {
      ///get offline data from local store.

      logger.e("exception occurs: $e");
      if (e is SocketException) {
        if (context.mounted) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GenericErrorScreen(
                  title: "Network issue!",
                  description:
                      "We have received Socket Exception, saying host lookup failed, make sure you are connected to good internet.",
                  imagePath: AssetsHelper.internetDown,
                ),
              ));
        }

        ///TODO: show internet down page and then display cached data from local store.
      } else if (e is InfException) {
        topHeadlinesNewsProvider.setError(e);
        if (context.mounted) {
          _handleError(e.statusCode, e.msg, context);
        }
      } else {
        topHeadlinesNewsProvider.setError(e);
        logger.e("unhandled exception: $e");
      }
    }
  }
}
