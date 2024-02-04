import 'package:flutter/material.dart';
import 'package:how_about_now/presentation/utils/translation/generated/l10n.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  Translation get tr => Translation.of(this);

  TextTheme get tht => Theme.of(this).textTheme;

  ThemeData get th => Theme.of(this);
}
