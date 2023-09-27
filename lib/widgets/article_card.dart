import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/models/article.dart';

//Card Layout
class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Column(
        children: [
          CardBanner(imageUrl: article.urlToImage),
          CardDetail(
            article: article,
          ),
        ],
      ),
    );
  }
}

class CardBanner extends StatelessWidget {
  final String? imageUrl;
  const CardBanner({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              loadingBuilder: ((context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border, size: 32),
          ),
        )
      ],
    );
  }
}

class CardDetail extends StatelessWidget {
  final Article? article;
  const CardDetail({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            article!.title,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(article!.source),
              const Spacer(),
              const Text('45 Comments'),
            ],
          )
        ],
      ),
    );
  }
}
