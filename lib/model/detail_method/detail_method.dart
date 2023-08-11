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
      {int? orderOfTab,
      int? maxNumOfTab,
      String? trashIcon,
      String? titleOfTab,
      List<PlasticInfo>? plasticInfo,
      int? id,
      int? categoryId,
      String? isRecyclable,
      String? trashName,
      List<String>? disposalMethod,
      DisposalInfo? disposalInfo,
      List<String>? remark,
      List<Detail>? examples,
      required List<Trash> recommendTrashes}) = _DetailMethod;
  factory DetailMethod.fromJson(Map<String, dynamic> json) =>
      _$DetailMethodFromJson(json);
}

@freezed
class PlasticInfo with _$PlasticInfo {
  const factory PlasticInfo({
    String? trashIcon,
    int? categoryId,
    String? name,
    List<String>? disposalMethod,
    List<String>? remark,
    List<Detail>? examples,
  }) = _PlasticInfo;
  factory PlasticInfo.fromJson(Map<String, dynamic> json) =>
      _$PlasticInfoFromJson(json);
}
