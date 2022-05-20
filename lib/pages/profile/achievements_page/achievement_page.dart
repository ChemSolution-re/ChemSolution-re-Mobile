import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../../../di/locator.dart';
import '../../../../utils/chem_solution_toasts.dart';
import '../../../../views/animated_logo.dart';
import '../../../../views/chem_solution_app_bar.dart';
import '../../../../views/empty_view.dart';
import '../../../../views/error_view.dart';
import '../../../bloc/profile/achievement_page/achievement_page_cubit.dart';
import 'view/achievement_tile.dart';

enum AchievementsPageFields { searching }

class AchievementsPage extends StatefulWidget {
  static PageRoute getRoute() {
    return SwipeablePageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => locator<AchievementsPageCubit>(),
        child: const AchievementsPage._(),
      );
    });
  }

  const AchievementsPage._({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  AchievementsPageCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    AchievementsPageState state,
  ) {
    if (state.status == AchievementsPageStatus.error) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AchievementsPageCubit, AchievementsPageState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return Scaffold(
          appBar: ChemSolutionAppBar(
            isLeadingIconEnabled: true,
            isSearching: state.isSearching,
            onSearchIconPressed: cubit.changeSearching,
            searchingWidget: FormBuilder(
              key: _fbKey,
              child: FormBuilderTextField(
                name: AchievementsPageFields.searching.name,
                autofocus: true,
                style: Theme.of(context).textTheme.headline6,
                onChanged: (_) {
                  _fbState?.save();
                  cubit.filter(_fbValue[AchievementsPageFields.searching.name]);
                },
              ),
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(AchievementsPageState state) {
    switch (state.status) {
      case AchievementsPageStatus.loading:
        return const Center(child: AnimatedLogo());
      case AchievementsPageStatus.error:
        return ErrorView(onPressed: cubit.loadAchievements);
      case AchievementsPageStatus.success:
        return state.selectedAchievements.isEmpty
            ? const EmptyView()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return AchievementTile(
                    achievement: state.selectedAchievements[index],
                  );
                },
                itemCount: state.selectedAchievements.length,
              );
    }
  }
}
