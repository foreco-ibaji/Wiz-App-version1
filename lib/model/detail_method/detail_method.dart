import 'package:freezed_annotation/freezed_annotation.dart';

import '../category_method/category_method.dart';
import '../detail/detail.dart';
import '../disposal/disposalInfo.dart';
import '../trash/trash.dart';

part 'detail_method.freezed.dart';
part 'detail_method.g.dart';

@freezed
class DetailMethod with _$DetailMethod {
  const factory DetailMethod(
      {required int id,
      required String detailType,
      required String name,
      required String disposalMethod,
      required DisposalInfo disposalInfoDto,
      required List<String> remark}) = _DetailMethod;
  factory DetailMethod.fromJson(Map<String, dynamic> json) =>
      _$DetailMethodFromJson(json);
}
