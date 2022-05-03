import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../bloc/auth/register_page/register_page_cubit.dart';
import '../../di/locator.dart';
import '../../l10n/chem_solution_localizations.dart';
import '../../themes/main_theme.dart';
import '../../utils/chem_solution_toasts.dart';
import '../../utils/validators.dart';
import '../../views/animated_logo.dart';
import '../../views/chem_solution_app_bar.dart';
import 'forget_password_page.dart';

enum AuthFields {
  email,
  password,
  username,
  birthay,
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static PageRoute getRoute() {
    return SwipeablePageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => locator<RegisterPageCubit>(),
        child: const RegisterPage(),
      );
    });
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  RegisterPageCubit get cubit => context.read();

  void _onChanged(
    BuildContext context,
    RegisterPageState state,
  ) {
    switch (state.status) {
      case RegisterPageStatus.error:
        ChemSolutionToasts.of(context).showError(
          message: state.error.errorMessage,
        );
        break;
      case RegisterPageStatus.success:
        ChemSolutionToasts.of(context).showSuccess(
          message: ChemSolutionLocalizations.of(context).doneSuccessCheckEmail,
        );
        Navigator.of(context).pop();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChemSolutionAppBar(),
      body: BlocConsumer<RegisterPageCubit, RegisterPageState>(
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
                    ChemSolutionLocalizations.of(context).register,
                    style: MainTheme.text(context).authTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  _buildNameField(),
                  const SizedBox(height: 16),
                  _buildBirthdayField(),
                  const SizedBox(height: 16),
                  _buildEmailField(),
                  const SizedBox(height: 16),
                  _buildPasswordField(state),
                  const SizedBox(height: 16),
                  _buildSignInButton(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNameField() {
    return FormBuilderTextField(
      name: AuthFields.username.name,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        labelText: ChemSolutionLocalizations.of(context).username,
        errorMaxLines: 5,
      ),
      onChanged: (_) => _fbState?.save(),
      validator: FormBuilderValidators.required(
        context,
        errorText: ChemSolutionLocalizations.of(context).requiredField,
      ),
    );
  }

  Widget _buildBirthdayField() {
    return FormBuilderDateTimePicker(
      name: AuthFields.birthay.name,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.year,
      lastDate: DateTime.now(),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.cake),
        labelText: ChemSolutionLocalizations.of(context).birthday,
        errorMaxLines: 5,
      ),
      onChanged: (_) => _fbState?.save(),
      validator: FormBuilderValidators.required(
        context,
        errorText: ChemSolutionLocalizations.of(context).requiredField,
      ),
    );
  }

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: AuthFields.email.name,
      decoration: InputDecoration(
        prefixIcon: const Icon(CommunityMaterialIcons.email),
        labelText: ChemSolutionLocalizations.of(context).email,
        errorMaxLines: 5,
      ),
      onChanged: (_) => _fbState?.save(),
      validator: FormBuilderValidators.email(
        context,
        errorText: ChemSolutionLocalizations.of(context).emailValidator,
      ),
    );
  }

  Widget _buildPasswordField(RegisterPageState state) {
    return FormBuilderTextField(
      name: AuthFields.password.name,
      obscureText: state.obscureText,
      validator: passwordValidator(context),
      decoration: InputDecoration(
        prefixIcon: const Icon(CommunityMaterialIcons.key_chain_variant),
        errorMaxLines: 6,
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

  Widget _buildSignInButton(RegisterPageState state) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_fbState?.saveAndValidate() ?? false) {
            cubit.register(
              userEmail: _fbValue[AuthFields.email.name],
              dateOfBirth: _fbValue[AuthFields.birthay.name],
              password: _fbValue[AuthFields.password.name],
              userName: _fbValue[AuthFields.username.name],
            );
          }
        },
        child: state.status == RegisterPageStatus.loading
            ? const AnimatedLogo(height: 20)
            : Text(ChemSolutionLocalizations.of(context).signUp),
      ),
    );
  }
}
