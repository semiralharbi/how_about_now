// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Translation {
  Translation();

  static Translation? _current;

  static Translation get current {
    assert(_current != null,
        'No instance of Translation was loaded. Try to initialize the Translation delegate before accessing Translation.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Translation> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Translation();
      Translation._current = instance;

      return instance;
    });
  }

  static Translation of(BuildContext context) {
    final instance = Translation.maybeOf(context);
    assert(instance != null,
        'No instance of Translation present in the widget tree. Did you add Translation.delegate in localizationsDelegates?');
    return instance!;
  }

  static Translation? maybeOf(BuildContext context) {
    return Localizations.of<Translation>(context, Translation);
  }

  /// `Categories`
  String get homePage_categories {
    return Intl.message(
      'Categories',
      name: 'homePage_categories',
      desc: '',
      args: [],
    );
  }

  /// `Today's tasks: {String}`
  String homePage_todayTasks(Object String) {
    return Intl.message(
      'Today\'s tasks: $String',
      name: 'homePage_todayTasks',
      desc: '',
      args: [String],
    );
  }

  /// `Done: {int} / {double}`
  String homePage_doneTasks(Object int, Object double) {
    return Intl.message(
      'Done: $int / $double',
      name: 'homePage_doneTasks',
      desc: '',
      args: [int, double],
    );
  }

  /// `General`
  String get addTaskPage_generalGroup {
    return Intl.message(
      'General',
      name: 'addTaskPage_generalGroup',
      desc: '',
      args: [],
    );
  }

  /// `Enter new task`
  String get addTaskPage_textFieldLabel {
    return Intl.message(
      'Enter new task',
      name: 'addTaskPage_textFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter new category name`
  String get addTaskCategory_textFieldLabel {
    return Intl.message(
      'Enter new category name',
      name: 'addTaskCategory_textFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add task`
  String get addTaskPage_button {
    return Intl.message(
      'Add task',
      name: 'addTaskPage_button',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get addTaskPage_today {
    return Intl.message(
      'Today',
      name: 'addTaskPage_today',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get generic_ok {
    return Intl.message(
      'Ok',
      name: 'generic_ok',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get generic_reset {
    return Intl.message(
      'Reset',
      name: 'generic_reset',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get generic_new {
    return Intl.message(
      'New',
      name: 'generic_new',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get generic_add {
    return Intl.message(
      'Add',
      name: 'generic_add',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get generic_somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'generic_somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get generic_userNotFound {
    return Intl.message(
      'User not found',
      name: 'generic_userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Check your Internet Connection and try again later`
  String get generic_checkInternetConnection {
    return Intl.message(
      'Check your Internet Connection and try again later',
      name: 'generic_checkInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `This field can't be empty`
  String get generic_fieldCantBeEmpty {
    return Intl.message(
      'This field can\'t be empty',
      name: 'generic_fieldCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `The task has been added`
  String get addTaskPage_successSnackbar {
    return Intl.message(
      'The task has been added',
      name: 'addTaskPage_successSnackbar',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Translation> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Translation> load(Locale locale) => Translation.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
