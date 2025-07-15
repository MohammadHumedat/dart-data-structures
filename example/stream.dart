Stream<int> boatStream() async* {
  for (var i = 1; i <= 10; i++) {
    print('${DateTime.now()}: Boat is leaving port $i !');
    yield i;
    await Future.delayed(Duration(seconds: 2));
  }
}

void main() {

  Stream stream = boatStream();
  stream.listen((event) => print(event));

}
