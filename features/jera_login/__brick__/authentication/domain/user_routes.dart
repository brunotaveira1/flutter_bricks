import '../../../../../../../api/setup/api_provider.dart';
import '../../../../../../../api/setup/endpoint.dart';{{#has_google}}
import '../models/google_login_request.dart';{{/has_google}}
import '../models/user_request.dart';{{#has_apple}}
import '../models/user_request_ios.dart';{{/has_apple}}

abstract class UserRoutesProtocol {
  void login({
    required String email,
    required String password,
    required Success success,
    required Failure failure,
  });
  {{#has_google}}
  void loginGoogle({
    required GoogleLoginRequest googleRequest,
    Success? success,
    Failure? failure,
  });{{/has_google}}{{#has_apple}}
  void loginApple({
    required UserRequestIOS session,
    required Success success,
    required Failure failure,
  });{{/has_apple}}{{#has_facebook}}
  void loginFacebook({
    required String token,
    required Success success,
    required Failure failure,
  });{{/has_facebook}}
}

class UserRoutes extends UserRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void login({
    required String email,
    required String password,
    required Success success,
    required Failure failure,
  }) {
    final endpoint = Endpoint(
      path: '/users/sign_in',
      method: 'POST',
      data: {
        'email': email,
        'password': password,
      },
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  {{#has_google}}
  @override
  void loginGoogle({required GoogleLoginRequest googleRequest, Success? success, Failure? failure}) {
    final endpoint = Endpoint(
      path: '/users/google_auth',
      method: 'POST',
      data: googleRequest.toMap(),
    );

    _provider.request(success: success, failure: failure, endpoint: endpoint);
  }{{/has_google}}{{#has_apple}}

  @override
  void loginApple({
    required UserRequestIOS session,
    required Success success,
    required Failure failure,
  }) {
    final endpoint = Endpoint(
      method: 'POST',
      data: session.toMap(),
      path: '/users/apple_auth',
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }{{/has_apple}}{{#has_facebook}}

  @override
  void loginFacebook({
    required String token,
    required Success success,
    required Failure failure,
  }) {
    final endpoint = Endpoint(
      method: 'POST',
      path: '/users/facebook_auth',
      data: {'access_token': token},
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }{{/has_facebook}}
}
