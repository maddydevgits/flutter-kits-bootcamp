// experiment-10: UI Animations in Flutter

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: AnimationHomePage(),
    );
  }
}

class AnimationHomePage extends StatelessWidget {
  const AnimationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('UI Animations in Flutter'),
          bottom: TabBar(
            tabs: [Tab(text: 'Fade'), Tab(text: 'Slide'), Tab(text: 'Scale')],
          ),
        ),
        body: TabBarView(
          children: [
            FadeAnimationDemo(),
            SlideAnimationDemo(),
            ScaleAnimationDemo(),
          ],
        ),
      ),
    );
  }
}

// Fade Animation Widget

class FadeAnimationDemo extends StatefulWidget {
  const FadeAnimationDemo({super.key});

  @override
  State<FadeAnimationDemo> createState() => _FadeAnimationDemoState();
}

class _FadeAnimationDemoState extends State<FadeAnimationDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: Text('Flutter Bootcamp'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _visible = !_visible;
              });
            },
            child: Text('Toggle Fade'),
          ),
        ],
      ),
    );
  }
}

// Slide Animation Demo Widget

class SlideAnimationDemo extends StatefulWidget {
  const SlideAnimationDemo({super.key});

  @override
  State<SlideAnimationDemo> createState() => _SlideAnimationDemoState();
}

class _SlideAnimationDemoState extends State<SlideAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startSlide() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: Text('Flutter Bootcamp'),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: _startSlide, child: Text('Start Slide')),
        ],
      ),
    );
  }
}

// ScaleAnimationDemo Class

class ScaleAnimationDemo extends StatefulWidget {
  const ScaleAnimationDemo({super.key});

  @override
  State<ScaleAnimationDemo> createState() => _ScaleAnimationDemoState();
}

class _ScaleAnimationDemoState extends State<ScaleAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 3.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startScale() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _scaleAnimation,
            child: Text('Flutter Bootcamp'),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: _startScale, child: Text('Start Scale')),
        ],
      ),
    );
  }
}
