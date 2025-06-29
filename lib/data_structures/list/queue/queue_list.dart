// Queue: FIFO
class QueueList<T> {
  final List<T> queueList = [];

  // Add element to the end
  void enqueue(T data) {
    queueList.add(data);
  }

  // Remove and return the front element
  T dequeue() {
    if (queueList.isEmpty) {
      throw StateError('Queue is empty');
    } else {
      return queueList.removeAt(0); // Fix here
    }
  }

  // Return the front element without removing it
  T front() {
    if (queueList.isEmpty) {
      throw StateError('The Queue is empty');
    } else {
      return queueList.first;
    }
  }

  // Check if the queue is empty
  bool isEmpty() {
    return queueList.isEmpty;
  }

  // Return the size of the queue
  int size() {
    return queueList.length;
  }

  // Clear all elements
  void clear() {
    queueList.clear();
  }
}
