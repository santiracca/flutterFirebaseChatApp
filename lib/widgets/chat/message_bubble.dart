import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String userName;
  final Key key;
  MessageBubble(this.message, this.isMe, this.userName, {this.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 140,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: !isMe
                        ? Colors.grey[300]
                        : Theme.of(context).accentColor),
              ),
              Text(
                message,
                textAlign: isMe ? TextAlign.end : TextAlign.start,
                style: TextStyle(
                  color: isMe
                      ? Colors.black
                      : Theme.of(context).accentTextTheme.headline1.color,
                ),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
