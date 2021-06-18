
extension ListModifier<T> on List<T> {

  // Returns a new iterable with all elements shifted by m i.e. [a, b, c].loop(1) => [c, a, b]
  List<T> loop([int m = 0, bool backwards = false]){
    int n = this.length;
    if(n <= 1) return new List<T>.from(this);
    int sign = backwards ? -1 : 1;
    return new List<T>.generate(n, (i) => this[(i - (sign * m)) % n]);
  }

}