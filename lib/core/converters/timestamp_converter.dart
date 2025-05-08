import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object json) {
    if (json is Timestamp) return json;
    if (json is Map<String, dynamic> && json.containsKey('_seconds')) {
      return Timestamp(json['_seconds'], json['_nanoseconds'] ?? 0);
    }
    return Timestamp.fromDate(DateTime.parse(json.toString()));
  }

  @override
  Object toJson(Timestamp object) => object;
}
