import 'package:cloud_firestore/cloud_firestore.dart';

class PaginatedResponse<T> {
  final List<T> data;
  final DocumentSnapshot? lastDoc;

  PaginatedResponse({required this.data, this.lastDoc});
}