import 'package:dio/dio.dart';
import 'package:radio_app/abstractions/http_client.dart';

class DioHttpClient implements HttpClient {
  final Dio _dioInstance = Dio();

  @override
  Future<HttpResponse<T>> get<T>(String url) async {
    var response = await _dioInstance.get(url);
    return HttpResponse(response.data, response.statusCode);
  }

  @override
  Future<void> addHeaders(Map<String, dynamic> headers) {
    _dioInstance.options.headers = headers;
    return Future.value();
  }
}
