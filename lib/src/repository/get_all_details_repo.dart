import 'dart:io';
import 'package:dio/dio.dart';
import 'package:task/src/network/api_base_helper.dart';
import 'package:task/src/network/api_service_urls.dart';

class GetAllDetailsRepository {
  factory GetAllDetailsRepository() {
    return _this;
  }

  GetAllDetailsRepository._();

  static final GetAllDetailsRepository _this = GetAllDetailsRepository._();

  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  static GetAllDetailsRepository get instance => _this;

  Future<Response> getAllDetails(Map<String, dynamic> body) async {
    try {
      var response = await apiBaseHelper.post(
        url: ApiServiceUrls.getAllDetails,
        body: body,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.cookieHeader: '',
          },
        ),
      );
      return response;
    } catch (error) {
      throw Exception('Failed to load asset locations: $error');
    }
  }
}
