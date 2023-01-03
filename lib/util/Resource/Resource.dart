class Resource<T> {
  T? data;
  String? message;

  Resource({this.data, this.message});

  static Loading loading() {
    return Loading();
  }

  static Failure failure(String message) {
    return Failure(message);
  }

  factory Resource.success({required T data, String? message}) {
    return Success(data: data, message: message);
  }

}

class Loading extends Resource<void> {}

class Success<T> extends Resource<T> {
  Success({required T data, String? message})
      : super(data: data, message: message);
}

class Failure extends Resource<void> {
  Failure(String message) : super(message: message);
}
