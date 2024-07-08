import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBodyWidget extends StatelessWidget {
  final Widget statusWidget;
  const HomeBodyWidget({super.key, required this.statusWidget});

  Widget aboutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 36.0),
      child: Column(
        children: [
          RichText(
            text: const TextSpan(
              text: "Created & Developed by ",
              style:
                  TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
              children: <TextSpan>[
                TextSpan(
                  text: "Klaus Wong",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              const mailtoLink = 'mailto:wch.klaus@gmail.com';
              final mailUri = Uri.parse(mailtoLink);
              if (await canLaunchUrl(mailUri)) {
                await launchUrl(mailUri);
              } else {
                // Handle the case where the user's device doesn't support opening the email app
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Unable to launch email app')),
                );
              }
            },
            child: Text(
              'wch.klaus@gmail.com',
              style: TextStyle(
                  fontSize: 12.8,
                  color: Colors.blue[600]!,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [statusWidget, aboutSection(context)]),
    );
  }
}
