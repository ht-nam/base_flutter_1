import 'package:test_flutter/models/base.dart';

class Joke extends Base{
  String? type;
  String? setup;
  String? punchLine;

  Joke({int? id,this.type, this.setup, this.punchLine}) : super(id: id);

  Joke.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
      type = json["type"];
      setup = json["setup"];
      punchLine = json["punchline"];
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'setup': setup,
    'punchline': punchLine
  };

  @override
  String toString() {
    return "$id - $type - $setup - $punchLine";
  }
}