class CircularNode<T> {
  T data;
  CircularNode<T>? next;

  CircularNode(this.data);
}

class CircularLinkedList<T> {
  CircularNode<T>? head;

  void insert(T data) {
    var newNode = CircularNode(data);
    if (head == null) {
      head = newNode;
      head!.next = head;
    } else {
      var current = head!;
      while (current.next != head) {
        current = current.next!;
      }
      current.next = newNode;
      newNode.next = head;
    }
  }

  bool delete(T data) {
    if (head == null) return false;

    var current = head;
    CircularNode<T>? prev;

    do {
      if (current!.data == data) {
        if (prev == null) {
          
          if (head!.next == head) {
            head = null;
          } else {
            var last = head;
            while (last!.next != head) {
              last = last.next;
            }
            head = head!.next;
            last.next = head;
          }
        } else {
          prev.next = current.next;
          if (current == head) head = current.next;
        }
        return true;
      }
      prev = current;
      current = current.next;
    } while (current != head);

    return false;
  }

  bool contains(T data) {
    if (head == null) return false;

    var current = head;
    do {
      if (current!.data == data) return true;
      current = current.next;
    } while (current != head);

    return false;
  }

  T? getAt(int index) {
    if (head == null || index < 0) return null;

    var current = head;
    int i = 0;
    do {
      if (i == index) return current!.data;
      current = current!.next;
      i++;
    } while (current != head);

    return null;
  }

  void printList() {
    if (head == null) {
      print("List is empty");
      return;
    }

    var current = head;
    do {
      print(current!.data);
      current = current.next;
    } while (current != head);
  }

  int length() {
    if (head == null) return 0;

    int count = 0;
    var current = head;
    do {
      count++;
      current = current!.next;
    } while (current != head);

    return count;
  }
}