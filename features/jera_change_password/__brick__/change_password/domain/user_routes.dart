import 'dart:ui';

import '../../../api/setup/api_provider.dart';
import '../../../api/setup/endpoint.dart';
import '../../../support/utils/service_locator/service_locator.dart';

abstract class UserRoutesProtocol {
  void changePassword({
    required String password,
    required String passwordConfirmation,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class UserRoutes extends UserRoutesProtocol {
  final ApiProvider _provider = ServiceLocator.get<ApiProvider>();
  @override
  void changePassword({
    required String password,
    required String passwordConfirmation,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    final endpoint = Endpoint(
      path: '/users/change_password',
      method: 'POST',
      data: {
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    _provider.request(
      endpoint: endpoint,
      success: success,
      failure: failure,
      onComplete: onComplete,
    );
  }
}
