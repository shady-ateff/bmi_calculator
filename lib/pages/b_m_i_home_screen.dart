import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/info_card.dart';
import 'package:flutter/material.dart';

class BMIHomeScreen extends StatefulWidget {
  const BMIHomeScreen({super.key});

  @override
  State<BMIHomeScreen> createState() => _BMIHomeScreenState();
}

class _BMIHomeScreenState extends State<BMIHomeScreen> {
  double height = 171;
  double weight = 65;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0c21),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 15,
          children: [
            Expanded(
              child: Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: genderButton(
                        "https://cdn1.iconfinder.com/data/icons/health-care-medical/64/Healthcare__medical_icons-21-512.png",
                        "Male",
                        isMale,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: genderButton(
                        "https://redyellowblue.org/wp-content/uploads/2017/07/venus-symbol.png",
                        "Female",
                        !isMale,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            heightSpinner(),
            Expanded(
              child: Row(
                spacing: 15,
                children: [
                  InfoCard(title: "Age", initialValue: 20 , onValueChanged: (value) {
                    // Handle age change if needed
                  }),
                  InfoCard(title: "Weight", initialValue: 60, onValueChanged: (value) {
                    weight = value.toDouble();
                    setState(() {});
                  }),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final bmi = weight / ((height / 100) * (height / 100));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: bmi,
                      resultText: getResultText(bmi),
                      interpretation: getInterpretation(bmi),
                    ),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFeb1555),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Calculate BMI"),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  String getResultText(double bmi) {
    if (bmi >= 25)
      return "Overweight";
    else if (bmi > 18.5)
      return "Normal";
    else
      return "Underweight";
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25)
      return "Try to exercise more and watch your diet.";
    else if (bmi > 18.5)
      return "Great job! Keep it up!";
    else
      return "You should eat a bit more and stay healthy!";
  }

  Expanded heightSpinner() {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xFF1d1e33),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,

          // spacing: 0,
          children: [
            Text(
              "Height",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 5,
              children: [
                Text(
                  height.toStringAsFixed(0),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("cm", style: TextStyle(color: Colors.white, fontSize: 19)),
              ],
            ),
            Slider(
              value: height,
              onChanged: (d) {
                height = d;
                setState(() {});
              },
              min: 110,
              max: 220,
              // divisions: 110,
              activeColor: Color(0xFFeb1555),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderButton(String url, String gender, bool selected) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: selected ? Color(0xFFeb1555) : Color(0xFF1d1e33),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 120, child: Image.network(url, color: Colors.white)),
          SizedBox(height: 10),
          Text(
            gender,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
