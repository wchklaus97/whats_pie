import 'package:flutter/material.dart';
import 'package:whats_pie/common/enum.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_pie/common/regexp/regexp.dart';
import 'package:whats_pie/services/file_service.dart';
import 'package:whats_pie/common/btn/selected_btn.dart';
import 'package:whats_pie/pages/home_page/regex_menu.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:whats_pie/bloc/files_searcher_bloc/files_searcher_bloc.dart';
import 'package:whats_pie/bloc/files_searcher_bloc/files_searcher_state.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_preview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FilesSearcherBloc _filesSearcherBloc;
  late ValueNotifier<WhatsAppRegex> _whatsAppRegexNotifi;

  @override
  void initState() {
    super.initState();
    _filesSearcherBloc = FilesSearcherBloc(FileService());
    _whatsAppRegexNotifi = ValueNotifier(
      WhatsAppRegex.get(
          platform: WhatsAppPlatform.android, locale: MobileLocale.zhHantHK),
    );
  }

  @override
  void dispose() {
    _filesSearcherBloc.close();
    _whatsAppRegexNotifi.dispose();
    super.dispose();
  }

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

  Widget body(Widget statusWidget) {
    return Column(
      children: [
        RegexMenu(
          key: UniqueKey(),
          whatsAppRegexNotifi: _whatsAppRegexNotifi,
        ),
        Expanded(
          child: Center(
            child: Column(children: [statusWidget, aboutSection(context)]),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FilesSearcherBloc, FilesSearcherState>(
        bloc: _filesSearcherBloc,
        builder: (context, state) {
          return state.map(
            searching: (_) => Center(
                child: LoadingAnimationWidget.dotsTriangle(
                    color: Colors.green, size: 44)),
            complete: (res) => ChatRecordPreviewPage(
                whatsAppRegex: res.whatsAppRegex,
                dirInfo: res.dirInfo,
                filesSearcherBloc: _filesSearcherBloc),
            idle: (_) => body(
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("WhatsPie",
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold)),
                    const Text("Version - 1.0.0+1 (beta)",
                        style: TextStyle(
                            height: 1.0,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 36.0),
                    Image.asset("assets/app_icon.png", width: 120, height: 120),
                    const SizedBox(height: 44),
                    SelectedBtn(
                        name: "Select Folder",
                        onPressed: () => _filesSearcherBloc.add(
                            FileSearcherStart(
                                whatsAppRegex: _whatsAppRegexNotifi.value))),
                  ],
                ),
              ),
            ),
            error: (v) => body(
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(v.errorMsg,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 44.0),
                    SelectedBtn(
                      name: "Choose Another Folder",
                      onPressed: () => _filesSearcherBloc.add(FileSearcherStart(
                          whatsAppRegex: _whatsAppRegexNotifi.value)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
