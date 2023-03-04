import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/data_bloc.dart';
import '../../../models/data_model.dart';
import '../../../widgets/container_with_news.dart';

class BottomPart extends StatefulWidget {
  const BottomPart({super.key});

  @override
  State<BottomPart> createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  List<Articles> articles = [];

 @override
  void initState() {
    context.read<DataBloc>().getAllNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<DataBloc, DataState>(
            listener: (context, state) {
              if (state is DataAllState) {
                articles = state.allArticle;
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  ...List.generate(
                    articles.take(30).length,
                    (index) => ContainerWithNews(
                      data: articles,
                      index: index,
                    ),
                  ),
                ],
              );
            },
          );
  }
}