import 'package:flutter/material.dart';
import 'package:th2_week4/TH2/getStarted.dart';
import 'package:th2_week4/TH2/getStarted3.dart';

class GetStarted2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, 
        title: Row(
          children: [
            _buildDot(false),
            _buildDot(true),
            _buildDot(false),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GetStarted3()));
            },
            child: Text(
              'skip',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/getStarted_2.png',
                    width: 300,
                    height: 200,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Increase Work Effectiveness',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Time management and the determination',
                    style: _descTextStyle(),
                  ),
                  Text(
                    'of more important tasks will give your job',
                    style: _descTextStyle(),
                  ),
                  Text(
                    'statistics better and always improve',
                    style: _descTextStyle(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GetStarted()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GetStarted3()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      
                    )
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ]
        )
      ),
    );
  }

  // Widget xây dựng chấm tròn
  Widget _buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.blue.withValues(alpha:0.2),
        shape: BoxShape.circle,
      ),
    );
  }

  TextStyle _descTextStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
}
