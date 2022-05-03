import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../bloc/auth/login_page/login_page_cubit.dart';
import '../../di/locator.dart';
import '../../l10n/chem_solution_localizations.dart';
import '../../themes/main_theme.dart';
import '../../utils/chem_solution_toasts.dart';
import '../../views/chem_solution_app_bar.dart';

enum AuthFields {
  email,
  password,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static PageRoute getRoute() {
    return SwipeablePageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => locator<LoginPageCubit>(),
        child: const LoginPage(),
      );
    });
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  LoginPageCubit get cubit => context.read();

  void _onChanged(
    BuildContext context,
    LoginPageState state,
  ) {
    switch (state.status) {
      case LoginPageStatus.error:
        ChemSolutionToasts.of(context).showError(
          message: state.error.errorMessage,
        );
        break;
      case LoginPageStatus.success:
        ChemSolutionToasts.of(context).showSuccess(
          message: ChemSolutionLocalizations.of(context).youAreAuth,
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChemSolutionAppBar(),
      body: BlocConsumer<LoginPageCubit, LoginPageState>(
        listener: _onChanged,
        builder: (context, state) {
          return Container(
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
                  _buildPasswordField(state),
                  const SizedBox(height: 16),
                  _buildSignInButton(),
                  const SizedBox(height: 16),
                  _buildRegisterButton(),
                  const SizedBox(height: 16),
                  _buildForgetPasswordButton()
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: AuthFields.email.name,
      decoration: InputDecoration(
        prefixIcon: const Icon(CommunityMaterialIcons.email),
        labelText: ChemSolutionLocalizations.of(context).email,
      ),
      onChanged: (_) => _fbState?.save(),
    );
  }

  Widget _buildPasswordField(LoginPageState state) {
    return FormBuilderTextField(
      name: AuthFields.password.name,
      obscureText: state.obscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(CommunityMaterialIcons.key_chain_variant),
        labelText: ChemSolutionLocalizations.of(context).password,
        suffixIcon: IconButton(
          onPressed: cubit.changeObscureText,
          icon: Icon(
            state.obscureText
                ? CommunityMaterialIcons.eye_off
                : CommunityMaterialIcons.eye,
          ),
        ),
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
