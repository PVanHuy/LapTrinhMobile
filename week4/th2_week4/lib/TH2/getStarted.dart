import 'package:flutter/material.dart';
import 'package:th2_week4/TH2/getStarted2.dart';

class GetStarted extends StatelessWidget {
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
            _buildDot(true),
            _buildDot(false),
            _buildDot(false),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              print("Skip pressed");
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
                    'assets/images/getStarted.png',
                    width: 300,
                    height: 200,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Easy Time Management',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'With management based on priority and',
                    style: _descTextStyle(),
                  ),
                  Text(
                    'daily tasks, it will give you convenience in',
                    style: _descTextStyle(),
                  ),
                  Text(
                    'managing and determining the tasks that',
                    style: _descTextStyle(),
                  ),
                  Text(
                    'must be done first',
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
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GetStarted2()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            'Get Started',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
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
