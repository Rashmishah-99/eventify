import 'package:bmi_app/screens/result_screen.dart';
import 'package:flutter/material.dart';

class BmiCalcScreen extends StatefulWidget {
  const BmiCalcScreen({super.key});

  @override
  State<BmiCalcScreen> createState() => _BmiCalcScreenState();
}

class _BmiCalcScreenState extends State<BmiCalcScreen> {
  double result = 0;
  TextEditingController wtTxtController = TextEditingController();
  TextEditingController htTxtController = TextEditingController();
  bool isValid = false;

  String selectedUnit = 'SI'; // Default unit system

  void validate() {
    if (wtTxtController.text.isNotEmpty && htTxtController.text.isNotEmpty) {
      isValid = true;
    } else {
      isValid = false;
    }
    setState(() {});
  }

  double calculateBmi(double wt, double ht) {
    if (selectedUnit == 'SI') {
      return wt / (ht * ht);
    } else {
      // Convert lbs to kg and inches to meters
      double weightInKg = wt * 0.453592;
      double heightInM = ht * 0.0254;
      return weightInKg / (heightInM * heightInM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text("Select Unit System:"),
            DropdownButton<String>(
              value: selectedUnit,
              items: ['SI', 'Imperial']
                  .map(
                    (unit) => DropdownMenuItem(child: Text(unit), value: unit),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedUnit = value!;
                  validate();
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => validate(),
              controller: wtTxtController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: selectedUnit == 'SI'
                    ? "Weight in kgs"
                    : "Weight in lbs",
                hintText: selectedUnit == 'SI'
                    ? "Enter your weight in kilograms"
                    : "Enter your weight in pounds",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => validate(),
              controller: htTxtController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: selectedUnit == 'SI'
                    ? "Height in meters"
                    : "Height in inches",
                hintText: selectedUnit == 'SI'
                    ? "Enter your height in meters"
                    : "Enter your height in inches",
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: !isValid
                  ? null
                  : () {
                      double wt = double.parse(wtTxtController.text);
                      double ht = double.parse(htTxtController.text);
                      result = calculateBmi(wt, ht);
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(result),
                        ),
                      );
                    },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
