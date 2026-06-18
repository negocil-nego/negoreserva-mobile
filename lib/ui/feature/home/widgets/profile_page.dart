import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ProfileViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        final isAuth = _viewModel.isAuthenticated;
        final name = _viewModel.userName ?? 'Utilizador Visitante';
        final email = _viewModel.userEmail ?? 'Entre na sua conta para mais recursos';

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),

                  // Account Info Area (Header)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.inputBorder),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.primary,
                          child: Text(
                            name.isNotEmpty ? name.substring(0, 1).toUpperCase() : 'U',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.text,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                email,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Settings List Header
                  const Text(
                    'Configurações',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // settings list tiles
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        if (isAuth) ...[
                          ListTile(
                            leading: const Icon(Icons.person_outline, color: AppColors.primary),
                            title: const Text('Gerir perfil'),
                            trailing: const Icon(Icons.chevron_right, size: 20),
                            onTap: () {},
                          ),
                          const Divider(height: 1),
                          ListTile(
                            leading: const Icon(Icons.lock_outline, color: AppColors.primary),
                            title: const Text('Alterar a senha'),
                            trailing: const Icon(Icons.chevron_right, size: 20),
                            onTap: () {},
                          ),
                          const Divider(height: 1),
                          ListTile(
                            leading: const Icon(Icons.payment_outlined, color: AppColors.primary),
                            title: const Text('Pagamentos'),
                            trailing: const Icon(Icons.chevron_right, size: 20),
                            onTap: () {},
                          ),
                          const Divider(height: 1),
                        ],
                        ListTile(
                          leading: const Icon(Icons.privacy_tip_outlined, color: AppColors.primary),
                          title: const Text('Política de privacidade'),
                          trailing: const Icon(Icons.chevron_right, size: 20),
                          onTap: () {},
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.description_outlined, color: AppColors.primary),
                          title: const Text('Termos e condições'),
                          trailing: const Icon(Icons.chevron_right, size: 20),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Auth Button
                  if (isAuth)
                    PrimaryButton(
                      label: 'Terminar Sessão',
                      onPressed: () => _viewModel.logout(),
                    )
                  else
                    PrimaryButton(
                      label: 'Iniciar Sessão',
                      onPressed: () => context.go(Routes.login),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
