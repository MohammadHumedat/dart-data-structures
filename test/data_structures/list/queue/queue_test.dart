import 'package:test/test.dart';

import '../../../../lib/data_structures/list/queue/queue_linked_list.dart';

void main() {
  group('QueueList tests', () {
    late QueueList<int> queue;

    setUp(() {
      queue = QueueList<int>();
    });

    test('New queue should be empty', () {
      expect(queue.isEmpty(), isTrue);
      expect(queue.size(), equals(0));
    });

    test('Enqueue should add elements', () {
      queue.enqueue(10);
      expect(queue.isEmpty(), isFalse);
      expect(queue.size(), equals(1));
      expect(queue.front(), equals(10));
    });

    test('Dequeue should remove and return the first element', () {
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);

      expect(queue.dequeue(), equals(1));
      expect(queue.size(), equals(2));
      expect(queue.front(), equals(2));
    });

    test('Front should return the first element without removing it', () {
      queue.enqueue(5);
      queue.enqueue(6);
      expect(queue.front(), equals(5));
      expect(queue.size(), equals(2)); // Should not remove anything
    });

    test('Clear should empty the queue', () {
      queue.enqueue(1);
      queue.enqueue(2);
      queue.clear();
      expect(queue.isEmpty(), isTrue);
      expect(queue.size(), equals(0));
    });

    test('Dequeue on empty queue should throw StateError', () {
      expect(() => queue.dequeue(), throwsA(isA<StateError>()));
    });

    test('Front on empty queue should throw StateError', () {
      expect(() => queue.front(), throwsA(isA<StateError>()));
    });
  });
}
