import 'package:flutter/material.dart';

class SysMsgBubble extends StatelessWidget {
  final bool isFirstMsg;
  final String? msg;
  const SysMsgBubble({super.key, required this.msg, this.isFirstMsg = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: isFirstMsg ? 30 : 12, bottom: 12, left: 12.0, right: 12.0),
      child: msg != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      color: const Color.fromARGB(255, 15, 190, 91)
                          .withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 2.0),
                      child: Text(
                        msg!,
                        maxLines: 100,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
