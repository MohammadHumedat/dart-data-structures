// Node class for Linked List
class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data);
}

// Queue: FIFO using Linked Structure
class QueueList<T> {
  Node<T>? _front;
  Node<T>? _rear;
  int _length = 0;

  // Add element to the end
  void enqueue(T data) {
    Node<T> newNode = Node<T>(data);
    if (_rear == null) {
      // If queue is empty
      _front = _rear = newNode;
    } else {
      _rear!.next = newNode;
      _rear = newNode;
    }
    _length++;
  }

  // Remove and return the front element
  T dequeue() {
    if (_front == null) {
      throw StateError('Queue is empty');
    }
    T value = _front!.data;
    _front = _front!.next;
    if (_front == null) {
      _rear = null; // Queue is empty now
    }
    _length--;
    return value;
  }

  // Return the front element without removing
  T front() {
    if (_front == null) {
      throw StateError('Queue is empty');
    }
    return _front!.data;
  }

  // Check if the queue is empty
  bool isEmpty() {
    return _front == null;
  }

  // Return the size of the queue
  int size() {
    return _length;
  }

  // Clear all elements
  void clear() {
    _front = null;
    _rear = null;
    _length = 0;
  }
}
