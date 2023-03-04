import 'package:flutter/material.dart';
import 'package:news_app/features/search/screen/search_screen.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: TextField(
        autofocus: false,
        decoration: const InputDecoration(
          hintText: 'Search for News',
          hintStyle: TextStyle(fontWeight: FontWeight.w600),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
          suffixIcon: Icon(Icons.search),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ));
        },
      ),
    );
  }
}
