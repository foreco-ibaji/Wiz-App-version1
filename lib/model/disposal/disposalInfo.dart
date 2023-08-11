import 'package:freezed_annotation/freezed_annotation.dart';

part 'disposalInfo.freezed.dart';
part 'disposalInfo.g.dart';

@freezed
class DisposalInfo with _$DisposalInfo {
  const factory DisposalInfo(
      {required List<String> days, required String time}) = _DisposalInfo;
  factory DisposalInfo.fromJson(Map<String, dynamic> json) =>
      _$DisposalInfoFromJson(json);
}
