import 'dart:async';
import 'package:Memes/networking/Response.dart';
import 'package:Memes/repository/meme_repository.dart';
import 'package:Memes/models/memes_response.dart';

class MemeBloc {
  MemeRepository _memeRepository;
  StreamController _memeDataController;

  StreamSink<Response<MemeResponse>> get memeDataSink =>
      _memeDataController.sink;

  Stream<Response<MemeResponse>> get memeDataStream =>
      _memeDataController.stream;

  MemeBloc() {
    _memeDataController = StreamController<Response<MemeResponse>>();
    _memeRepository = MemeRepository();
    fetchMemes();
  }

  fetchMemes() async {
    memeDataSink.add(Response.loading('Getting memes!'));
    try {
      MemeResponse memes = await _memeRepository.fetchMemes();
      memeDataSink.add(Response.completed(memes));
    } catch (e) {
      memeDataSink.add(Response.error(e.toString()));
    }
  }

  dispose() {
    _memeDataController?.close();
  }
}
