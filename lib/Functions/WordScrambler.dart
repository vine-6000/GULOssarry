String scramble(String phrase) {
  // separate the phrase into words
  final words = phrase.trim().split(RegExp(r'\s+'));

  // scramble each word
  final scrambledWords = <String>[];
  for (final word in words) {
    final letters = word.split('');
    letters.shuffle();
    scrambledWords.add(letters.join());
  }

  // combine them back into one string
  return scrambledWords.join(' ');
}
