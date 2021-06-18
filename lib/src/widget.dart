import 'package:flutter/cupertino.dart';
import 'list_widget.dart';

// Smallest possible widget
class EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox.shrink();
}

extension WidgetModifier on Widget {

  // Wraps widget in a Padding widget
  Widget xPadding([EdgeInsetsGeometry value = const EdgeInsets.all(16)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  // Wraps widget in a Padding widget with EdgeInsets.all value
  Widget xPadAll([double value = 0.0]) {
    return this.xPadding(EdgeInsets.all(value));
  }

  // Wraps widget in a Padding widget with EdgeInsets.symmetric value
  Widget xPadSym({double h = 0.0, double v = 0.0}) {
    return this.xPadding(EdgeInsets.symmetric(horizontal: h, vertical: v));
  }

  // Wraps widget in a Padding widget with EdgeInsets.symmetric value
  Widget xPadOnly({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0, }) {
    return this.xPadding(EdgeInsets.only(left: left, top: top, right: right, bottom: bottom));
  }

  // Wraps widget in an Align widget
  Widget xAlign([Alignment alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  // Wraps widget in a Flexible widget
  Widget xFlexible([int flex = 1]) {
    return Flexible(
      flex: flex,
      child: this,
    );
  }
  // Wraps widget in an Expanded widget
  Widget xExpanded() {
    return Expanded(
      child: this,
    );
  }

  // Wraps widget in a Container widget with a color
  Widget xColoredContainer(Color color) {
    return Container(
      color: color,
      child: this,
    );
  }

  // Wraps widget in a Container widget with a Box Decoration
  Widget xBoxDecorContainer(BoxDecoration boxDecoration) {
    return Container(
      decoration: boxDecoration,
      child: this,
    );
  }

  // Wraps widget in a SizedBox widget
  Widget xSizedBox({double height = 50, double width = 50}) {
    return SizedBox(
      height: height, width: width,
      child: this,
    );
  }

  // Wraps widget in a Transform.scale widget
  Widget xScale(double value) {
    return Transform.scale(
      scale: value,
      child: this,
    );
  }

  // Wraps widget in a Transform.translate widget
  Widget xTranslate({double dx = 0, double dy = 0}) {
    return Transform.translate(
      offset: Offset(dx, dy),
      child: this,
    );
  }

  // Wraps widget in a Transform.rotate widget
  Widget xRotate(double angle, [Offset origin = Offset.zero]) {
    return Transform.rotate(
      origin: origin,
      angle: angle,
      child: this,
    );
  }

  // Rotates and then translates widget
  Widget xRotateTranslate(double angle, {double dx = 0, double dy = 0} ) {
    return this.xRotate(angle).xTranslate(dx: dx, dy: dy);
  }

  // Wraps widget in an Opacity widget
  Widget xOpacity(double value) {
    return Opacity(
      opacity: value < 0.0 ? 0.0 : value > 1.0 ? 1.0 : value,
      child: this,
    );
  }

  // Renders the widget invisible and nullifies all interactivity, but maintains spacing
  Widget xInvisibleIgnore() {
    return Visibility(
        visible: false,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: IgnorePointer(
            child: this));
  }

  // Wraps the widget in a Hero widget with a tag
  Widget xHero(Object tag) {
    return Hero(child: this, tag: tag);
  }

  // Returns this widget only if the condition is fulfilled, otherwise returns an EmptyWidget
  Widget xEmptyUnless(bool condition){
    return condition ? this : EmptyWidget();
  }

  // Returns a stack of this and the provided widget
  Widget xStackThis(Widget toStack, [Alignment alignment = Alignment.center]){
    return [this].xStackThis(toStack, alignment);
  }

  // Returns a stack of this and the provided widgets
  Widget xStackThese(List<Widget> toStack, [Alignment alignment = Alignment.center]){
    return [this].xStackThese(toStack, alignment);
  }

}