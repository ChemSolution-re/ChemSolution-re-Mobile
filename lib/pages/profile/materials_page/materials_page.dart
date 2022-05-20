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
import '../../../bloc/profile/materials_page/materials_page_cubit.dart';
import 'views/material_tile.dart';

enum MaterialsPageFields { searching }

class MaterialsPage extends StatefulWidget {
  static PageRoute getRoute() {
    return SwipeablePageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => locator<MaterialsPageCubit>(),
        child: const MaterialsPage._(),
      );
    });
  }

  const MaterialsPage._({Key? key}) : super(key: key);

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  MaterialsPageCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    MaterialsPageState state,
  ) {
    if (state.status == MaterialsPageStatus.error) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaterialsPageCubit, MaterialsPageState>(
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
                name: MaterialsPageFields.searching.name,
                autofocus: true,
                style: Theme.of(context).textTheme.headline6,
                onChanged: (_) {
                  _fbState?.save();
                  cubit.filter(_fbValue[MaterialsPageFields.searching.name]);
                },
              ),
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(MaterialsPageState state) {
    switch (state.status) {
      case MaterialsPageStatus.loading:
        return const Center(child: AnimatedLogo());
      case MaterialsPageStatus.error:
        return ErrorView(onPressed: cubit.loadMaterials);
      case MaterialsPageStatus.success:
        return state.selectedMaterials.isEmpty
            ? const EmptyView()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return MaterialTile(
                    material: state.selectedMaterials[index],
                  );
                },
                itemCount: state.selectedMaterials.length,
              );
    }
  }
}
