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
import '../../../bloc/profile/requests_page/requests_page_cubit.dart';
import 'view/request_tile.dart';

enum RequestsPageFields { searching }

class RequestsPage extends StatefulWidget {
  static PageRoute getRoute() {
    return SwipeablePageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => locator<RequestsPageCubit>(),
        child: const RequestsPage._(),
      );
    });
  }

  const RequestsPage._({Key? key}) : super(key: key);

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  RequestsPageCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    RequestsPageState state,
  ) {
    if (state.status == RequestsPageStatus.error) {
      ChemSolutionToasts.of(context).showError(
        message: state.error.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestsPageCubit, RequestsPageState>(
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
                name: RequestsPageFields.searching.name,
                autofocus: true,
                style: Theme.of(context).textTheme.headline6,
                onChanged: (_) {
                  _fbState?.save();
                  cubit.filter(_fbValue[RequestsPageFields.searching.name]);
                },
              ),
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(RequestsPageState state) {
    switch (state.status) {
      case RequestsPageStatus.loading:
        return const Center(child: AnimatedLogo());
      case RequestsPageStatus.error:
        return ErrorView(onPressed: cubit.loadRequests);
      case RequestsPageStatus.success:
        return state.selectedRequests.isEmpty
            ? const EmptyView()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RequestTile(
                      request: state.selectedRequests[index],
                    ),
                  );
                },
                itemCount: state.selectedRequests.length,
              );
    }
  }
}
