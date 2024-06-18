import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Waypoints in Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Waypoints")),
        body: Center(
          child: CustomPaint(
            size: Size(300, 200), // Size of the custom canvas
            painter: WaypointPainter(), // Custom painter for waypoints and lines
          ),
        ),
      ),
    );
  }
}

class WaypointPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2.0;

    final Paint waypointPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Define waypoints as offsets on the canvas
    final List<Offset> waypoints = [
    Offset(50, size.height / 2), // First waypoint
      Offset(100, size.height / 2), // Second waypoint
      Offset(200, size.height / 2), // Third waypoint
    ];

    // Draw a line connecting all waypoints
    canvas.drawLine(
      waypoints.first,
      waypoints.last,
      linePaint,
    );

    // Draw circles to represent waypoints
    for (final point in waypoints) {
      canvas.drawCircle(
        point,
        5, // Radius of the waypoint
        waypointPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint unless the waypoints
    }
}