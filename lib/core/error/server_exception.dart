final class ServerException implements Exception {
  final String message;

  ServerException(
      {this.message = 'Unknown error occurred while making request'});
}
