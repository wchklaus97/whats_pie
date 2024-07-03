import 'package:flutter/material.dart';

class SysMsgBubble extends StatelessWidget {
  final bool isFirstMsg;
  final String? msg;
  const SysMsgBubble({
    super.key,
    required this.msg,
    this.isFirstMsg = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: isFirstMsg ? 30 : 12, bottom: 12),
      child: msg != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    color:
                        const Color.fromARGB(255, 15, 190, 91).withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 2.0),
                    child: Text(
                      msg!,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
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
