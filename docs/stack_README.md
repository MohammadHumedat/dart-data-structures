# Stack concepts:-
- LIFO stands for Last In, First Out.
It means: The last element that you add to a structure is the first one you remove.

-In the Stack<T> class you built:

Internally, we use a List called _stack to store elements.

When you call push(element), it adds the element to the end of the list (_stack.add(element)).

When you call pop(), it removes the last element of the list (_stack.removeLast()).

This follows the LIFO behavior because:

The most recently added element is always the one that gets removed first.
# Stack Project

This is a simple implementation of a Stack data structure in Dart following the LIFO (Last In, First Out) principle.

## Features
- `push(T element)` — Add an element to the stack.
- `pop()` — Remove and return the top element.
- `peek()` — Look at the top element without removing it.
- `size()` — Return the number of elements.
- `isEmpty()` — Check if the stack is empty.
- `clear()` — Remove all elements from the stack.

