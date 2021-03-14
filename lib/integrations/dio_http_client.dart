import 'package:dio/dio.dart';
import 'package:radio_app/abstractions/http_client.dart';

class DioHttpClient implements HttpClient {
  @override
  Future<HttpResponse<T>> get<T>(String url) async {
    var response = await Dio().get(url);
    return HttpResponse(response.data, response.statusCode);
  }
}
