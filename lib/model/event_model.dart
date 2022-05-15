import 'package:json_annotation/json_annotation.dart';

class Event {
  final String? title;
  final String? abstract;
  final String? description;
  final String? eventUrl;
  final String? hashTag;

  Event({
    required this.title,
    required this.abstract,
    required this.description,
    required this.eventUrl,
    required this.hashTag,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    print("title: ${json["title"]}");
    print("catch: ${json["catch"]}");
    print("description: ${json["description"]}");
    print("description: ${json["event_url"]}");
    print("hash_tag: ${json["hash_tag"]}");

    return Event(
      title: json["title"],
      abstract: json["catch"],
      description: json["description"],
      eventUrl: json["event_url"],
      hashTag: json["hash_tag"],
    );
  }
}
