// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncomingCallView extends ConsumerWidget {
  const IncomingCallView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Text("AVC"),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    color: Colors.grey,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text("Oriakhi Collins"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControlButton(
                  color: Colors.red,
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                ControlButton(
                  onTap: () {},
                  color: Colors.green,
                  icon: const Icon(
                    Icons.check_rounded,
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

class ControlButton extends StatelessWidget {
  final Color color;
  final Icon icon;
  final void Function()? onTap;

  const ControlButton({
    super.key,
    required this.color,
    required this.icon,
    this.onTap,
  });
  final double size = 45;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
