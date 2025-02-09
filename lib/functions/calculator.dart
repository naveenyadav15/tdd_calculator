class CreateCalculator {
  int _addCalledCount = 0;

  int addString(String numbers) {
    _addCalledCount++;
    int sum = 0;
    List<int> negatives = [];
    if (numbers.isEmpty) return sum;
    String delimiter = ",";
    if (numbers.startsWith("//")) {
      List<String> parts = numbers.split("\n");
      delimiter = parts[0].substring(2);
      delimiter = delimiter.substring(1, delimiter.length - 1);
      numbers = parts.sublist(1).join("\n");
    }
    // ,\n || -\n || ,\\n
    List<String> numberStrings = numbers.split(RegExp("[$delimiter\n]"));
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
