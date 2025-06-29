
class Node<T> {
  Node(this.data);
  T data;
  Node<T>? next;
}

class LinkedList<T> {
  Node<T>? head;

  int _length = 0;

  int get length => _length;

  bool get isEmpty => _length == 0 ? true : false;
  
  void add(T value) {
    final newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node<T>? pointer = head;
      while (pointer!.next != null) {
        pointer = pointer.next;
      }
      pointer.next = newNode;
      newNode.next = null;
    }
    _length++;
  }

  void insert(int index, T value) {
    if (index < 0 || index > _length) {
      throw ArgumentError("Index out of bounds");
    }

    final newNode = Node(value);

    if (index == 0) {
      
      newNode.next = head;
      head = newNode;
    } else {
      Node<T>? pointer = head;

      
      for (int i = 0; i < index - 1; i++) {
        pointer = pointer!.next;
      }

      
      newNode.next = pointer!.next;
      pointer.next = newNode;
    }

    _length++; 
  }

  T removeAt(int index) {
    if (index < 0 || index >= _length) {
      throw UnimplementedError('Invalid index, please enter again');
    }

    T removedData;

    if (index == 0) {
      
      removedData = head!.data;
      head = head!.next;
    } else {
      Node<T>? pointer = head;

      
      for (var i = 0; i < index - 1; i++) {
        pointer = pointer!.next;
      }

      
      removedData = pointer!.next!.data;
      pointer.next = pointer.next!.next;
    }

    _length--; 
    return removedData; 
  }

  bool contains(T value) {
    Node<T>? pointer = head;

    while (pointer != null) {
      if (pointer.data == value) {
        return true;
      }
      pointer = pointer.next;
    }

    return false;
  }

  
  int indexOf(T value) {
    Node<T>? pointer = head;
    int index = 0;
    while (pointer != null) {
      if (pointer.data == value) {
        return index;
      } else {
        pointer = pointer.next;
        index++;
      }
    }
    return -1;
  }

  void clear() {
    
    if (_length == 0) {
      print('the LinkedList is already empty');
    } else {
      while (head != null) {
        Node<T>? temp = head;
        head = head!.next;
        temp!.next = null;
      }
      _length = 0;
    }
  }

  
  T operator [](int index) {
    Node<T>? pointer = head;
    if (index < 0 || index >= _length) {
      throw UnimplementedError('Index out of range');
      
    } else {
      for (var i = 0; i < index; i++) {
        pointer = pointer!.next;
      }
      return pointer!.data;
    }
  }

  void operator []=(int index, T value) {
    if (index < 0 || index >= _length) {
      throw UnimplementedError('Index out of range');
      
    } else {
      Node<T>? pointer = head;
      for (var i = 0; i < index; i++) {
        pointer = pointer!.next;
      }
      pointer!.data = value;
    }
  }

  LinkedList<T> operator +(LinkedList<T> other) {
    LinkedList<T> newList = LinkedList();
    Node<T>? pointer = head;
    if (other._length == 0 && _length == 0) {
      throw UnimplementedError('Both lists are empty!!.');
    } else {
      while (pointer != null) {
        newList.add(pointer.data);
        pointer = pointer.next;
      }

      pointer = other.head;
      while (pointer != null) {
        newList.add(pointer.data);
        pointer = pointer.next;
      }
    }
    return newList;
  }

  LinkedList<T> operator -(T value) {
    if (head == null) {
      throw UnimplementedError('the list is empty');
    }

    LinkedList<T> newList = LinkedList<T>();
    bool valueRemoved = false;
    Node<T>? pointer = head;

    while (pointer != null) {
      if (pointer.data == value && !valueRemoved) {
        valueRemoved = true;
      } else {
        newList.add(pointer.data);
      }
      pointer = pointer.next;
    }

    if (!valueRemoved) {
      throw UnimplementedError("Value not found in the list.");
    }

    return newList;
  }

  void forEach(void Function(T) action) {
    if (head == null) {
      return;
    }

    Node<T>? pointer = head;
    while (pointer != null) {
      action(pointer.data);
      pointer = pointer.next;
    }
  }

  LinkedList<S> map<S>(S Function(T) transform) {
    if (head == null) {
      return LinkedList<S>();
    }

    LinkedList<S> newList = LinkedList<S>();
    Node<T>? pointer = head;

    while (pointer != null) {
      newList.add(transform(pointer.data));
      pointer = pointer.next;
    }

    return newList;
  }

  LinkedList<T> where(bool Function(T) test) {
    if (head == null) {
      throw UnimplementedError(' the list is empty');
    }
    Node<T>? pointer = head;
    LinkedList<T> newList = LinkedList<T>();
    while (pointer != null) {
      if (test(pointer.data)) {
        newList.add(pointer.data);
      }
      pointer = pointer.next;
    }
    return newList;
  }

  @override
  String toString() {
    if (head == null) {
      print('LinkedList: []');
    }

    StringBuffer buffer = StringBuffer('LinkedList: [');
    Node<T>? pointer = head;

    while (pointer != null) {
      buffer.write(pointer.data);
      if (pointer.next != null) {
        buffer.write(', ');
      }
      pointer = pointer.next;
    }
    buffer.write(']');
    return buffer.toString();
  }
}
