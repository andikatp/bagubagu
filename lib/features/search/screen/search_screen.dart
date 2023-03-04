import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/data_bloc.dart';
import 'package:news_app/constants/color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const routeName = '/search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    context.read<DataBloc>().getAllNews('');
    super.initState();
  }

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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.zero,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0.3),
                      borderRadius: BorderRadius.circular(30)),
                  hintText: 'Search',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0.7),
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          ...List.generate(, (index) => null)
        ],
      ),
    );
  }
}
