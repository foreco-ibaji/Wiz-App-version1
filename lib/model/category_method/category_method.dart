import 'package:freezed_annotation/freezed_annotation.dart';

import '../category/category.dart';
import '../disposal/disposalInfo.dart';

part 'category_method.freezed.dart';
part 'category_method.g.dart';

@freezed
class CategoryMethod with _$CategoryMethod {
  const factory CategoryMethod(
      {required String categoryName,
      required String categoryIcon,
      List<String>? disposalMethod,
      List<String>? remark,
      required DisposalInfo disposalInfo,
      List<Category>? recommendCategories}) = _CategoryMethod;
  factory CategoryMethod.fromJson(Map<String, dynamic> json) =>
      _$CategoryMethodFromJson(json);
}
