import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/data_model.dart';
import 'package:news_app/services/data_service.dart';
import '../constants/error_handling.dart';

class DataBloc extends Cubit<DataState> {
  DataBloc() : super(DataLoadingState());

  Future<void> getAllNews() async {
    try {
      final data = await DataService.getAllNews();
      emit(DataLoadedState(data));
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
  final List<Articles> data;
  DataLoadedState(this.data);
}

class DataErrorState extends DataState {
  final String message;
  DataErrorState(this.message);
}
