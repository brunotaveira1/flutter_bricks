import 'dart:ui';

import '../../recover_password/domain/user_routes.dart';

typedef Success = VoidCallback;
typedef Failure = void Function(String error);

abstract class ChangePasswordUseCaseProtocol {
  void execute({
    required String password,
    required String passwordConfirmation,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class ChangePasswordUseCase extends ChangePasswordUseCaseProtocol {
  final UserRoutesProtocol routes;

  ChangePasswordUseCase({required this.routes});

  @override
  void execute({
    required String password,
    required String passwordConfirmation,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    routes.changePassword(
      password: password,
      passwordConfirmation: passwordConfirmation,
      success: (response) {
        // TODO: Mapear resposta se necessário
        success?.call();
      },
      failure: (error) {
        failure?.call(error.toString());
      },
    );
  }
}
