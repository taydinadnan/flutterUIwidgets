import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/models/message.dart';
import 'package:flutter_ui_widgets/pages/message_page.dart';
import 'package:flutter_ui_widgets/widgets/motion_route.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialMotionRoutes.sharedAxis(
                    MessagePage(message: messages[index]),
                    SharedAxisTransitionType.horizontal),
              );
            },
            leading: const CircleAvatar(),
            title: Hero(
              tag: 'msg-${messages[index].id}',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  messages[index].author,
                ),
              ),
            ),
            subtitle: Text(
              messages[index].content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(messages[index].sentTime),
          );
        },
      ),
    );
  }
}
