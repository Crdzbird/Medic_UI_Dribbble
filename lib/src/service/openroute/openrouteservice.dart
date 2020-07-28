import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medical_app/src/models/mapbox/openroute_model.dart';
import 'package:medical_app/src/service/openroute/base_route_service.dart';
import 'package:medical_app/src/service/openroute/openroute_api_client.dart';

class OpenRouteService extends BaseRouteAPIService<OpenRouteResponse> {
  final String apiUrl =
      'https://api.openrouteservice.org/v2/directions/driving-car';
  final String apiKey =
      '5b3ce3597851110001cf62489d3b6706de0147a18ffc79c553a45cd6';
  http.Client client;

  OpenRouteService() {
    client = OpenRouteApiClient(apiKey);
  }

  @override
  Future<OpenRouteResponse> getRoute(
      String startingPoint, String endingPoint) async {
    var response =
        await client.get('$apiUrl?start=$startingPoint&end=$endingPoint');
    var responseBody = utf8.decode(response.bodyBytes);
    return OpenRouteResponse.fromJson(json.decode(responseBody));
  }
}
