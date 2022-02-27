// ignore_for_file: override_on_non_overriding_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_today_astro/bloc/categories_bloc/categories_event.dart';
import 'package:india_today_astro/bloc/categories_bloc/categories_state.dart';
import 'package:india_today_astro/repository/api_repository.dart';

class CategoriesBloc extends Bloc<CategoryEvent, CategoriesState> {
  Repository repository = Repository();
  CategoriesBloc(CategoriesState initialState, this.repository)
      : super(initialState);

  @override
  Stream<CategoriesState> mapEventToState(CategoryEvent event) async* {
    if (event is FetchCategoryEvent) {
      yield CategoriesLoadingStates();
      var response = await repository.getCategory();
      if (response!.data != null) {
        yield CategoriesFetchSuccessStates(response);
      } else {
        yield CategoriesErrorStates();
      }
    }
  }
}
