class CreateCalculator {
  int add(List<int> numbers) {
    int sum = 0;
    for (int i = 0; i < numbers.length; i++) {
      sum += numbers[i];
    }
    return sum;
  }

  int addString(String numbers) {
    int sum = 0;
    if (numbers.isEmpty) return sum;
    String delimiter = ",";
    if (numbers.startsWith("//")) {
      List<String> parts = numbers.split("\n");
      delimiter = parts[0].substring(2);
      numbers = parts.sublist(1).join("\n");
    }
    // ,\n || -\n || ,\\n
    List<String> numberStrings = numbers.split(RegExp("[$delimiter\n]"));
    return numberStrings.fold(0, (sum, number) => sum + int.parse(number));
  }
}
