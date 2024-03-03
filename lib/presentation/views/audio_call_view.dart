// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agora_voice_call/presentation/views/incoming_call_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioCallViewDTO {
  /// name of the channel
  final String channelName;

  /// name of the person placing the call
  final String callerName;

  /// ID of the person placing the call
  final String callerID;

  /// ID of the reciever
  final String receiverID;

  /// Name of the receiver
  final String receiverName;

  /// boolean varable used to  check the caller
  final bool isCaller;
  AudioCallViewDTO({
    required this.channelName,
    required this.callerName,
    required this.callerID,
    required this.receiverID,
    required this.receiverName,
    required this.isCaller,
  });
}

class AudioCallView extends ConsumerStatefulWidget {
  final AudioCallViewDTO data;
  const AudioCallView({super.key, required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AudioCallViewState();
}

class _AudioCallViewState extends ConsumerState<AudioCallView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            const BackButton(),
            const Expanded(
              child: Column(
                children: [],
              ),
            ),
            Row(
              children: [
                ControlButton(
                  onTap: () {},
                  color: const Color(0xff292929),
                  icon: const Icon(
                    Icons.mic_none_rounded,
                    color: Colors.white,
                  ),
                ),
                ControlButton(
                  onTap: () {},
                  color: Colors.red,
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  ),
                ),
                ControlButton(
                  onTap: () {},
                  color: const Color(0xff292929),
                  icon: const Icon(
                    Icons.volume_up_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
