import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoezam/ui/views/home.dart';
import 'package:shoezam/ui/views/menu.dart';
import 'package:shoezam/ui/widgets/page_transtion/circular_reveal_clipper.dart';

class Router {
  static Route generateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => HomePage());
      case 'menu':
        return RevealRoute(
          page: MenuPage(
            lastPagePath: settings.arguments,
          ),
          maxRadius: 1000,
          centerAlignment: Alignment.topLeft,
        );
      default:
        return CupertinoPageRoute(builder: (_) => HomePage());
    }
  }
}

class RevealRoute extends PageRouteBuilder {
  final Widget page;
  final AlignmentGeometry centerAlignment;
  final Offset centerOffset;
  final double minRadius;
  final double maxRadius;

  /// Reveals the next item pushed to the navigation using circle shape.
  ///
  /// You can provide [centerAlignment] for the reveal center or if you want a
  /// more precise use only [centerOffset] and leave other blank.
  ///
  /// The transition doesn't affect the entry screen so we will only touch
  /// the target screen.
  RevealRoute({
    @required this.page,
    this.minRadius = 0,
    @required this.maxRadius,
    this.centerAlignment,
    this.centerOffset,
  })  : assert(centerOffset != null || centerAlignment != null),
        super(
          /// We could override pageBuilder but it's a required parameter of
          /// [PageRouteBuilder] and it won't build unless it's provided.
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ClipPath(
      clipper: CircularRevealClipper(
        fraction: animation.value,
        centerAlignment: centerAlignment,
        centerOffset: centerOffset,
        minRadius: minRadius,
        maxRadius: maxRadius,
      ),
      child: child,
    );
  }
}
