import 'dart:math' as math;

extension IterableModifier<T> on Iterable<T> {

  // Get a random item from the provided iterable
  T? getRandom() {
    int length = this.length;
    if(length == 0) return null;
    if(length == 1) return this.single;
    int randomIndex = math.Random().nextInt(length);
    return this.toList(growable: false)[randomIndex];
  }

  // Get a random sublist of the provided iterable (if ofLength is null, sublist length will also be randomized)
  List<T> getRandomSublist([int? ofLength]){
    List<T> out = [];
    int length = this.length;

    if(ofLength == 0 || length == 0) return out;
    if(length == 1) return [this.single];

    if(ofLength == null) ofLength = math.Random().nextInt(length);
    else ofLength = math.min(ofLength, length);

    List<T> list = List.from(this);
    while(ofLength! > 0)
    {
      T element = list.getRandom()!;
      out.add(element);
      list.remove(element);
      ofLength--;
    }

    return out;
  }
}