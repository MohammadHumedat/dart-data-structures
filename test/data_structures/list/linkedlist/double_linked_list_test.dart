
import 'package:dsa_dart/data_structures/list/linkedlist/double_linked_list.dart';
import 'package:test/test.dart';


void main() {
  group('DoublyLinkedList', () {
    late DoublyLinkedList<int> list;

    setUp(() {
      list = DoublyLinkedList<int>();
    });

    test('is initially empty', () {
      expect(list.isEmpty, isTrue);
      expect(list.length(), equals(0));
    });

    test('insertAtHead inserts correctly', () {
      list.insertAtHead(10);
      expect(list.getAt(0), equals(10));
      expect(list.length(), equals(1));
    });

    test('insertAtTail inserts correctly', () {
      list.insertAtTail(20);
      expect(list.getAt(0), equals(20));
      list.insertAtTail(30);
      expect(list.getAt(1), equals(30));
      expect(list.length(), equals(2));
    });

    test('insertAt inserts at specific position', () {
      list.insertAtHead(1);  // List: 1
      list.insertAtTail(3);  // List: 1, 3
      list.insertAt(1, 2);   // List: 1, 2, 3
      expect(list.getAt(0), equals(1));
      expect(list.getAt(1), equals(2));
      expect(list.getAt(2), equals(3));
    });

    test('delete removes existing element', () {
      list.insertAtTail(1);
      list.insertAtTail(2);
      list.insertAtTail(3);
      final deleted = list.delete(2);
      expect(deleted, isTrue);
      expect(list.contains(2), isFalse);
      expect(list.length(), equals(2));
    });

    test('delete returns false if element not found', () {
      list.insertAtTail(1);
      expect(list.delete(5), isFalse);
    });

    test('getAt throws RangeError for invalid index', () {
      expect(() => list.getAt(0), throwsRangeError);
    });

    test('contains returns true if element exists', () {
      list.insertAtTail(42);
      expect(list.contains(42), isTrue);
    });

    test('contains returns false if element does not exist', () {
      expect(list.contains(99), isFalse);
    });
  });
}
