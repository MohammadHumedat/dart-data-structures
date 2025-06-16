bool isAnagramManual(String str1, String str2) {
  //using manual method

  // Convert both strings to lowercase and remove spaces
  str1 = str1.toLowerCase().replaceAll(' ', '');
  str2 = str2.toLowerCase().replaceAll(' ', '');
  // If lengths are different, they cannot be anagrams
  if (str1.length != str2.length) {
    //first check
    return false;
  }

  // Create a frequency map for characters in str1
  Map<String, int> charCount = {};
  for (int i = 0; i < str1.length; i++) {
    String char = str1[i];
    charCount[char] = (charCount[char] ?? 0) + 1; //increment the count
  }

  // Check characters in str2 against the frequency map
  for (int i = 0; i < str2.length; i++) {
    String char = str2[i];
    if (!charCount.containsKey(char)) {
      //check if the character is present
      return false;
    }
    charCount[char] = charCount[char]! - 1; //decrement the count
    if (charCount[char] == 0) {
      charCount.remove(char); //remove the character from the map
    }
  }
  // If all counts are zero, they are anagrams
  if (charCount.isNotEmpty) {
    return false;
  }
  return true;
}

// now using build in method
bool isAnagramBuiltIn(String str1, String str2) {
  // Convert both strings to lowercase and remove spaces
  str1 = str1.toLowerCase().replaceAll(' ', '');
  str2 = str2.toLowerCase().replaceAll(' ', '');

  // If lengths are different, they cannot be anagrams
  if (str1.length != str2.length) {
    return false;
  }
  // Sort both strings and compare
  String sortedStr1 = (str1.split('').toList()..sort()) as String;
  String sortedStr2 = (str2.split('').toList()..sort()) as String;
  return sortedStr1 == sortedStr2;
}
