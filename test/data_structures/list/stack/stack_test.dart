
import 'package:dsa_dart/data_structures/list/stack/stack.dart';
import 'package:test/test.dart';

void main() {
  group("Stack test", () {
    Stack _stack = Stack();

    setUp(() {
      _stack = Stack();
    });

    test(
        'Test the empty method',
        () => {
              expect(_stack.isEmpty(), true),
              expect(_stack.size(), equals(0)),
            });

    test(
        'Test the push method',
        () => {
              _stack.push('Mohammad'),
              expect(_stack.isEmpty(), false),
              expect(_stack.size(), equals(1)),
              expect(_stack.peek(), 'Mohammad'),
            });
    test(
        'Test the pop method',
        () => {
              _stack.push(20),
              _stack.push(30),
              _stack.pop(),
              expect(_stack.peek(), equals(20)),
              expect(_stack.size(), equals(1)),
            });

    test(
        'Test again the empty method',
        () => {
              _stack.push(10),
              expect(_stack.isEmpty(), false),
              expect(_stack.size(), equals(1)),
              expect(_stack.peek(), equals(10)),
            });

    test(
        "Test the clear method",
        () => {
              _stack.push(10),
              _stack.push(20),
              _stack.push(30),
              _stack.clearTow(),
              expect(_stack.isEmpty(), true),
              expect(_stack.size(), equals(0)),
            });

    test(
      "Boundary behavior",
      () {
        expect(() => _stack.pop(), throwsA(isA<StateError>()));
      },
    );
  });
}
