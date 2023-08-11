import 'package:freezed_annotation/freezed_annotation.dart';

part 'process.freezed.dart';
part 'process.g.dart';

@freezed
class Process with _$Process {
  const factory Process({required String title, required String content}) =
      _Process;
  factory Process.fromJson(Map<String, dynamic> json) =>
      _$ProcessFromJson(json);
}
