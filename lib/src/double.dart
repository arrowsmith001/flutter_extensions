
extension DoubleModifier on double {

  bool isBetween(double lower, double upper, {bool includeLower = false, bool includeUpper = false}){
    if(!includeLower && !includeUpper) return this.isStrictlyBetween(lower, upper);
    return
      (this > lower || (includeLower && this == lower))
        &&
        (this < upper || (includeUpper && this == upper));
  }

  bool isStrictlyBetween(double lower, double upper){
    return this > lower && this < upper;
  }

  /// Returns the proportion (from 0.0 to 1.0) that this number represents as progress inside the given range.
  /// This is like the opposite of lerpDouble i.e.
  ///   if c = lerpDouble(a, b, t), then c.proportionInRange(a, b) = t.
  double proportionInRange(double lower, double upper){
    assert(lower <= upper);
    if(this <= lower) return 0.0;
    if(this >= upper) return 1.0;
    return (this - lower) / (upper - lower);
  }

}