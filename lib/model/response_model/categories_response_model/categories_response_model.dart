import 'datum.dart';

class CategoriesResponseModel {
  dynamic? httpStatus;
  dynamic? httpStatusCode;
  dynamic? success;
  dynamic? message;
  dynamic? apiName;
  List<Datum>? data;

  CategoriesResponseModel({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseModel(
      httpStatus: json['httpStatus'] as dynamic?,
      httpStatusCode: json['httpStatusCode'] as dynamic?,
      success: json['success'] as dynamic?,
      message: json['message'] as dynamic?,
      apiName: json['apiName'] as dynamic?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'httpStatus': httpStatus,
        'httpStatusCode': httpStatusCode,
        'success': success,
        'message': message,
        'apiName': apiName,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
