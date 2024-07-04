import 'dart:math';
import 'package:flutter/material.dart';
import 'package:whats_pie/models/chat_info.dart';
import 'package:huge_listview/huge_listview.dart';
import 'package:whats_pie/common/bubble/sys_msg_bubble.dart';
import 'package:whats_pie/common/listview/custom_huge_list.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_previewer/msg_widget.dart';

class ChatListWidget extends StatefulWidget {
  final ChatInfo chatInfo;
  const ChatListWidget({super.key, required this.chatInfo});

  @override
  State<ChatListWidget> createState() => ChatListWidgetState();
}

class ChatListWidgetState extends State<ChatListWidget> {
  final int pageSize = 50;
  late HugeListViewController _contlr;
  late ValueNotifier<int> _indexNotifi;
  late ItemScrollController _scrollContlr;
  late ValueNotifier<bool> _allowScrollToEndNotifi;

  Future<List<String>> _loadPage(int page, int pageSize) async {
    int from = page * pageSize;
    int to = min(_contlr.totalItemCount, from + pageSize);

    return widget.chatInfo.chatMsg.isEmpty
        ? []
        : widget.chatInfo.chatMsg
            .sublist(from, to)
            .map((chatMessage) => chatMessage.msgs!.toString())
            .toList();
  }

  @override
  void initState() {
    super.initState();
    _indexNotifi = ValueNotifier(0);
    _scrollContlr = ItemScrollController();
    _allowScrollToEndNotifi = ValueNotifier(false);
  }

  @override
  void dispose() {
    _contlr.dispose();
    _indexNotifi.dispose();
    _allowScrollToEndNotifi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      _contlr = HugeListViewController(
          totalItemCount: widget.chatInfo.chatMsg.length);
      return Container(
        width: boxConstraints.maxWidth,
        height: boxConstraints.maxHeight,
        color: Colors.grey.shade200,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomHugeListView<String>(
                key: UniqueKey(),
                indexChanged: (v) {
                  _indexNotifi.value = v;
                },
                pageSize: pageSize,
                startIndex: 0,
                listViewController: _contlr,
                pageFuture: (page) => _loadPage(page, pageSize),
                thumbBuilder: (backgroundColor, drawColor, height, index,
                        alwaysVisibleScrollThumb, thumbAnimation) =>
                    const SizedBox(),
                alwaysVisibleThumb: false,
                scrollController: _scrollContlr,
                placeholderBuilder: (ctx, index) {
                  double margin = Random().nextDouble() * 50;
                  return Padding(
                    padding: EdgeInsets.fromLTRB(3, 3, 3 + margin, 3),
                    child: Container(height: 14, color: Colors.grey),
                  );
                },
                itemBuilder: (ctx, index, String entry) {
                  final isFirstMsg = index == 0;
                  final isLastMsg = index == widget.chatInfo.chatMsg.length - 1;
                  if (index >= widget.chatInfo.chatMsg.length) {
                    return const SizedBox();
                  }
                  final chatMsg = widget.chatInfo.chatMsg[index];
                  if (chatMsg.sender == null) {
                    if (chatMsg.msgs!.length > 1) {
                      return Column(
                        children: chatMsg.msgs!
                            .map((msg) => SysMsgBubble(
                                isFirstMsg: isFirstMsg &&
                                    chatMsg.msgs!.indexOf(msg) == 0,
                                msg: chatMsg.msgs.toString()))
                            .toList(),
                      );
                    }
                    return SysMsgBubble(
                        isFirstMsg: isFirstMsg, msg: chatMsg.msgs!.first);
                  }
                  return MsgWidget(
                    isLastMsg: isLastMsg,
                    dateTime: chatMsg.dateTime,
                    hasTopPadding: isFirstMsg,
                    msgs: chatMsg.msgs,
                    isSelectedUser:
                        chatMsg.sender == widget.chatInfo.selectedUser,
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
