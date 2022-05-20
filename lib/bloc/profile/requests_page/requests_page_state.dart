part of 'requests_page_cubit.dart';

enum RequestsPageStatus {
  loading,
  error,
  success,
}

class RequestsPageState extends Equatable {
  final RequestsPageStatus status;
  final List<ChemRequest> allRequests;
  final List<ChemRequest> selectedRequests;
  final HandledError error;
  final bool isSearching;

  const RequestsPageState({
    this.status = RequestsPageStatus.loading,
    this.allRequests = const [],
    this.selectedRequests = const [],
    this.error = const HandledError.empty(),
    this.isSearching = false,
  });

  RequestsPageState copyWith({
    RequestsPageStatus? status,
    List<ChemRequest>? allRequests,
    List<ChemRequest>? selectedRequests,
    HandledError? error,
    bool? isSearching,
  }) {
    return RequestsPageState(
      status: status ?? this.status,
      allRequests: allRequests ?? this.allRequests,
      selectedRequests: selectedRequests ?? this.selectedRequests,
      error: error ?? this.error,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object> get props => [
        status,
        allRequests,
        error,
        isSearching,
        selectedRequests,
      ];
}
