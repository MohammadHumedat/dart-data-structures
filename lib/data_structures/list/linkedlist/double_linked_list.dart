class DoublyNode<T> {
  // Create the node for Doubly linked list.
  T data;
  DoublyNode<T>? next;
  DoublyNode<T>? prev;

  DoublyNode({required this.data, this.next, this.prev});
}

class DoublyLinkedList<T> {
  DoublyNode<T>? head;
  DoublyNode<T>? _head;
  DoublyNode<T>? _tail;
  int _size = 0;

  void insertAtHead(T data) {
    final newNode = DoublyNode(data: data);
    newNode.next = _head;
    if (_head != null) {
      _head!.prev = newNode;
    } else {
      _tail = newNode;
    }
    _head = newNode;
    _size++;
  }

  void insertAtTail(T data) {
    final newNode = DoublyNode<T>(data: data);
    newNode.prev = _tail;
    if (_tail != null) {
      _tail!.next = newNode;
    } else {
      _head = newNode;
    }
    _tail = newNode;
    _size++;
  }

  void insertAt(int index, T data) {
    if (index < 0 || index > _size) {
      throw RangeError("Index out of bounds");
    }
    if (index == 0) {
      insertAtHead(data);
    } else if (index == _size) {
      insertAtTail(data);
    } else {
      final newNode = DoublyNode<T>(data: data);
      var current = _head;
      for (int i = 0; i < index; i++) {
        current = current!.next;
      }
      newNode.prev = current!.prev;
      newNode.next = current;
      current.prev!.next = newNode;
      current.prev = newNode;
      _size++;
    }
  }

  bool delete(T data) {
    var current = _head;
    while (current != null) {
      if (current.data == data) {
        if (current.prev != null) {
          current.prev!.next = current.next;
        } else {
          _head = current.next;
        }
        if (current.next != null) {
          current.next!.prev = current.prev;
        } else {
          _tail = current.prev;
        }
        _size--;
        return true;
      }
      current = current.next;
    }
    return false;
  }

  T? getAt(int index) {
    if (index < 0 || index >= _size) {
      throw RangeError("Index out of bounds");
    }
    var current = _head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }
    return current?.data;
  }

  bool contains(T data) {
    var current = _head;
    while (current != null) {
      if (current.data == data) return true;
      current = current.next;
    }
    return false;
  }

  void printForward() {
    var current = _head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void printBackward() {
    var current = _tail;
    while (current != null) {
      print(current.data);
      current = current.prev;
    }
  }

  int length() => _size;

  bool get isEmpty => _size == 0;
}
