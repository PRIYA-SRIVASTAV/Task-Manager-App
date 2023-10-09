class Results<T> {
  Results._();

  factory Results.success(T bannerList) = SuccessState;

  factory Results.error(String foo) = ErrorState;

  factory Results.noInternet(String msg) = NoInternetState;
}

class NoInternetState<T> extends Results<T> {
  NoInternetState(this.msg) : super._();

  final String msg;
}

class ErrorState<T> extends Results<T> {
  ErrorState(this.msg) : super._();

  final String msg;
}

class SuccessState<T> extends Results<T> {
  SuccessState(this.value) : super._();

  final T value;
}
