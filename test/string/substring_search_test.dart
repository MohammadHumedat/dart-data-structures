


import '../../example/string/substring_search.dart';

void main() {
  String text = "banana";
  String pattern = "ana";

  print("Enter main string: $text");
  print("Enter substring: $pattern");

  print("\n[Manual]");
  print("Contains: ${containsSubstringManual(text, pattern)}");
  print("First occurrence index: ${firstOccurrenceManual(text, pattern)}");
  print("All occurrences: ${allOccurrencesManual(text, pattern)}");

  print("\n[Built-in]");
  print("Contains: ${containsSubstringBuiltIn(text, pattern)}");
  print("First occurrence index: ${firstOccurrenceBuiltIn(text, pattern)}");
  print("All occurrences: ${allOccurrencesBuiltIn(text, pattern)}");
}