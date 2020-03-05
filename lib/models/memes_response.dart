class MemeResponse {
  bool success;

  List<Meme> memes;

  MemeResponse({this.success, this.memes});

  MemeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['memes'] != null) {
      memes = List<Meme>();
      json['memes'].forEach((meme) {
        memes.add(Meme.fromJson(meme));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.memes != null) {
      data['memes'] = this.memes.map((meme) => meme.toJson()).toList();
    }

    return data;
  }
}

class Meme {
  String id;
  String name;
  String url;
  int width;
  int height;
  int boxCount;

  Meme({this.id, this.name, this.url, this.width, this.boxCount});

  Meme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    boxCount = json['box_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['width'] = this.width;
    data['box_count'] = this.boxCount;
    return data;
  }
}
