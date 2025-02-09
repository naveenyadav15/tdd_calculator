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
    List<String> values = numbers.split(",").join("\n").split("\n").toList();
    for (int i = 0; i < values.length; i++) {
      sum += int.parse(values[i]);
    }
    return sum;
  }
}
