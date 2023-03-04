// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/color.dart';

import 'package:news_app/models/data_model.dart';

class TopPart extends StatelessWidget {
  final Articles article;
  const TopPart({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          article.urlToImage ??
              'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
          scale: 2,
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            'assets/error.jpg',
            height: 95,
            width: 116,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.chevron_left),
            iconSize: 50,
            color: primary,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? 'No Title',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 10),
              Text(
                article.publishedAt != null
                    ? DateFormat('dd MMMM')
                        .format(DateTime.parse(article.publishedAt!))
                    : 'Tidak Ada Tanggal',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
