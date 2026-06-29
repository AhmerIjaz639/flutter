import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FitnessHome());
  }
}

class FitnessHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 64, 7, 122),
              const Color.fromARGB(255, 14, 1, 11),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(),
                SizedBox(height: 30),

                buildStatsRow(),
                SizedBox(height: 30),
                buildProgress(),
                SizedBox(height: 30),
                _buildExerciseList(),
                SizedBox(height: 30),
                _buildWorkoutSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning Champ ! ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tuesday, Jan 2026',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage('https://picsum.photos/66'),
        ),
      ],
    );
  }

  Widget buildStatsRow() {
    return Row(
      children: [
        _buildStatCard('🔥', '2,450', 'Calories', Colors.orange),
        SizedBox(width: 12),
        _buildStatCard('💧', '6/8', 'Water', Colors.blue),
        SizedBox(width: 12),
        _buildStatCard('⏱️', '45m', 'Time', Colors.green),
      ],
    );
  }

  Widget _buildStatCard(String emoji, String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.3)),
        ),

        child: Column(
          children: [
            Text(emoji, style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(label, style: TextStyle(color: Colors.grey, fontSize: 15)),
          ],
        ),
      ),
    );
  }

  Widget buildProgress() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 6, 113, 10),
            const Color.fromARGB(255, 244, 245, 248),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daily goal Progress ",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: 0.43,
              minHeight: 20,
              backgroundColor: Colors.grey[800],
              valueColor: AlwaysStoppedAnimation(
                const Color.fromARGB(255, 240, 232, 71),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Good ! Keep it up  ",
            style: TextStyle(
              fontSize: 12,
              color: const Color.fromARGB(255, 21, 3, 3),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Workout 💪",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            _buildWorkoutCard('🏃', 'Cardio', '30 min'),
            SizedBox(width: 12),
            _buildWorkoutCard('🏋️', 'Strength', '45 min'),
          ],
        ),
      ],
    );
  }

  Widget _buildWorkoutCard(String emoji, String title, String duration) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F3460), Color(0xFF533483)],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emoji, style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(duration, style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseList() {
    final exercises = [
      {'name': 'Push Ups', 'sets': '3x12', 'color': Colors.red},
      {'name': 'Squats', 'sets': '4x10', 'color': Colors.yellow},
      {'name': 'Plank', 'sets': '3x60s', 'color': Colors.green},
      {'name': 'Pull Ups', 'sets': '3x8', 'color': Colors.blue},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Exercises",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        ...exercises.map((e) => _buildExerciseItem(e)),
      ],
    );
  }

  Widget _buildExerciseItem(Map exercise) {
    Color color = exercise['color'] as Color;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF16213E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              exercise['name'] as String,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            exercise['sets'] as String,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
