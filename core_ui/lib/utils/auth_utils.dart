import 'package:flutter/material.dart';

class AuthUtils {
  static Widget buildShuttle(
    BuildContext context,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    final toText = DefaultTextStyle.of(toHeroContext).style;
    return DefaultTextStyle(
      style: toText,
      child: toHeroContext.widget,
    );
  }
}
