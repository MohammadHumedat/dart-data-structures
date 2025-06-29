
import 'package:dsa_dart/data_structures/list/linkedlist/circular_linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('CircularLinkedList Tests', () {
    test('Insert and verify circular structure', () {
      var list = CircularLinkedList<int>();
      list.insert(1);
      list.insert(2);
      list.insert(3);

      expect(list.length(), 3);
      expect(list.getAt(0), 1);
      expect(list.getAt(2), 3);
      expect(list.getAt(3), null); // Out of bounds
    });

    test('Delete and maintain circular integrity', () {
      var list = CircularLinkedList<int>();
      list.insert(1);
      list.insert(2);
      list.insert(3);
      list.delete(2);

      expect(list.length(), 2);
      expect(list.contains(2), false);
    });

    test('Traversal ends correctly after full loop', () {
      var list = CircularLinkedList<String>();
      list.insert("a");
      list.insert("b");
      list.insert("c");

      var seen = <String>[];
      var current = list.head;
      do {
        seen.add(current!.data);
        current = current.next;
      } while (current != list.head);

      expect(seen, ["a", "b", "c"]);
    });

    test('Edge cases: empty and one-node list', () {
      var list = CircularLinkedList<int>();
      expect(list.delete(10), false);
      expect(list.getAt(0), null);

      list.insert(42);
      expect(list.length(), 1);
      expect(list.getAt(0), 42);
      expect(list.delete(42), true);
      expect(list.length(), 0);
      expect(list.head, null);
    });
  });
}
