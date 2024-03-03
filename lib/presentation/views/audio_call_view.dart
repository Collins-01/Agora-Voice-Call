// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioCallViewDTO {
  /// name
  final String channelName;
  final String callerName;
  final String callerID;
  final String receiverID;
  AudioCallViewDTO({
    required this.channelName,
    required this.callerName,
    required this.callerID,
    required this.receiverID,
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
    return Scaffold();
  }
}
