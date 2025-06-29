// test the anagram function both manual and built in method


import 'package:test/test.dart';

import '../../example/string/anagram.dart';

void main() {
  group('Anagram Tests', () {
    test('Manual Anagram Test', () {
      String str1 = "listen";
      String str2 = "silent";

      expect(isAnagramManual(str1, str2), true);
    });

    test('Built-in Anagram Test', () {
      String str1 = "triangle";
      String str2 = "integral";

      expect(isAnagramBuiltIn(str1, str2), true);
    });

    test('Not Anagram Test', () {
      String str1 = "hello";
      String str2 = "world";

      expect(isAnagramManual(str1, str2), false);
      expect(isAnagramBuiltIn(str1, str2), false);
    });
  });
}