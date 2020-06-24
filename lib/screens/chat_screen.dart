import 'package:firebaseChatApp/widgets/chat/messages.dart';
import 'package:firebaseChatApp/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FlutterChat'),
          actions: [
            DropdownButton(
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              },
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Logout')
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(child: Messages()),
              NewMessage(),
            ],
          ),
        ));
  }
}
