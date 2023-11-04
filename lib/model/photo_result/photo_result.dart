import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibaji/model/expect/expect.dart';
import 'package:ibaji/model/process/process.dart';

part 'photo_result.freezed.dart';
part 'photo_result.g.dart';

@freezed
class PhotoResult with _$PhotoResult {
  const factory PhotoResult({
    required String message,
    required List<ResultDetail> result,
  }) = _PhotoResult;
  factory PhotoResult.fromJson(Map<String, dynamic> json) =>
      _$PhotoResultFromJson(json);
}
@freezed
class ResultDetail with _$ResultDetail {
  const factory ResultDetail({
    required String name,
    required List<int> coordinate,
    required int id,
  }) = _ResultDetail;
  factory ResultDetail.fromJson(Map<String, dynamic> json) =>
      _$ResultDetailFromJson(json);
}
