import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/data_bloc.dart';
import 'package:news_app/constants/color.dart';
import 'package:news_app/features/home/widgets/search_part.dart';
import 'package:news_app/models/data_model.dart';

import '../widgets/categories_part.dart';
import '../widgets/top_part.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = '/main-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Articles> _currentArticles = [];

  void updateCategory(String category) async {
    if (category == 'All') {
      context.read<DataBloc>().getAllNews('');
    }
    await context.read<DataBloc>().getAllNews(category);
  }

  @override
  void initState() {
    context.read<DataBloc>().getAllNews('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: AppBar(
            primary: false,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 32),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: primary,
                ),
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 32),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-face_171337-2887.jpg'),
                ),
              )
            ],
          ),
        ),
      ),
      body: BlocConsumer<DataBloc, DataState>(
        listener: (context, state) {
          if (state is DataLoadedState) {
            _currentArticles = state.allArticle;
          }
          if (state is DataCategoryState) {
            _currentArticles = state.categoryArticle;
          }
        },
        builder: (context, state) {
          if (state is DataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DataErrorState) {
            return Center(child: Text(state.message));
          } else {
            return ListView(
              children: [
                const TopPart(),
                const SearchPart(),
                CategoriesPart(updateCategory),
                // BottomPart(_currentArticles),
              ],
            );
          }
        },
      ),
    );
  }
}
