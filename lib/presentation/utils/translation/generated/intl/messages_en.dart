// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(int, double) => "Done: ${int} / ${double}";

  static String m1(String) => "Category: ${String}";

  static String m2(String) => "Today\'s tasks: ${String}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addTaskCategory_textFieldLabel": MessageLookupByLibrary.simpleMessage("Enter new category name"),
        "addTaskPage_button": MessageLookupByLibrary.simpleMessage("Add task"),
        "addTaskPage_generalGroup": MessageLookupByLibrary.simpleMessage("General"),
        "addTaskPage_successSnackbar": MessageLookupByLibrary.simpleMessage("The task has been added"),
        "addTaskPage_textFieldLabel": MessageLookupByLibrary.simpleMessage("Enter new task"),
        "addTaskPage_today": MessageLookupByLibrary.simpleMessage("Today"),
        "generic_add": MessageLookupByLibrary.simpleMessage("Add"),
        "generic_checkInternetConnection":
            MessageLookupByLibrary.simpleMessage("Check your Internet Connection and try again later"),
        "generic_fieldCantBeEmpty": MessageLookupByLibrary.simpleMessage("This field can\'t be empty"),
        "generic_new": MessageLookupByLibrary.simpleMessage("New"),
        "generic_ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "generic_reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "generic_somethingWentWrong": MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "generic_userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
        "homePage_categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "homePage_doneTasks": m0,
        "homePage_taskCategory": m1,
        "homePage_todayTasks": m2
      };
}
