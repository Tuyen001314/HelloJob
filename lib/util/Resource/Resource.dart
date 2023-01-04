class Resource<T> {
  T? data;
  String? message;

  Resource({this.data, this.message});

  factory Resource.loading() {
    return Loading();
  }

  factory Resource.failure(String message) {
    return Failure(message);
  }

  factory Resource.success({required T data, String? message}) {
    return Success(data: data, message: message);
  }

}

class Loading<T> extends Resource<T> {}

class Success<T> extends Resource<T> {
  Success({required T data, String? message})
      : super(data: data, message: message);
}

class Failure<T> extends Resource<T> {
  Failure(String message) : super(message: message);
}
