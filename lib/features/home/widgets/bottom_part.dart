import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/data_bloc.dart';
import 'package:news_app/models/data_model.dart';
import 'package:news_app/widgets/container_with_news.dart';

class BottomPart extends StatefulWidget {
  const BottomPart({super.key});

  @override
  State<BottomPart> createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  List<Articles> _currentArticles = [];

  @override
  void initState() {
    context.read<DataBloc>().getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: BlocConsumer<DataBloc, DataState>(
        listener: (context, state) {
          if (state is DataAllState) {
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Featured Stories',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                ...List.generate(
                    _currentArticles.take(30).length,
                    (index) =>
                        ContainerWithNews(data: _currentArticles, index: index)),
              ],
            );
          }
        },
      ),
    );
  }
}
