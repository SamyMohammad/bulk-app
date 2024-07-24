import 'package:dio/dio.dart';
import 'package:synchronized/synchronized.dart';

class TokenRefreshInterceptor extends QueuedInterceptor {
  final Dio dio;
  final Lock _lock = Lock();
  String? _accessToken;
  String? _refreshToken;

  TokenRefreshInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Add the current access token to the request
    options.headers['Authorization'] = 'Bearer $_accessToken';
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token has expired, refresh it
      try {
        await _lock.synchronized(() async {
          if (err.requestOptions.headers['Authorization'] !=
              'Bearer $_accessToken') {
            // Token has already been refreshed by another request
            return handler.resolve(await dio.fetch(err.requestOptions
              ..headers['Authorization'] = 'Bearer $_accessToken'));
          }

          // Perform token refresh
          // final newTokens = await _refreshToken();
          // _accessToken = newTokens['access_token'];
          // _refreshToken = newTokens['refresh_token'];

          // Retry the original request with the new token
          err.requestOptions.headers['Authorization'] = 'Bearer $_accessToken';
          return handler.resolve(await dio.fetch(err.requestOptions));
        });
      } catch (e) {
        // If refresh fails, propagate the error
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}
