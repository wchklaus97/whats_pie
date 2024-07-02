import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:whats_pie/pages/chat_record_preview_page/directory_structure_previewer/field_previewer.dart';

class DirectoryStructurePreviewer extends StatelessWidget {
  final List<String> nameField;
  final List<String> typeField;
  final List<String> lastAccessedAtField;
  final List<String> lastModifiedAtField;

  const DirectoryStructurePreviewer({
    super.key,
    required this.nameField,
    required this.typeField,
    required this.lastAccessedAtField,
    required this.lastModifiedAtField,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return width >= 100
            ? ResizableWidget(
                separatorSize: 2,
                percentages: const [0.4, 0.15, 0.225, 0.225],
                children: [
                  FieldPreviewer(title: 'File Name', data: nameField),
                  FieldPreviewer(title: 'Type', data: typeField),
                  FieldPreviewer(
                      title: 'Last Accessed At', data: lastAccessedAtField),
                  FieldPreviewer(
                      title: 'Last Modified At', data: lastModifiedAtField),
                ],
              )
            : const SizedBox();
      },
    );
  }
}
