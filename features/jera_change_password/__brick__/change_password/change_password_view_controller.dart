abstract class ChangePasswordProtocol extends ChangePasswordViewModelProtocol {
  VoidCallback? onTapBack;
  VoidCallback? onRemoveFocus;
  VoidCallback? onSuccessChangePassword;
  ValueChanged<String>? onFailureChangePassword;
}

class ChangePasswordViewController extends StatefulWidget {
  const ChangePasswordViewController({super.key});

  @override
  State<ChangePasswordViewController> createState() => _ChangePasswordViewControllerState();
}

class _ChangePasswordViewControllerState extends State<ChangePasswordViewController> {
  final viewModel = ServiceLocator.get<ChangePasswordProtocol>();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return ChangePasswordView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onTapBack = () {
      // TODO: Implementar callback
    };

    viewModel.onRemoveFocus = () {
      FocusScope.of(context).unfocus();
    };

    viewModel.onSuccessChangePassword = () {
      // TODO: Implementar callback
    };

    viewModel.onFailureChangePassword = (errorMessage) {
      // TODO: Implementar callback
    };
  }
}
