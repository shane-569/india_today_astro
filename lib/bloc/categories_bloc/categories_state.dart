import 'package:equatable/equatable.dart';
import 'package:india_today_astro/model/response_model/categories_response_model/categories_response_model.dart';

class CategoriesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoriesInitialStates extends CategoriesState {}

class CategoriesLoadingStates extends CategoriesState {}

// ignore: must_be_immutable
class CategoriesFetchSuccessStates extends CategoriesState {
  CategoriesResponseModel? categoriesResponseModel;
  CategoriesFetchSuccessStates(this.categoriesResponseModel);
}

class CategoriesErrorStates extends CategoriesState {
  String? message;
  CategoriesErrorStates({this.message});
}
