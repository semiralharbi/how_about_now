import 'package:flutter/material.dart';
import 'package:how_about_now/presentation/utils/enums/context_extensions.dart';

enum Errors {
  userNotFound,
  checkInternetConnection,
  somethingWentWrong,
  fieldCantBeEmpty,
}

extension ErrorsExtension on Errors {
  String errorText(BuildContext context) {
    switch (this) {
      case Errors.checkInternetConnection:
        return context.tr.generic_checkInternetConnection;
      case Errors.somethingWentWrong:
        return context.tr.generic_somethingWentWrong;
      case Errors.userNotFound:
        return context.tr.generic_userNotFound;
      case Errors.fieldCantBeEmpty:
        return context.tr.generic_fieldCantBeEmpty;
      default:
        return context.tr.generic_somethingWentWrong;
    }
  }
}
