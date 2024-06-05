class SharedNotInitializeException implements Exception {
  @override
  String toString() {
    return 'Your prefences has not initialized right now. Please wait for a while.';
  }
}
