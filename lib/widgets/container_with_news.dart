// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/features/detail/screen/detail_screen.dart';

import 'package:news_app/models/data_model.dart';

class ContainerWithNews extends StatelessWidget {
  final List<Articles> data;
  final int index;
  const ContainerWithNews({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, DetailScreen.routeName,
          arguments: data[index]),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 97,
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              data[index].urlToImage ??
                  'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
              scale: 2,
              height: 97,
              width: 116,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/error.jpg',
                height: 97,
                width: 116,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 17),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index].title ?? 'No Title',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    data[index].author ?? 'No author',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    data[index].publishedAt != null
                        ? DateFormat('dd MMMM yyyy')
                            .format(DateTime.parse(data[index].publishedAt!))
                        : 'No Date',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 0,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
