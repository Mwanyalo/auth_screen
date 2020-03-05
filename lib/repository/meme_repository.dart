import 'package:Memes/networking/ApiProvider.dart';
import 'package:Memes/models/memes_response.dart';
import 'dart:async';

class MemeRepository {
  ApiProvider _provider = ApiProvider();

  Future<MemeResponse> fetchMemes() async {
    final response = await _provider.get("get_memes");
    return MemeResponse.fromJson(response);
  }
}
