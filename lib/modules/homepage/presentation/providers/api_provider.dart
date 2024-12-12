import 'package:flutter/material.dart';
import 'package:inewsfeed/shared/status.dart';

class ApiProvider<T> extends ChangeNotifier {
  Status<T> _status = Status.none();
  Status<T> get status => _status;
  void setLoading() {
    _status = Status.loading();
    notifyListeners();
  }

  void setSuccess(T data) {
    _status = Status.success(data: data);
    notifyListeners();
  }

  void setError(Object? exception) {
    _status = Status.error(exception: exception);
    notifyListeners();
  }
}
