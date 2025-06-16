
//this file contains implementations of substring search algorithms in Dart
// including both manual implementations and built-in methods for comparison
// The manual implementations are designed to be educational and may not be as efficient as the built-in methods.
// The built-in methods are optimized for performance and should be preferred in production code.

bool containsSubstringManual(String text, String pattern) {// this function checks if the pattern is present in the text using a manual implementation
  return firstOccurrenceManual(text, pattern) != -1;// this function returns the index of the first occurrence of the pattern in the text, or -1 if not found
}

int firstOccurrenceManual(String text, String pattern) {
  if (pattern.isEmpty) return 0;
  if (pattern.length > text.length) return -1;

  for (int i = 0; i <= text.length - pattern.length; i++) {
    int j = 0;
    while (j < pattern.length && text[i + j] == pattern[j]) {
      j++;
    }
    if (j == pattern.length) return i;
  }
  return -1;
}

List<int> allOccurrencesManual(String text, String pattern) {
  List<int> indices = [];
  if (pattern.isEmpty) return List.generate(text.length + 1, (i) => i);

  for (int i = 0; i <= text.length - pattern.length; i++) {
    int j = 0;
    while (j < pattern.length && text[i + j] == pattern[j]) {
      j++;
    }
    if (j == pattern.length) indices.add(i);
  }
  return indices;
}

bool containsSubstringBuiltIn(String text, String pattern) {
  return text.contains(pattern);
}

int firstOccurrenceBuiltIn(String text, String pattern) {
  return text.indexOf(pattern);
}

List<int> allOccurrencesBuiltIn(String text, String pattern) {
  List<int> indices = [];
  int index = text.indexOf(pattern);
  while (index != -1) {
    indices.add(index);
    index = text.indexOf(pattern, index + 1);
  }
  return indices;
}

