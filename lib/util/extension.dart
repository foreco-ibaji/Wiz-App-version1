extension MoneyWithComma on String {
  static RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String transformMoneyFormat() {
    return replaceAllMapped(regex, (Match match) => "${match[0]},");
  }
}
