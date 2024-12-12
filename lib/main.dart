import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inewsfeed/modules/homepage/domain_layer/data_model/news_top_headlines_data_model.dart';
import 'package:inewsfeed/modules/homepage/domain_layer/repository/news_repository.dart';
import 'package:inewsfeed/modules/homepage/presentation_layer/providers/api_provider.dart';
import 'package:inewsfeed/modules/homepage/presentation_layer/providers/news_provider.dart';
import 'package:inewsfeed/shared/theme_change_provider.dart';
import 'package:provider/provider.dart';

void main() {
  /// this allows flutter engine to be properly initialized. It is critical for setting up flutter framework and flutter engine binding.
  WidgetsFlutterBinding.ensureInitialized();

  /// this is used for setting up device orientation.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(StartupRoute());
}

class Startup extends StatelessWidget {
  const Startup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeChangeProvider()),
        ChangeNotifierProvider(
            create: (context) => ApiProvider<NewsTopHeadlinesDataModel>()),
        ChangeNotifierProxyProvider(
          create: (context) => NewsProvider(NewsRepository(),Provider.of<ApiProvider<News>>(context)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inewsfeed',
        initialRoute: '/',
        theme: ThemeData.dark(),
        routes: {},
      ),
    );
  }
}
