class ChangePassowrdViewModel extends ChangePasswordProtocol {
  String _password = '';
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  String _confirmationPassword = '';

  final ChangePasswordUseCaseProtocol changePasswordUseCase;

  ChangePassowrdViewModel({required this.changePasswordUseCase});

  @override
  bool get isLoading => _isLoading;

  @override
  bool get canSubmit => _password.isNotEmpty && _confirmationPassword.isNotEmpty;

  @override
  bool get isPasswordVisible => _isPasswordVisible;

  @override
  void didTapBack() {
    onTapBack?.call();
  }

  @override
  void didTapChangePassword() {
    _setLoading(true);
    changePasswordUseCase.execute(
      password: _password,
      passwordConfirmation: _confirmationPassword,
      success: () {
        onSuccessChangePassword?.call();
      },
      failure: (error) {
        onFailureChangePassword?.call(error);
      },
      onComplete: () => _setLoading(false),
    );
  }

  @override
  void removeFocus() {
    onRemoveFocus?.call();
  }

  @override
  void updateConfirmationPassword(String email) {
    _confirmationPassword = email;
    notifyListeners();
  }

  @override
  void updatePassword(String email) {
    _password = email;
    notifyListeners();
  }

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }

  @override
  void didTapToggleVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
