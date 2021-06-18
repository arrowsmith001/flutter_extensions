
import 'package:flutter/cupertino.dart';

extension WidgetListModifier on List<Widget> {

  // Returns Row with provided widgets as children
  Widget xRow({bool expandChildren = false, MainAxisAlignment mainAxisAlign = MainAxisAlignment.start}){
    List<Widget> children;
    if(!expandChildren) children = this;
    else children = List.from(this).map<Widget>((w) => w.xExpanded()).toList(growable: false);
    return Row(mainAxisAlignment: mainAxisAlign, children: children);
  }

  // Returns Column with provided widgets as children
  Widget xColumn({bool expandChildren = false, MainAxisAlignment mainAxisAlign = MainAxisAlignment.start}){
    List<Widget> children;
    if(!expandChildren) children = this;
    else children = List.from(this).map<Widget>((w) => w.xExpanded()).toList(growable: false);
    return Column(mainAxisAlignment: mainAxisAlign, children: children);
  }

  // Returns a stack of these
  Widget xStack([Alignment alignment = Alignment.center]){
    return Stack(children: this, alignment: alignment);
  }

  // Returns a stack of these and the provided widget
  Widget xStackThis(Widget toStack, [Alignment alignment = Alignment.center]){
    return (this..add(toStack)).xStack(alignment);
  }

  // Returns a stack of these and the provided widgets
  Widget xStackThese(List<Widget> toStack, [Alignment alignment = Alignment.center]){
    return (this..addAll(toStack)).xStack(alignment);
  }
}
