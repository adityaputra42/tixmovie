part of 'shared.dart';

extension StringExtensions on String {
  bool isDigit(int index) => codeUnitAt(index) >= 48 && codeUnitAt(index) <= 57;
}
