import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibaji/model/expect/expect.dart';
import 'package:ibaji/model/process/process.dart';

part 'motivation.freezed.dart';
part 'motivation.g.dart';

@freezed
class Motivation with _$Motivation {
  const factory Motivation({
    required List<Process> recyclingProcess,
    required List<Expect> time,
    required List<Process> ifYouDoNot,
  }) = _Motivation;
  factory Motivation.fromJson(Map<String, dynamic> json) =>
      _$MotivationFromJson(json);
}
