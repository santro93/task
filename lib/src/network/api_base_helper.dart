import 'package:dio/dio.dart';
import 'package:task/src/network/dio_factory.dart';
import 'package:task/src/network/network_exception.dart';

class ApiBaseHelper {
  DioFactory dioFactory = DioFactory();

////////////////////////    Post method     /////////////////////////////////////////////////////
  Future<Response> post(
      {String? url, Map<String, dynamic>? body, Options? options}) async {
    try {
      final response = await dioFactory.getDio().post(
            url!,
            data: body,
            options: options,
          );
      return _returnResponse(response);
    } on DioException catch (ex) {
      return _returnResponse(ex.response);
    } on Exception {
      throw FetchDataException('No Internet connection');
    }
  }
}

Response _returnResponse(Response? response) {
  switch (response!.statusCode) {
    case 200:
      return response;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
    case 403:
      var responseJson = response.data;
      throw UnauthorisedException(responseJson["message"].toString());
    case 500:
    default:
      throw FetchDataException('Error occurred while Communication with '
          'Server with StatusCode : ${response.statusCode}');
  }
}
