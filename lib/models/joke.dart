import 'package:test_flutter/models/base.dart';

class Joke extends Base{
  String? type;
  String? setup;
  String? punchline;

  Joke({int? id,this.type, this.setup, this.punchline}) : super(id: id);

  @override
  Joke.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
      type = json["type"];
      setup = json["setup"];
      punchline = json["punchline"];
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'setup': setup,
    'punchline': punchline
  };

  @override
  String toString() {
    return "$id - $type - $setup - $punchline";
  }
}