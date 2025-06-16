class HuffmanNode {
  HuffmanNode(this.symbol, this.frequency, {this.leftChild, this.rightChild});

  String? symbol;
  int frequency;
  HuffmanNode? leftChild, rightChild;
}

Map<String, int> computeFrequencyMap(String text) {
  Map<String, int> frequencyMap = {};
  for (int rune in text.runes) {
    String symbol = String.fromCharCode(rune);
    frequencyMap[symbol] = (frequencyMap[symbol] ?? 0) + 1;
  }

  return frequencyMap;
}

HuffmanNode constructHuffmanTree(String text) {
  Map<String, int> frequencyMap = computeFrequencyMap(text);
  if (frequencyMap.isEmpty) {
    throw ArgumentError('Input is empty');
  }

  List<HuffmanNode> priorityQueue = frequencyMap.entries
      .map((entry) => HuffmanNode(entry.key, entry.value))
      .toList();
  priorityQueue.sort((a, b) => a.frequency.compareTo(b.frequency));

  while (priorityQueue.length > 1) {
    HuffmanNode leftChild = priorityQueue.removeAt(0);
    HuffmanNode rightChild = priorityQueue.removeAt(0);
    int combinedFrequency = leftChild.frequency + rightChild.frequency;
    HuffmanNode internalNode =
        HuffmanNode(null, combinedFrequency, leftChild: leftChild, rightChild: rightChild);
    priorityQueue.add(internalNode);
    priorityQueue.sort((a, b) => a.frequency.compareTo(b.frequency));
  }

  return priorityQueue.first;
}

Map<String, String> generateHuffmanEncoding(HuffmanNode root) {
  Map<String, String> encodingMap = {};
  void traverse(HuffmanNode node, String currentEncoding) {
    if (node.symbol != null) {
      encodingMap[node.symbol!] = currentEncoding;
      return;
    }

    if (node.leftChild != null) {
      traverse(node.leftChild!, '${currentEncoding}0');
    }

    if (node.rightChild != null) {
      traverse(node.rightChild!, '${currentEncoding}1');
    }
  }

  traverse(root, '');
  return encodingMap;
}

String encodeUsingHuffman(String text) {
  if (text.isEmpty) {
    throw ArgumentError('Input is empty');
  }

  HuffmanNode huffmanTree = constructHuffmanTree(text);
  Map<String, String> encodingMap = generateHuffmanEncoding(huffmanTree);
  return text.runes.map((rune) => encodingMap[String.fromCharCode(rune)]).join();
}

String decodeUsingHuffman(String encodedText, HuffmanNode root) {
  StringBuffer decodedText = StringBuffer();
  HuffmanNode currentNode = root;
  for (int rune in encodedText.runes) {
    String bit = String.fromCharCode(rune);
    currentNode = bit == '0' ? currentNode.leftChild! : currentNode.rightChild!;
    if (currentNode.symbol != null) {
      decodedText.write(currentNode.symbol);
      currentNode = root;
    }
  }

  return decodedText.toString();
}

void main() {
  String input = 'AEC';

  String encodedText = encodeUsingHuffman(input);
  print(encodedText);

  HuffmanNode huffmanTree = constructHuffmanTree(input);
  String decodedText = decodeUsingHuffman(encodedText, huffmanTree);
  print(decodedText);
}
