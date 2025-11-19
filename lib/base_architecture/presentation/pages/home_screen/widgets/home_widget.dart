import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeWidget extends StatelessWidget {
  final String title;
  IconData? icon;
  final VoidCallback onTap;
  HomeWidget({super.key, required this.title, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.deepOrange.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (title == 'Customer')
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.people_alt, color: Colors.white, size: 30.0),
              ),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
