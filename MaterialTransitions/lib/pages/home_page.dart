import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/models/article.dart';
import 'package:flutter_ui_widgets/pages/article_page.dart';
import 'package:flutter_ui_widgets/repo/article_repo.dart';
import 'package:flutter_ui_widgets/widgets/article_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Article>>? _futureArticles;

  @override
  void initState() {
    super.initState();
    _futureArticles = ArticleRepo().getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
        future: _futureArticles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = snapshot.data![index];
                return Column(
                  children: [
                    OpenContainer(
                      openElevation: 4,
                      transitionType: ContainerTransitionType.fade,
                      tappable: false,
                      closedBuilder:
                          (BuildContext _, VoidCallback openContainer) {
                        return GestureDetector(
                            onTap: () {
                              openContainer();
                              print('Container opening...');
                            },
                            child: ArticleCard(article: article));
                      },
                      openBuilder: (
                        BuildContext _,
                        CloseContainerActionCallback closeContainer,
                      ) {
                        return ArticlePage(
                          article: articles[index],
                        );
                      },
                      onClosed: (result) {
                        print('Container Closed');
                        print('we can reload the list of articles here');
                        print(result);
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                );
                // return GestureDetector(
                //   onTap: () {
                //     Navigator.push<void>(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ArticlePage(
                //           article: article,
                //         ),
                //       ),
                //     );
                //   },
                //   child: ArticleCard(
                //     article: articles[index],
                //   ),
                // );
              },
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: const TextStyle(fontSize: 24),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
