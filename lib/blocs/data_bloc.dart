import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/data_model.dart';
import 'package:news_app/services/data_service.dart';
import 'package:http/http.dart' as http;

class DataBloc extends Cubit<DataState> {
  DataBloc() : super(DataLoadingState());

  Future<void> getAllNews() async {
    try {
      final allArticle = await DataService.getAllNews();
      emit(DataAllState(allArticle));
    } on http.Response catch (e) {
      if (e.statusCode == 403) {
        emit(DataErrorState('You are not authorized to access this resource.'));
      } else {
        emit(DataErrorState('An error occurred while fetching the data.'));
      }
    } catch (e) {
      emit(DataErrorState('An unknown error $e'));
    }
  }

  Future<void> getCategoryNews(String category) async {
    try {
      final categoryArticle = await DataService.getNewsCategories(category);
      emit(DataCategoryState(categoryArticle));
    } on http.Response catch (e) {
      if (e.statusCode == 403) {
        emit(DataErrorState('You are not authorized to access this resource.'));
      } else {
        emit(DataErrorState('An error occurred while fetching the data.'));
      }
    } catch (e) {
      emit(DataErrorState('An unknown error $e'));
    }
  }

  Future<void> sortDate(bool newest) async {
    try {
      final DataState currentState = state;
      if (currentState is DataAllState) {
        final List<Articles> allArticle =
            List<Articles>.from(currentState.allArticle);
        if (newest) {
          allArticle.sort(
            (a, b) => a.publishedAt!.compareTo(b.publishedAt!),
          );
        } else {
          allArticle.sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
        }
        emit(DataAllState(allArticle));
      }
    } on http.Response catch (e) {
      if (e.statusCode == 403) {
        emit(DataErrorState('You are not authorized to access this resource.'));
      } else {
        emit(DataErrorState('An error occurred while fetching the data.'));
      }
    } catch (e) {
      emit(DataErrorState('An unknown error $e'));
    }
  }

  Future<void> searchData(String input) async {
    final List<Articles> results = [];
    try {
      final allArticle = await DataService.getAllNews();
      for (Articles article in allArticle) {
        if (article.title != null &&
            article.title!.toLowerCase().contains(input.toLowerCase())) {
          results.add(article);
        } else if (article.author != null &&
            article.author!.toLowerCase().contains(input)) {
          results.add(article);
        } else if (article.source?.name != null &&
            article.source!.name!.toLowerCase().contains(input)) {
          results.add(article);
        }
      }
      emit(DataAllState(results));
    } catch (e) {
      emit(DataErrorState('An unknow error $e'));
    }
  }
}

abstract class DataState {}

class DataLoadingState extends DataState {}

class DataAllState extends DataState {
  final List<Articles> allArticle;
  DataAllState(this.allArticle);
}

class DataCategoryState extends DataState {
  final List<Articles> categoryArticle;
  DataCategoryState(this.categoryArticle);
}

class DataErrorState extends DataState {
  final String message;
  DataErrorState(this.message);
}
