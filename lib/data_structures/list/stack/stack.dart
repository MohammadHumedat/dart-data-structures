// Class stack to immplement stack data structure using list.
class Stack<T> {
  List<T> _stack = [];
  // This function to add a new element inside the stack
  void push(T element) {
    _stack.add(element);
  }

  // This function to remove the last element from the stack
  T pop() {
    // check the stack is empty or no.
    if (_stack.isEmpty) {
      throw StateError('the stack is empty');
    } else {
      T lastElement =
          _stack.last; // buffer to store the element before removing it
      _stack.removeLast();
      return lastElement;
    }
  }

  // This function to return the last element without removing it from stack.
  T peek() {
    if (_stack.isEmpty) {
      throw StateError('the stack is empty no element is there');
    } else {
      return _stack.last;
    }
  }

  // This function to test if the stack is empty or no.
  bool isEmpty() {
    return _stack.isEmpty;
  }

  // This function to return the size of stack.
  int size() {
    return _stack.length;
  }

  // Clear the stack using iteration
  void clearOne() {
    if (_stack.isEmpty) {
      throw StateError("the stack is empty");
    } else {
      for (var element in _stack) {
        _stack.remove(element);
      }
    }
  }

  // Clear all elements from the stack using built-in function
  void clearTow() {
    _stack.clear();
  }
}
