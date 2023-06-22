abstract class DataState<T> {
  final T? data;
  final String? error;
  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({T? data}) : super(data: data);
}

class DataFailure<T> extends DataState<T> {
  const DataFailure({String? error}) : super(error: error);
}
