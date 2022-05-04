import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../bloc/main_page/elements_tab/elements_tab_cubit.dart';
import '../../../../di/locator.dart';
import '../../../../utils/chem_solution_toasts.dart';
import '../../../../views/animated_logo.dart';
import '../../../../views/chem_solution_app_bar.dart';
import '../../../../views/empty_view.dart';
import '../../../../views/error_view.dart';
import 'views/element_tile.dart';

enum ElementsTabFields { searching }

class ElementsTab extends StatefulWidget {
  static Widget create() {
    return BlocProvider(
      create: (_) => locator<ElementsTabCubit>(),
      child: const ElementsTab._(),
    );
  }

  const ElementsTab._({Key? key}) : super(key: key);

  @override
  State<ElementsTab> createState() => _ElementsTabState();
}

class _ElementsTabState extends State<ElementsTab> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  ElementsTabCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    ElementsTabState state,
  ) {
    if (state.status == ElementTabStatus.error) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElementsTabCubit, ElementsTabState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return Scaffold(
          appBar: ChemSolutionAppBar(
            isLeadingIconEnabled: false,
            isSearching: state.isSearching,
            onSearchIconPressed: cubit.changeSearching,
            searchingWidget: FormBuilder(
              key: _fbKey,
              child: FormBuilderTextField(
                name: ElementsTabFields.searching.name,
                autofocus: true,
                style: Theme.of(context).textTheme.headline6,
                onChanged: (_) {
                  _fbState?.save();
                  cubit.filter(_fbValue[ElementsTabFields.searching.name]);
                },
              ),
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(ElementsTabState state) {
    switch (state.status) {
      case ElementTabStatus.loading:
        return const Center(child: AnimatedLogo());
      case ElementTabStatus.error:
        return ErrorView(onPressed: cubit.loadElements);
      case ElementTabStatus.success:
        return state.selectedElements.isEmpty
            ? const EmptyView()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return ElementTile(element: state.selectedElements[index]);
                },
                itemCount: state.selectedElements.length,
              );
    }
  }
}
