import 'package:flutter/material.dart';
import 'package:news_app/constants/color.dart';
import 'package:news_app/features/search/widgets/bottom_part.dart';
import 'package:news_app/features/search/widgets/top_part.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const routeName = '/search-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primary),
        backgroundColor: Colors.white,
        leadingWidth: 80,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        children: const [
          TopPart(),
          BottomPart(),
        ],
      ),
    );
  }
}
