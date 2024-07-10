import 'package:flutter/material.dart';

class FieldPreviewer extends StatelessWidget {
  final String title;
  final List<String> data;
  const FieldPreviewer({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 2,
                  child: Container(color: Colors.grey.shade400),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
                physics: const BouncingScrollPhysics(),
                children: data
                    .map((v) => Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text(v,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(height: 1.0)),
                        ))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
