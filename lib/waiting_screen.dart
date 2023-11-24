// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WaitingScreen extends StatefulWidget {
  final Widget? image;
  const WaitingScreen({
    Key? key,
    this.image,
  }) : super(key: key);
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> logoOffsetAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the controller with a duration of 20 seconds
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 23),
    );

    // Create a tween that animates the logo's position
    logoOffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, -2.0), // Move the logo off the screen
    ).animate(controller);

    // Start the animation
    controller.forward();

    // Add a repeating bouncing animation every 2 seconds
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
                position: logoOffsetAnimation,
                child: widget.image ?? const FlutterLogo()),
            const SizedBox(height: 20),
            const Text('Please wait...'),
          ],
        ),
      ),
    );
  }
}
