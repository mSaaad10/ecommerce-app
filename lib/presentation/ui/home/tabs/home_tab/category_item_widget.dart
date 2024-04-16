import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Category.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  Category category;

  CategoryItemWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: CachedNetworkImage(
        imageUrl: category.image ?? '',
        placeholder: (context, url) => CircularProgressIndicator(),
      ),
    );
  }
}
