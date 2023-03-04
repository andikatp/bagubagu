import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/app_bar_part.dart';
import 'package:news_app/features/home/widgets/search_part.dart';
import '../widgets/bottom_part.dart';
import '../widgets/categories_part.dart';
import '../widgets/top_part.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const routeName = '/main-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarPart(),
      body: ListView(
        children: const [
          TopPart(),
          SearchPart(),
          CategoriesPart(),
          BottomPart(),
        ],
      ),
    );
  }
}
