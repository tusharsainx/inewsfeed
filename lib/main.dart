import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_article_data_model.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_article_source_data_model.dart';
import 'package:inewsfeed/modules/homepage/data/models/news_top_headlines_data_model.dart';
import 'package:inewsfeed/modules/homepage/domain/repository/news_repository.dart';
import 'package:inewsfeed/modules/homepage/presentation/providers/api_provider.dart';
import 'package:inewsfeed/modules/homepage/presentation/providers/news_provider.dart';
import 'package:inewsfeed/modules/homepage/presentation/screens/homepage_view.dart';
import 'package:inewsfeed/shared/theme_change_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  init();
}

void init() async {
  /// this allows flutter engine to be properly initialized. It is critical for setting up flutter framework and flutter engine binding.
  WidgetsFlutterBinding.ensureInitialized();

  /// this is used for setting up device orientation.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// initialize hive for offline data reterival
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  /// Registering the adapter
  Hive.registerAdapter(NewsTopHeadlinesDataModelAdapter());
  Hive.registerAdapter(NewsArticleSourceDataModelAdapter());
  Hive.registerAdapter(NewsArticleDataModelAdapter());

  /// loading the root widget
  runApp(const Startup());
}

class Startup extends StatelessWidget {
  const Startup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeChangeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ApiProvider<NewsTopHeadlinesDataModel>(),
        ),
        ChangeNotifierProxyProvider<ApiProvider<NewsTopHeadlinesDataModel>,
            NewsProvider>(
          create: (context) => NewsProvider(
            NewsRepository(),
            Provider.of<ApiProvider<NewsTopHeadlinesDataModel>>(
              context,
            ), // NewsProvider for news
          ),
          update: (context, apiProvider, previous) => NewsProvider(
            previous?.newsRepository ?? NewsRepository(),
            apiProvider,
          ),
        ),
      ],
      child: Consumer<ThemeChangeProvider>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Inewsfeed',
          initialRoute: '/',
          themeMode: Provider.of<ThemeChangeProvider>(context).themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.purple,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.grey,
          ),
          routes: {
            "/": (context) => const NewsHomepage(),
          },
        ),
      ),
    );
  }
}
