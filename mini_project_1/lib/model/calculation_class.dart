class BMICalculator {
  double get weight => _weight;
  set weight(double value) {
    if (value > 0) {
      _weight = value;
    }
  }

  double get height => _height;
  set height(double value) {
    if (value > 0) {
      _height = value;
    }
  }

  int get age => _age;
  set age(int value) {
    if (value > 0) {
      _age = value;
    }
  }
  // void getWeight() {

  // }

  // double setWeight() {
  //   return _weight;
  // }

  // void getHeight(double height) {
  //   if (height > 0) {
  //     height = height / 100;
  //     _height = height;
  //   }
  // }

  // double setHeight() {
  //   return _height;
  // }

  // void getAge(int age) {
  //   if (age > 0) {
  //     _age = age;
  //   }
  // }

  // int setAge() {
  //   return _age;
  // }

  double calculateBMI() {
    if (_height <= 0) {
      return 0;
    }
    lastbmi = (_weight / _height / _height) * 10000;
    return lastbmi;
  }

  String getBc() {
    double bmi = calculateBMI();
    if (bmi < 18.5) {
      return "UnderWeight";
    } else if (bmi < 24.9) {
      return "Normal";
    } else if (bmi < 29.9) {
      return "OverWeight";
    } else {
      return "Obesity";
    }
  }

  String getBmiCategory() {
    double BMI = calculateBMI();

    if (BMI < 18.5) {
      lastCategory = "UnderWeight";
    } else if (BMI > 18.5 && BMI <= 24.9) {
      lastCategory = "Normal";
    } else if (BMI > 24.9 && BMI <= 29.9) {
      lastCategory = "OverWeight";
    } else {
      lastCategory = "Obesity";
    }
    switch (lastCategory) {
      case "UnderWeight":
        return "Your BMI is ${lastbmi.toStringAsFixed(1)}, indicating your weight is in the the underweight category.\n\nConsider consulting with a healthcare provider to develop a healthy eating plan.\n\nGracias, Have a Good day🥰";
      case "Normal":
        return "Your BMI is ${lastbmi.toStringAsFixed(1)}, indicating your weight is in the the Normal category.\n\nKeep up the good work and maintain a balanced diet and regular exercise.\n\nIdan gangan😍";
      case "OverWeight":
        return "Your BMI is ${lastbmi.toStringAsFixed(1)}, indicating your weight is in the the overweight category.\n\nIt may be beneficial to adopt a healthier lifestyle through diet and exercise.\n\nTesekkurler Take care😘";
      case "Obesity":
        return "Your BMI is ${lastbmi.toStringAsFixed(1)}, indicating your weight is in the the obesity category.\n\nIt is important to consult with a healthcare provider for guidance on achieving a healthier weight.\n\n Hakuna Matata🤗";
      default:
        return "Incorrect BMI";
    }
  }

  double _weight = 70.0;
  double _height = 70.0;
  int _age = 23;
  double lastbmi = 0;
  String lastCategory = "";
}
