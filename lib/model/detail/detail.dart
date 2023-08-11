import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail.freezed.dart';
part 'detail.g.dart';

@freezed
class Detail with _$Detail {
  const factory Detail({
    required String imgUrl,
    required String trashName,
    String? disposalMethod,
  }) = _Detail;
  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
