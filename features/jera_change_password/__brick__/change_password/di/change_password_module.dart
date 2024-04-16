import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../../recover_password/domain/user_routes.dart';
import '../change_password_view_controller.dart';
import '../change_password_view_model.dart';
import '../use_cases/change_password_use_case.dart';

class ChangePasswordModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<ChangePasswordUseCaseProtocol>(() {
      return ChangePasswordUseCase(routes: ServiceLocator.get<UserRoutesProtocol>());
    });

    ServiceLocator.registerFactory<ChangePasswordProtocol>(() {
      return ChangePassowrdViewModel(
        changePasswordUseCase: ServiceLocator.get<ChangePasswordUseCaseProtocol>(),
      );
    });
  }
}
