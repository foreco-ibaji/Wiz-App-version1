import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_detail.freezed.dart';
part 'search_detail.g.dart';

@freezed
class SearchDetail with _$SearchDetail {
  const factory SearchDetail(
      {required String text, required DateTime dateTime}) = _SearchDetail;
  factory SearchDetail.fromJson(Map<String, dynamic> json) =>
      _$SearchDetailFromJson(json);
}
