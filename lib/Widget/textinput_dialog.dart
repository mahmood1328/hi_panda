import 'package:flutter/material.dart';

class TextInputDialog {
  Future<void> showTextInputDialog({
    required BuildContext context,
    required String title,
    String? initialText,
    required TextInputType keyboardType,
    required Function(String) onSubmitted,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext ctxt) {
        final _controller = TextEditingController(text: initialText);
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ],
              ),
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                controller: _controller,
                keyboardType: keyboardType,
                textAlignVertical: TextAlignVertical.bottom,
                onSubmitted: (value) {
                  onSubmitted(value);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.grey[700],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("cancel"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.onBackground,
              ),
              onPressed: () {
                onSubmitted(_controller.text.trim());
                Navigator.pop(context);
              },
              child: Text(
               "ok",
                style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.onBackground == Colors.white
                            ? Colors.black
                            : null),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        );
      },
    );
  }
}
