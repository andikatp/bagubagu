import 'package:flutter/material.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: TextField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        decoration: const InputDecoration(
          hintText: 'Search for News',
          hintStyle: TextStyle(fontWeight: FontWeight.w600),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
