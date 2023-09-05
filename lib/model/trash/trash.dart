import 'package:freezed_annotation/freezed_annotation.dart';

part 'trash.freezed.dart';
part 'trash.g.dart';

@freezed
class Trash with _$Trash {
  const factory Trash({
    required int id,
    required String name,
    required String? iconUrl,
  }) = _Trash;
  factory Trash.fromJson(Map<String, dynamic> json) => _$TrashFromJson(json);
}
