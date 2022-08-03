class GroupApiException implements Exception {
  
  String message;
  GroupApiException({this.message = 'Something went wrong'}) {
    message = 'Api Exception: $message';
  }

  @override
  String toString() {
    return message;
  }
}