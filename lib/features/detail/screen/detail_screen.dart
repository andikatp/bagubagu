import 'package:flutter/material.dart';
import '../widgets/bottom_part.dart';
import 'package:news_app/models/data_model.dart';
import '../widgets/top_part.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';

  const DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Articles article =
        ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          TopPart(article: article),
          BottomPart(article: article),
        ],
      ),
    );
  }
}
