import 'package:http/http.dart';

class OpenRouteApiClient extends BaseClient {
  final String apiKey;
  Client _inner;

  OpenRouteApiClient(this.apiKey) {
    _inner = Client();
  }

  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['Authorization'] = apiKey;
    request.headers['Content-Type'] = 'application/json';
    return _inner.send(request);
  }
}
