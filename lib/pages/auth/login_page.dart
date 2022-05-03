import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../l10n/chem_solution_localizations.dart';
import '../../themes/main_theme.dart';
import '../../views/chem_solution_app_bar.dart';

enum AuthFields {
  login,
  password,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static PageRoute getRoute() {
    return SwipeablePageRoute(builder: (_) {
      return const LoginPage();
    });
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChemSolutionAppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ChemSolutionLocalizations.of(context).auth,
                style: MainTheme.text(context).authTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              _buildEmailField(),
              const SizedBox(height: 16),
              _buildPasswordField(),
              const SizedBox(height: 16),
              _buildSignInButton(),
              const SizedBox(height: 16),
              _buildRegisterButton(),
              const SizedBox(height: 16),
              _buildForgetPasswordButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: AuthFields.login.name,
      decoration: InputDecoration(
        prefixIcon: const Icon(CommunityMaterialIcons.email),
        labelText: ChemSolutionLocalizations.of(context).email,
      ),
      onChanged: (_) => _fbState?.save(),
    );
  }

  Widget _buildPasswordField() {
    return FormBuilderTextField(
      name: AuthFields.password.name,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(CommunityMaterialIcons.key_chain_variant),
        labelText: ChemSolutionLocalizations.of(context).password,
      ),
      onChanged: (_) => _fbState?.save(),
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(ChemSolutionLocalizations.of(context).signIn),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: Text(ChemSolutionLocalizations.of(context).register),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: Text(
          ChemSolutionLocalizations.of(context).forgetPassword,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
