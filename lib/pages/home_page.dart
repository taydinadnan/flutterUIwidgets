import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/models/article.dart';
import 'package:flutter_ui_widgets/widgets/article_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleCard(article: articles[index]);
      },
    );
  }
}
