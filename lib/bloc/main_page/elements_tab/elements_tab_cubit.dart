import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/chem_element.dart';
import '../../../models/handled_error.dart';
import '../../../services/elements_service.dart';
import '../../base_cubit.dart';

part 'elements_tab_state.dart';

@injectable
class ElementsTabCubit extends BaseCubit<ElementTabState> {
  final ElementsService _elementsService;

  ElementsTabCubit(
    this._elementsService,
  ) : super(const ElementTabState()) {
    loadElements();
  }

  @override
  void handleError(HandledError error) {
    emit(state.copyWith(
      error: error,
      status: ElementTabStatus.error,
    ));
  }

  Future<void> loadElements() async {
    emit(state.copyWith(status: ElementTabStatus.loading));

    await makeErrorHandledCall(() async {
      final elements = await _elementsService.getAllElements();
      emit(state.copyWith(
        elements: elements,
        status: ElementTabStatus.success,
      ));
    });
  }
}
