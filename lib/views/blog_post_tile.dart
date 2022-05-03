import 'package:flutter/material.dart';

import '../di/locator.dart';
import '../l10n/chem_solution_localizations.dart';
import '../models/blog_post/blog_post.dart';
import '../pages/blog_post_page/blog_post_page.dart';
import '../services/preferences_service.dart';
import '../themes/main_theme.dart';

class BlogPostTile extends StatelessWidget {
  final BlogPost post;

  const BlogPostTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  bool get isLoggedIn => locator<PreferencesService>().isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: MainTheme.color(context).blogPostTileBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImage(),
          const SizedBox(height: 16),
          _buildTitleRow(context)
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        post.image,
        height: 240,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          post.title,
          style: Theme.of(context).textTheme.headline2,
        ),
        TextButton(
          onPressed: !post.isLocked || isLoggedIn
              ? () => Navigator.of(context).push(
                    BlogPostPage.getRoute(post),
                  )
              : null,
          child: Text(
            ChemSolutionLocalizations.of(context).readMore,
          ),
        )
      ],
    );
  }
}
