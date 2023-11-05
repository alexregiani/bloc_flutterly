void main() {
  var boats = boatSend();
  boats.listen((event) {
    print('received boat: $event');
  },);
}

Stream<int> boatSend() async* {
  for (var i = 0; i < 10; i++) {
    print('boat sent: $i');
    await Future.delayed(const Duration(seconds: 10));
    yield i;
  }
}
