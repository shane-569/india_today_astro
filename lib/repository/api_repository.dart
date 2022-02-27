// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:india_today_astro/model/response_model/categories_response_model/categories_response_model.dart';
import 'package:india_today_astro/repository/api_constants.dart';
import 'package:india_today_astro/repository/api_provider.dart';

class Repository {
  ApiProvider apiProvider = ApiProvider();
  Future<CategoriesResponseModel?> getCategory() async {
    print("check get popup");
    var response;
    try {
      response = await apiProvider.get(ApiConstants.categoryURL);
      return CategoriesResponseModel.fromJson(response);
    } catch (e, stacktrace) {
      print("checking the exception");
      print(stacktrace.toString());
      rethrow;
    }
  }
}
