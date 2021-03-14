abstract class HttpClient {
  Future<HttpResponse<T>> get<T>(String url);
}

class HttpResponse<T> {
  final T data;
  final int statusCode;

  HttpResponse(
    this.data,
    this.statusCode,
  );

  bool isOk() {
    return statusCode == 200;
  }
}
