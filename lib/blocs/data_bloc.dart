import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/data_model.dart';
import 'package:news_app/services/data_service.dart';
import '../constants/error_handling.dart';

class DataBloc extends Cubit<DataState> {
  DataBloc() : super(DataLoadingState());

  Future<void> getAllNews(String category) async {
    try {
      if (category.isEmpty) {
        final allArticle = await DataService.getAllNews();
        emit(DataLoadedState(allArticle));
      } else {
        final categoryArticle = await DataService.getNewsCategories(category);
        emit(DataCategoryState(categoryArticle));
      }
    } on FetchErrorMessage catch (e) {
      emit(DataErrorState(e.message));
    } catch (e) {
      emit(DataErrorState('An unknown error $e'));
    }
  }
}

abstract class DataState {}

class DataLoadingState extends DataState {}

class DataLoadedState extends DataState {
  final List<Articles> allArticle;

  DataLoadedState(
    this.allArticle,
  );
}

class DataCategoryState extends DataState {
  final List<Articles> categoryArticle;
  DataCategoryState(this.categoryArticle);
}

class DataErrorState extends DataState {
  final String message;
  DataErrorState(this.message);
}
