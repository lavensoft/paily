import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MiniAppButton extends StatefulWidget {
  final String imageUrl;
  final String label;
  final VoidCallback onTap;

  const MiniAppButton({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.onTap,
  });

  @override
  _MiniAppButtonState createState() => _MiniAppButtonState();
}

class _MiniAppButtonState extends State<MiniAppButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 60),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.6).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: FadeTransition(
        opacity: _animation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
                width: 42,
                height: 42,
              )
            ),
            SizedBox(height: 8.0),
            Text(
              widget.label,
            ),
          ],
        ),
      ),
    );
  }
}