// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agora_voice_call/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agora_voice_call/presentation/views/audio_call_view.dart';

class User {
  final String id;
  final String name;
  final String about;
  final String? image;
  User({
    required this.id,
    required this.name,
    required this.about,
    this.image,
  });

  static List<User> users = [
    User(
      id: '02',
      name: '',
      about: '',
    )
  ];
}

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final currentUser = User(
    id: '01',
    name: 'Bravo1',
    about: 'Team Leader of Havic Coorp',
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            User.users.length,
            (index) => ListTile(
              onTap: () {
                final channelName = Helpers.generateChannelName();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AudioCallView(
                      data: AudioCallViewDTO(
                        channelName: channelName,
                        callerName: currentUser.name,
                        callerID: currentUser.id,
                        receiverID: User.users[index].id,
                        receiverName: User.users[index].name,
                        isCaller: true,
                      ),
                    ),
                  ),
                );
              },
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.red,
              ),
              title: Text(
                User.users[index].name,
              ),
              subtitle: Text(
                User.users[index].about,
              ),
            ),
          )
        ],
      ),
    );
  }
}
