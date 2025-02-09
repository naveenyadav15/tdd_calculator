class CreateCalculator {
  int _addCalledCount = 0;

  int addString(String numbers) {
    _addCalledCount++;
    int sum = 0;
    List<int> negatives = [];
    if (numbers.isEmpty) return sum;

    List<String> delimiters = [",", "\n"];
    if (numbers.startsWith("//")) {
      int endIndex = numbers.indexOf("\n");
      String delimiterPart = numbers.substring(2, endIndex);

      RegExp delimiterRegex = RegExp(r"\[(.*?)\]");
      Iterable<Match> matches = delimiterRegex.allMatches(delimiterPart);

      delimiters =
          matches.map((match) => RegExp.escape(match.group(1)!)).toList();

      numbers = numbers.substring(endIndex + 1);
    }

    String delimiterPattern = delimiters.join("|");
    List<String> numberStrings = numbers.split(RegExp(delimiterPattern));

    for (int i = 0; i < numberStrings.length; i++) {
      if (numberStrings[i].isEmpty) continue;
      int parsedNumber = int.parse(numberStrings[i]);
      if (parsedNumber < 0) {
        negatives.add(parsedNumber);
      }
      if (parsedNumber < 1000) sum += parsedNumber;
    }

    if (negatives.isNotEmpty) {
      throw Exception(
          "Negative values are not allowed: ${negatives.join(",")}");
    }
    return sum;
  }

  int getCalledCount() {
    return _addCalledCount;
  }
}
