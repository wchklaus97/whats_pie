import 'dart:math';
import 'package:flutter/material.dart';
import 'package:whats_pie/models/chat_info.dart';
import 'package:huge_listview/huge_listview.dart';
import 'package:whats_pie/common/bubble/sys_msg_bubble.dart';
import 'package:whats_pie/common/listview/custom_huge_list.dart';
import 'package:whats_pie/bloc/chat_reader_bloc/chat_reader_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_previewer/attachment_widget.dart';
import 'package:whats_pie/pages/chat_record_preview_page/chat_record_previewer/msg_widget.dart';

class ChatListWidget extends StatefulWidget {
  final ChatInfo chatInfo;
  final ChatReaderBloc chatReaderBloc;

  const ChatListWidget(
      {super.key, required this.chatInfo, required this.chatReaderBloc});

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
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          widget.chatInfo.selectedUser != null && widget.chatInfo.users != null
              ? Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            width <= 300
                                ? const SizedBox()
                                : const Row(
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: 4),
                                      Text(
                                        "Selected User",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                            width <= 750
                                ? const SizedBox()
                                : DropdownButton<String>(
                                    value: widget.chatInfo.selectedUser,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                    items: widget.chatInfo.users!
                                        .map((String user) {
                                      final isSelected =
                                          widget.chatInfo.selectedUser == user;
                                      return DropdownMenuItem<String>(
                                        value: user,
                                        child: Text(
                                          user,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: isSelected
                                                  ? FontWeight.bold
                                                  : null,
                                              color: isSelected
                                                  ? Colors.black
                                                  : Colors.black26),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (user) {
                                      widget.chatReaderBloc.add(
                                          ChatReaderSwitch(
                                              user: user!,
                                              chatInfo: widget.chatInfo));
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 2),
                  ],
                )
              : const SizedBox(),
          Expanded(
            child: LayoutBuilder(builder: (context, boxConstraints) {
              _contlr = HugeListViewController(
                  totalItemCount: widget.chatInfo.chatMsg.length);
              return SizedBox(
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxHeight,
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
                    final isLastMsg =
                        index == widget.chatInfo.chatMsg.length - 1;
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
                    if (chatMsg.isAttachmentValid == true &&
                        chatMsg.attachmentName != null &&
                        chatMsg.attachmentFile != null &&
                        chatMsg.attachmentType != null) {
                      return AttachmentWidget(
                        isLastMsg: isLastMsg,
                        dateTime: chatMsg.dateTime,
                        attachmentType: chatMsg.attachmentType!,
                        attachmentName: chatMsg.attachmentName!,
                        attachmentFile: chatMsg.attachmentFile!,
                        hasTopPadding: isFirstMsg,
                        isSelectedUser:
                            chatMsg.sender == widget.chatInfo.selectedUser,
                      );
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
              );
            }),
          ),
        ],
      ),
    );
  }
}
