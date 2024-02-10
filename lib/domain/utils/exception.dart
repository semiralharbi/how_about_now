import 'package:how_about_now/presentation/utils/enums/errors.dart';

class ApiException implements Exception {
  ApiException(this.error);

  Errors error;
}
