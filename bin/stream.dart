Stream<int> boatStream() async* { // async* is a generator function for streams
  for (var i = 1; i <= 10; i++) {
    print('${DateTime.now()}: Boat is leaving port $i !');
    yield i; // yield is used to send data to the stream
    await Future.delayed(Duration(seconds: 2)); // wait for 2 seconds
  }
}

void main() {

  Stream stream = boatStream(); // create a stream
  stream.listen((event) => print(event)); // listen to the stream

}
