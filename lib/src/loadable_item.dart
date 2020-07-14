import 'package:flutter/material.dart';
import 'package:flutter_platform_core/flutter_platform_core.dart';

class LoadableItem extends StatelessWidget {
  const LoadableItem({
    @required this.child,
    @required this.requestState,
    @required this.errorWidget,
    this.padding,
    this.backgroundColor,
  })  : assert(child != null),
        assert(requestState != null);

  final Widget child;
  final Widget errorWidget;
  final RequestState requestState;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: child),
        if (requestState.isInProgress)
          Positioned.fill(child: _getLoadingWidget()),
        if (requestState.isFailed)
          Positioned.fill(child: _getErrorWidget(context)),
      ],
    );
  }

  Widget _getLoadingWidget() {
    return Container(
      padding: padding,
      color: backgroundColor ?? Colors.white,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _getErrorWidget(BuildContext context) {
    return Container(
      padding: padding,
      color: backgroundColor ?? Colors.white,
      child: Center(
        child: errorWidget ?? const SizedBox(),
      ),
    );
  }
}