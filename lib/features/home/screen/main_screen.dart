import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/data_bloc.dart';
import 'package:news_app/constants/color.dart';
import 'package:news_app/features/home/widgets/bottom_part.dart';
import 'package:news_app/features/home/widgets/search_part.dart';

import '../widgets/categories_part.dart';
import '../widgets/top_part.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = '/main-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DataBloc>().getAllNews();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: AppBar(
            primary: false,
            backgroundColor: Colors.white,
            leadingWidth: 0,
            elevation: 0,
            title: Column(
              children: const [
                Text(
                  'Business',
                  style: TextStyle(color: primary),
                ),
                Text(
                  'Insider',
                  style: TextStyle(color: primary),
                ),
              ],
            ),
            actions: const [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-face_171337-2887.jpg'),
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: bloc,
        builder: (context, snapshot) => BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is DataLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DataErrorState) {
              return Center(child: Text(state.message));
            } else if (state is DataLoadedState) {
              return ListView(
                children: [
                  const TopPart(),
                  const SearchPart(),
                  const CategoriesPart(),
                  BottomPart(state),
                ],
              );
            } else {
              return Container(
                color: Colors.red,
              );
            }
          },
        ),
      ),
    );
  }
}
