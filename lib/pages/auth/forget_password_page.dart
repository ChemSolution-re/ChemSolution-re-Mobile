import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../bloc/auth/forget_password_page/forget_password_page_cubit.dart';
import '../../di/locator.dart';
import '../../l10n/chem_solution_localizations.dart';
import '../../themes/main_theme.dart';
import '../../utils/chem_solution_toasts.dart';
import '../../views/animated_logo.dart';
import '../../views/chem_solution_app_bar.dart';

enum ForgetPasswordFields {
  email,
}

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  static PageRoute getRoute() {
    return SwipeablePageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => locator<ForgetPasswordPageCubit>(),
        child: const ForgetPasswordPage(),
      );
    });
  }

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  ForgetPasswordPageCubit get cubit => context.read();

  void _onChanged(
    BuildContext context,
    ForgetPasswordPageState state,
  ) {
    switch (state.status) {
      case ForgetPasswordPageStatus.error:
        ChemSolutionToasts.of(context).showError(
          message: state.error.errorMessage,
        );
        break;
      case ForgetPasswordPageStatus.success:
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
      body: BlocConsumer<ForgetPasswordPageCubit, ForgetPasswordPageState>(
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
                    ChemSolutionLocalizations.of(context).restorePassword,
                    style: ChemSolutionAppTheme.text(context).authTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  _buildEmailField(),
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

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: ForgetPasswordFields.email.name,
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

  Widget _buildSignInButton(ForgetPasswordPageState state) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_fbState?.saveAndValidate() ?? false) {
            cubit.restore(
              _fbValue[ForgetPasswordFields.email.name],
            );
          }
        },
        child: state.status == ForgetPasswordPageStatus.loading
            ? const AnimatedLogo(height: 20)
            : Text(ChemSolutionLocalizations.of(context).restore),
      ),
    );
  }
}
