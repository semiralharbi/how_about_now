import 'package:how_about_now/presentation/utils/global_imports.dart';

extension AnimateExtensions on Widget {
  Widget get slideLeft => animate(delay: 200.ms).slideX(end: 0, begin: 2);

  Widget get delay300FadeIn => animate(delay: 300.ms).fadeIn();
}
