import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Brand.dart';
import 'package:flutter/material.dart';

class BrandItemWidget extends StatelessWidget {
  Brand brand;

  BrandItemWidget({required this.brand});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: brand.image ?? '',
      placeholder: (context, url) => CircularProgressIndicator(),
    );
  }
}
