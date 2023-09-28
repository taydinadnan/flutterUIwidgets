import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/models/message.dart';

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
            onTap: () {},
            leading: const CircleAvatar(),
            title: Text(
              messages[index].author,
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
