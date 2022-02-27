import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_action/slide_action.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({Key? key}) : super(key: key);

  String _currentTimeString() {
    return DateFormat.Hm().format(DateTime.now());
  }

  String _currentDayString() {
    return DateFormat("EEEE, MMMM d").format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/wallpaper.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 120,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.5, 0.5],
                        colors: [
                          Colors.white12,
                          Colors.black12,
                          Colors.black54,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _currentTimeString(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                        Text(
                          _currentDayString(),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.5, 0.5],
                        colors: [
                          Colors.white38,
                          Colors.white24,
                          Colors.black54,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SlideAction(
                        thumbWidth: 80,
                        trackBuilder: (buildContext, currentState) {
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black,
                                  Colors.grey.shade800,
                                ],
                              ),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: Center(
                              child: Opacity(
                                opacity: lerpDouble(
                                        1,
                                        0,
                                        currentState.thumbFractionalPosition *
                                            2)!
                                    .clamp(0.0, 1.0),
                                child: Text(
                                  "Slide to unlock",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          );
                        },
                        thumbBuilder: (context, currentState) {
                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.grey,
                                ],
                              ),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: const Icon(CupertinoIcons.arrow_right),
                          );
                        },
                        action: () async {
                          await Navigator.of(context).pushNamed("/home");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
