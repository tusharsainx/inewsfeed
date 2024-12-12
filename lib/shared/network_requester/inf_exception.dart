class InfException implements Exception {
  final int statusCode;
  final String msg;
  const InfException({required this.msg, required this.statusCode});
}
