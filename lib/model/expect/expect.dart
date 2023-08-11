import 'package:freezed_annotation/freezed_annotation.dart';

part 'expect.freezed.dart';
part 'expect.g.dart';

@freezed
class Expect with _$Expect {
  const factory Expect({
    required String imgUrl,
    required String imgName,
  }) = _Expect;
  factory Expect.fromJson(Map<String, dynamic> json) => _$ExpectFromJson(json);
}
