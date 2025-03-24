class CustomException implements Exception {
  String message;
  CustomException(this.message);

  @override
  String toString() {
    return message;
  }
}
