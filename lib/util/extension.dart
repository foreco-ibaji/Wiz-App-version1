extension MoneyWithComma on String {
  static RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  /// 1000 -> 1,000 형식으로 변환해주는 확장함수
  String transformMoneyFormat() {
    return replaceAllMapped(regex, (Match match) => "${match[0]},");
  }
}
