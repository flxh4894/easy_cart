import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:flutter/material.dart';

class EcFlatButton extends StatelessWidget {
  /// FlatButton의 역할을 하는 CustomButton 입니다.
  ///
  /// [MaterialButton]를 감싸는 [Container]가 존재하며,
  /// 이를 통해 버튼의 스타일 및 Overlay를 custom 할 수 있도록 했습니다.
  const EcFlatButton({
    super.key,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.shape,
    this.buttonColor,
    this.highlightColor,
    this.radius,
    this.border,
    this.onPressed,
    this.constraints,
    this.alignment,
    required this.innerWidget,
    this.boxShadow,
  });

  /// 버튼의 width 입니다. [Container]에 적용 됩니다.

  final double? width;

  /// 버튼의 height 입니다. [Container]에 적용 됩니다.

  final double? height;

  /// 버튼의 margin 입니다. [Container]에 적용 됩니다.

  final EdgeInsetsGeometry margin;

  /// 버튼의 constraints 입니다. [Container]에 적용 됩니다.

  final BoxConstraints? constraints;

  /// 버튼의 alignment 입니다. [Container]에 적용 됩니다.

  final AlignmentGeometry? alignment;

  /// 버튼의 buttonColor 입니다. [Container.decoration]에 적용 됩니다.

  final Color? buttonColor;
  Color? get _buttonColor => buttonColor ?? EasyCartColorMap().surfaceColor;

  /// 버튼의 buttonColor 입니다. [Container.decoration]에 적용 됩니다.

  final Color? highlightColor;
  Color? get _highlightColor =>
      highlightColor ?? EasyCartColorMap().modeStateOverlay.white.pressed;

  /// 버튼의 radius 입니다. [Container.decoration]에 적용 됩니다.

  final BorderRadiusGeometry? radius;

  /// 버튼의 boxShadow 입니다. [Container.decoration]에 적용 됩니다.

  final List<BoxShadow>? boxShadow;

  /// 버튼의 border 입니다. [Container.decoration]에 적용 됩니다.

  final BoxBorder? border;

  /// 버튼의 shape 입니다. [Container.decoration]과 [MaterialButton.shape]에 적용 됩니다.

  final ShapeBorder? shape;

  /// 버튼의 padding 입니다. [MaterialButton]에 적용 됩니다.

  final EdgeInsetsGeometry padding;

  /// 버튼의 onPressed 입니다. [MaterialButton]에 적용 됩니다.

  final Function? onPressed;

  /// [MaterialButton.child]에 적용 됩니다.

  final Widget innerWidget;

  factory EcFlatButton.withTextWidget({
    required String text,
    EdgeInsetsGeometry textPadding = EdgeInsets.zero,
    double? height = 52,
    double? width,
    TextStyle? textStyle,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    ShapeBorder? shape,
    Color buttonColor = Colors.transparent,
    BorderRadiusGeometry? radius,
    BoxBorder? border,
    BoxConstraints? constraints,
    AlignmentGeometry? alignment,
    Function? onPressed,
    List<BoxShadow>? boxShadow,
    Color? highlightColor,
  }) {
    return EcFlatButton(
      innerWidget: EcFlatTextWidget(
        text: text,
        radius: radius,
        padding: textPadding,
        style: textStyle,
      ),
      height: height,
      width: width,
      onPressed: onPressed,
      margin: margin,
      padding: padding,
      shape: shape,
      buttonColor: buttonColor,
      radius: radius,
      border: border,
      constraints: constraints,
      alignment: alignment,
      boxShadow: boxShadow,
      highlightColor: highlightColor,
    );
  }

  /// 버튼의 [ShapeBorder]입니다. [EcFlatButton.shape]이 null 일경우 기본 값이 사용 됩니다.

  ShapeBorder get _shape =>
      shape ??
      RoundedRectangleBorder(
        borderRadius: radius ?? BorderRadius.zero,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            constraints: constraints,
            alignment: alignment,
            padding: padding,
            decoration: BoxDecoration(
              color: _buttonColor,
              borderRadius: radius,
              border: border,
              boxShadow: boxShadow,
            ),
            child: innerWidget,
          ),
          Positioned.fill(
            child: MaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: (onPressed == null) ? null : () => onPressed!(),
              shape: _shape,
              minWidth: 0,
              elevation: 0,
              splashColor: Colors.transparent,
              highlightColor: _highlightColor,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EcFlatTextWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String text;
  final TextStyle? style;
  final BorderRadiusGeometry? radius;
  const EcFlatTextWidget({
    super.key,
    this.padding = EdgeInsets.zero,
    this.radius,
    required this.text,
    this.style,
  });

  static TextStyle baseStyle(BuildContext context) => context.label1.copyWith(
        color: EasyCartColorMap().white,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(borderRadius: radius ?? BorderRadius.zero),
      child: Center(
        child: Text(
          text,
          style: style ?? baseStyle(context),
        ),
      ),
    );
  }
}
