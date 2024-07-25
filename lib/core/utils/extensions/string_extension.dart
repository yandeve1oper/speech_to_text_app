extension StringExtension on String? {
  String toCapitalize() => '${this?[0].toUpperCase()}${this?.substring(1)}';

  bool get isNullOrEmpty => this == null || (this?.isEmpty ?? true);
}
