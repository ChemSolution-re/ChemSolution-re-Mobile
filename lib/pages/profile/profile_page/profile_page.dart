import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../../bloc/profile/profile_page/profile_page_cubit.dart';
import '../../../di/locator.dart';
import '../../../l10n/chem_solution_localizations.dart';
import '../../../resources/app_image_assets.dart';
import '../../../utils/chem_solution_toasts.dart';
import '../../../views/animated_logo.dart';
import '../../../views/chem_solution_app_bar.dart';
import '../../../views/error_view.dart';

class ProfilePage extends StatefulWidget {
  static PageRoute getRoute() {
    return SwipeablePageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => locator<ProfilePageCubit>(),
        child: const ProfilePage._(),
      );
    });
  }

  const ProfilePage._({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfilePageCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    ProfilePageState state,
  ) {
    if (state.status == ProfilePageStatus.error) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilePageCubit, ProfilePageState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return Scaffold(
          appBar: const ChemSolutionAppBar(
            isLeadingIconEnabled: true,
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(ProfilePageState state) {
    switch (state.status) {
      case ProfilePageStatus.loading:
        return const Center(child: AnimatedLogo());
      case ProfilePageStatus.error:
        return ErrorView(onPressed: cubit.loadProfile);
      case ProfilePageStatus.success:
        return _buildSuccessBody(state);
    }
  }

  Widget _buildSuccessBody(ProfilePageState state) {
    final loc = ChemSolutionLocalizations.of(context);
    return Column(
      children: [
        const SizedBox(height: 16),
        _buildTile(
          leading: Icon(
            Icons.email,
            color: Theme.of(context).colorScheme.primary,
            size: 48,
          ),
          title: loc.email,
          value: state.user.userEmail,
        ),
        const SizedBox(height: 16),
        _buildTile(
          leading: Icon(
            Icons.supervised_user_circle_sharp,
            color: Theme.of(context).colorScheme.primary,
            size: 48,
          ),
          title: loc.username,
          value: state.user.userName,
        ),
        const SizedBox(height: 16),
        _buildTile(
          leading: Icon(
            Icons.cake,
            color: Theme.of(context).colorScheme.primary,
            size: 48,
          ),
          title: loc.birthday,
          value: DateFormat('dd.MM.yyyy').format(state.user.dateOfBirth),
        ),
        const SizedBox(height: 16),
        _buildTile(
          leading: Image.asset(
            AppImageAssets.coin,
            width: 48,
          ),
          title: loc.coins,
          value: '${state.user.balance}',
        ),
        const SizedBox(height: 16),
        _buildTile(
          leading: Image.asset(
            AppImageAssets.trophy,
            width: 48,
          ),
          title: loc.birthday,
          value: '${state.user.rating}',
        ),
      ],
    );
  }

  Widget _buildTile({
    required Widget leading,
    required String title,
    required String value,
  }) {
    return ListTile(
      leading: leading,
      title: Text(
        value,
        style: Theme.of(context).textTheme.headline3,
      ),
      subtitle: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
