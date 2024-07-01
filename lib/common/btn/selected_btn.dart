import 'package:flutter/material.dart';

class SelectedBtn extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  const SelectedBtn({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.folder),
            const SizedBox(width: 8.0),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
