import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            color: const Color.fromARGB(99, 0, 0, 0),
          ),
          Text(
            "Learn Maths With Quiz",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(
              Icons.arrow_right_outlined,
              size: 35,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}
