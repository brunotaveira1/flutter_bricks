abstract class ChangePasswordViewModelProtocol with ChangeNotifier {
  bool get canSubmit;
  bool get isLoading;
  bool get isPasswordVisible;

  void didTapBack();
  void removeFocus();
  void didTapChangePassword();
  void didTapToggleVisibility();
  void updatePassword(String email);
  void updateConfirmationPassword(String email);
}

class ChangePasswordView extends StatelessWidget {
  final ChangePasswordViewModelProtocol viewModel;

  const ChangePasswordView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: viewModel.didTapBack,
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text('Recuperar Senha'),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (_, __) {
            return GestureDetector(
              onTap: viewModel.removeFocus,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 24,
                        right: 24,
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Spacer(),
                          const Icon(Icons.logo_dev_outlined, size: 128), // TODO: Substituir pela logo do seu app
                          const SizedBox(height: 56),
                          const Text(
                            'Insira sua nova senha abaixo para ter acesso a sua conta novamente!',
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 56),
                          TextFormField(
                            obscureText: viewModel.isPasswordVisible,
                            onChanged: viewModel.updatePassword,
                            cursorColor: Colors.green,
                            decoration: const InputDecoration(
                              hintText: 'Nova senha',
                              contentPadding: EdgeInsets.all(12),
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            obscureText: viewModel.isPasswordVisible,
                            onChanged: viewModel.updateConfirmationPassword,
                            cursorColor: Colors.green,
                            decoration: const InputDecoration(
                              hintText: 'Repita a nova senha',
                              contentPadding: EdgeInsets.all(12),
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Checkbox(
                                value: viewModel.isPasswordVisible,
                                onChanged: (_) => viewModel.didTapToggleVisibility(),
                              ),
                              const Text('Mostrar senha'),
                            ],
                          ),
                          const SizedBox(height: 56),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16),
                            ),
                            onPressed: viewModel.canSubmit ? viewModel.didTapChangePassword : null,
                            child: _buttonChild,
                          ),
                          const SizedBox(height: 16),
                          const Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get _buttonChild {
    if (viewModel.isLoading) {
      return const CircularProgressIndicator();
    }

    return const Text('Redefinir senha');
  }
}
