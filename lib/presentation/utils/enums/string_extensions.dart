extension CapitalizeString on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension StringToSnakeCase on String {
  String get toSnakeCase {
    String snakeCaseStr = replaceAllMapped(RegExp('([a-z])([A-Z])'), (Match match) => '${match[1]}_${match[2]}');

    snakeCaseStr = snakeCaseStr.replaceAll(RegExp(r'[\s\-]+'), '_');

    return snakeCaseStr.toLowerCase();
  }
}

extension CategoryTypeExtension on String {
  bool get isToday => toLowerCase() == 'today';

  bool get isAllTasks => toLowerCase() == 'all tasks';
}
