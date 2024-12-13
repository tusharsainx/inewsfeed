import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_top_headlines_data_model.dart';
import 'package:inewsfeed/modules/homepage/domain/repository/news_repository.dart';
import 'package:inewsfeed/shared/assets_helper.dart';
import 'package:inewsfeed/shared/generic_error_screen.dart';
import 'package:inewsfeed/shared/logger.dart';
import 'package:inewsfeed/shared/network_requester/inf_exception.dart';

class FetchTopHeadlinesNews {
  final NewsRepository _repository;
  FetchTopHeadlinesNews(this._repository);

  Future<NewsTopHeadlinesDataModel> execute(BuildContext context) async {
    try {
      final news = await _repository.getNewsTopHeadlinesDataFromApi();
      await _repository.saveNewsToLocalStorage(news);
      return news;
    } catch (e) {
      logger.e("Exception occurred: $e");
      if (e is SocketException) {
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GenericErrorScreen(
                title: "Network issue!",
                description:
                    "Unable to load latest news. Make sure you are connected to a good internet.",
                imagePath: AssetsHelper.internetDown,
              ),
            ),
          );
        }
      } else if (e is InfException) {
        if (context.mounted) {
          _handleError(e.statusCode, e.msg, context);
        }
      } else {
        logger.e("Unhandled exception: $e");
      }
    }
    return await _repository.getNewsTopHeadlinesDataFromLocal();
  }
}

void _handleError(int statusCode, String statusMsg, BuildContext context) {
  final errorScreenData = _getErrorScreenData(statusCode);
  if (errorScreenData != null && context.mounted) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GenericErrorScreen(
          title: errorScreenData['title']!,
          description: errorScreenData['description']!,
          imagePath: errorScreenData['imagePath']!,
        ),
      ),
    );
  }
  logger.e("Request failed with status: $statusCode, $statusMsg");
}

Map<String, String>? _getErrorScreenData(int statusCode) {
  switch (statusCode) {
    case 500:
      return {
        'title': "Internal Server Error!",
        'description':
            "Something went wrong at our server side. We are currently looking into it. Please try again later.",
        'imagePath': AssetsHelper.serverDown,
      };
    case 503:
      return {
        'title': "Service Unavailable!",
        'description':
            "The server is currently unable to handle the request due to a temporary condition which will be alleviated after some delay.",
        'imagePath': AssetsHelper.serverUnavailable,
      };
    case 429:
      return {
        'title': "Too Many Requests!",
        'description':
            "You have sent too many requests in a short period. Please try again later.",
        'imagePath': AssetsHelper.serverDown,
      };
    case 404:
      return {
        'title': "Not Found!",
        'description':
            "The requested resource could not be found. This might be a temporary or permanent issue.",
        'imagePath': AssetsHelper.serverUnavailable,
      };
    default:
      return null;
  }
}
