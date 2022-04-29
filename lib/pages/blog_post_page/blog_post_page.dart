import 'package:flutter/material.dart';

import '../../models/blog_post/blog_post.dart';

class BlogPostPage extends StatefulWidget {
  final BlogPost blogPost;

  const BlogPostPage({
    Key? key,
    required this.blogPost,
  }) : super(key: key);

  @override
  State<BlogPostPage> createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
