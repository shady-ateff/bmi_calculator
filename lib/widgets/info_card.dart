import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  final String title;
  final int initialValue;
  final Function(int) onValueChanged;
  const InfoCard({super.key, required this.title, required this.initialValue, required this.onValueChanged});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  int value = 0; // Initial value for the card

  @override
  void initState() {
    super.initState();
    value = widget.initialValue; // Set the initial value from the widget
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        spacing: 15,
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              // color: Color(0x001d1e33),
              decoration: BoxDecoration(
                color: Color(0xFF1d1e33),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    value.toStringAsFixed(0),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 49, 50, 85),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              value = (value > 0)
                                  ? value - 1
                                  : 0; // Prevent negative values
                            });
                          },
                          icon: Icon(Icons.remove, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 49, 50, 85),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              value++; // Increment the value
                            });
                          },
                          icon: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
