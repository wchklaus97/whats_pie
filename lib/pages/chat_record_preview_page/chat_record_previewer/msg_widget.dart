import 'package:flutter/material.dart';
import 'package:whats_pie/common/bubble/msg_bubble.dart';

class MsgWidget extends StatelessWidget {
  final String? msg;
  final String? dateTime;
  final bool isLastMsg;
  final bool hasTopPadding;
  final bool isSelectedUser;
  const MsgWidget({
    super.key,
    required this.msg,
    required this.dateTime,
    required this.isSelectedUser,
    this.isLastMsg = false,
    this.hasTopPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: hasTopPadding ? 42.0 : 2.0,
          bottom: 2.0 + (isLastMsg ? 20.0 : 0.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          msg != null
              ? MsgBubble(
                  delivered: true,
                  isSender: isSelectedUser,
                  text: msg!,
                  color: isSelectedUser
                      ? const Color.fromARGB(255, 15, 190, 91)
                      : Colors.white,
                  tail: false,
                  textStyle: TextStyle(
                      color: isSelectedUser ? Colors.white : Colors.black,
                      fontSize: 16),
                )
              : const SizedBox(),
          dateTime != null
              ? Align(
                  alignment: isSelectedUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: isSelectedUser
                        ? const EdgeInsets.only(right: 12.0, top: 2.0)
                        : const EdgeInsets.only(left: 12.0, top: 4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        color: isSelectedUser
                            ? const Color.fromARGB(255, 15, 190, 91)
                                .withOpacity(0.8)
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        child: Text(
                          dateTime!,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: isSelectedUser ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
