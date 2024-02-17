import 'package:easy_cart/components/button/flat.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:flutter/cupertino.dart';

class LoadingPageBottomButton<T> extends StatelessWidget {
  /// 페이지 하단 버튼 관련 컴포넌트 입니다.
  ///
  /// [_loadFuture]의 동작 정의 되어있는 함수가 실행 됩니다.
  /// [EcFlatButton]를 사용하며, [EcFlatButton]를 [ValueListenableBuilder]가 감싸고 있고,
  /// [ValueListenableBuilder]를 [Container]감싸고 있습니다.
  ///
  /// [Container.padding] 값에 따라 버튼의 사이즈가 정의 됩니다.
  LoadingPageBottomButton({
    super.key,
    this.bottomPadding,
    this.buttonColor,
    this.textColor,
    this.circleColor,
    this.onPressed,
    this.callback,
    this.border,
    this.radius,
    this.highlightColor,
    required this.btnText,
  });

  /// 버튼 눌렀을때 동작하는 함수 입니다.
  ///
  /// 특정 타입[T]에 해당하는 값을 뱉어 return 할 수 있습니다.
  /// 이를 이용해 [callback]함수와 연계 하여 사용 할 수 있습니다.

  final Future<T> Function()? onPressed;

  /// [onPressed]함수 이후에 실행 되는 함수입니다.
  ///
  /// [onPressed]는 특정 타입[T]에 해당하는 값을 뱉어 return 할 수 있는데
  /// 이를 받아 특정 동작을 실행 할 수 있습니다.

  final Function(T)? callback;

  /// 버튼을 감싸고 있는[Container]에 적용되는 [Container.padding]을 위해 넘기는 값입니다.
  /// null값이 가능합니다.
  ///
  /// 이 값에 따라 [_bottomPadding]에서 내보내는 값이 달라지게 됩니다.

  final EdgeInsetsGeometry? bottomPadding;

  /// [EcFlatButton]에 적용되는 [EcFlatButton.buttonColor]을 위해 넘기는 값입니다.
  /// null값이 가능합니다.
  ///
  /// 이 값에 따라 [_backgroundColor]에서 내보내는 값이 달라지게 됩니다.

  final Color? buttonColor;

  /// [EcFlatButton]에 적용되는 [EcFlatButton.buttonColor]을 위해 넘기는 값입니다.
  /// null값이 가능합니다.
  ///
  /// 이 값에 따라 [_backgroundColor]에서 내보내는 값이 달라지게 됩니다.

  final Color? highlightColor;

  /// [EcFlatButton.innerWidget]에 설정된 [EcFlatTextWidget.style]의 color값 입니다.
  /// null값이 가능합니다.
  ///
  /// 이 값에 따라 [_textColor]에서 내보내는 값이 달라지게 됩니다.

  final Color? textColor;

  /// [CupertinoActivityIndicator.color]값 입니다.
  /// null값이 가능합니다.
  ///
  /// 이 값에 따라 [_circleColor]에서 내보내는 값이 달라지게 됩니다.

  final Color? circleColor;

  /// 버튼의 텍스트 입니다. 필수 사항 입니다.

  final String btnText;

  /// 버튼의 Loading 상태값 입니다.
  /// [_loadFuture]에서 상태값을 변경 하게 됩니다.
  ///
  /// [ValueListenableBuilder]를 통해서 [ValueNotifier]의 상태값을 추적하고 있습니다.

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  factory LoadingPageBottomButton.cta({
    Future<T> Function()? onPressed,
    Function(T)? callback,
    Color? buttonColor,
    Color? highlightColor,
    Color? textColor,
    Color? circleColor,
    BoxBorder? border,
    BorderRadiusGeometry? radius,
    required String btnText,
  }) =>
      LoadingPageBottomButton(
        btnText: btnText,
        onPressed: onPressed,
        callback: callback,
        highlightColor: highlightColor,
        circleColor: circleColor,
        bottomPadding: EdgeInsets.zero,
        border: border,
        radius: radius,
        buttonColor:
            onPressed == null ? EasyCartColorMap().gray.shade300 : buttonColor,
        textColor:
            onPressed == null ? EasyCartColorMap().gray.shade500 : textColor,
      );

  factory LoadingPageBottomButton.ctaWithDivider({
    Future<T> Function()? onPressed,
    Function(T)? callback,
    Color? buttonColor,
    Color? textColor,
    Color? circleColor,
    BoxBorder? border,
    BorderRadiusGeometry? radius,
    required String btnText,
  }) =>
      LoadingPageBottomButton(
        btnText: btnText,
        onPressed: onPressed,
        callback: callback,
        buttonColor:
            onPressed == null ? EasyCartColorMap().gray.shade300 : buttonColor,
        textColor:
            onPressed == null ? EasyCartColorMap().gray.shade500 : textColor,
        circleColor: circleColor,
        border: Border(
          top: BorderSide(color: EasyCartColorMap().gray.shade200),
        ),
        radius: radius,
      );

  /// 버튼 눌렀을때 동작하는 함수 입니다.
  ///
  /// 먼저 [_isLoading]을의 값을 true로 만들고, [onPressed]함수를 동기적으로 실행 합니다.
  /// [onPressed] 함수가 끝나면 [callback]함수가 존재 할시 이 함수를 promise 실행하고
  /// 존재 하지 않으면 [_nullCallback]을 실행 시킵니다.
  ///
  /// 마지막으로 finally에 정의된 것에 따라
  /// [_isLoading]을 false로 만들며 모든 동작이 끝납니다.

  Future<void> _loadFuture() async {
    _isLoading.value = true;
    try {
      await onPressed!().then(callback ?? _nullCallback);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading.value = false;
    }
  }

  /// [callback]함수 존재 하지 않으면 [_nullCallback]을 실행하는 함수 입니다.

  _nullCallback(T value) => null;

  /// 버튼을 감싸고 있는[Container]에 적용되는 [Container.padding]값입니다.
  ///
  /// [bottomPadding]이 null값일 경우 기본으로 정의된 값을 사용하게 됩니다.

  ///
  EdgeInsetsGeometry get _bottomPadding =>
      bottomPadding ??
      const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 16, top: 4);

  /// [EcFlatButton.buttonColor]에 적용되는 값입니다.
  ///
  /// [buttonColor]이 null값일 경우 기본으로 정의된 값을 사용하게 됩니다.
  /// [_isLoading]의 값에 따라 [Color.withOpacity]를 이용해서 투명도를 조절해서 반영하세 됩니다.

  Color get _backgroundColor {
    final Color color = buttonColor ?? EasyCartColorMap().primary;
    if (_isLoading.value) {
      return color.withOpacity(0.5);
    } else {
      return color;
    }
  }

  /// [EcFlatTextWidget.style] color 값 입니다.
  ///
  /// [textColor]이 null값일 경우 기본으로 [EasyCartColorMap()hite]를 사용하게 됩니다.

  Color get _textColor => textColor ?? EasyCartColorMap().white;

  /// [CupertinoActivityIndicator.color]의 값입니다.
  ///
  /// [circleColor]이 null값일 경우 기본으로 [EasyCartColorMap()hite]를 사용하게 됩니다.

  Color get _circleColor => circleColor ?? EasyCartColorMap().white;

  /// 기본 설정된 [BorderRadius]값 입니다.

  final BorderRadiusGeometry? radius;
  BorderRadiusGeometry get _radius => radius ?? BorderRadius.circular(4);

  /// 기본 설정된 높이값 입니다.

  double get _height => 56;

  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: _bottomPadding,
      decoration: BoxDecoration(border: border),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isLoading,
        builder: (ctx, isLoading, _) => EcFlatButton(
          width: MediaQuery.of(context).size.width,
          height: _height,
          radius: _radius,
          buttonColor: _backgroundColor,
          highlightColor: highlightColor,
          onPressed: (isLoading || onPressed == null) ? null : _loadFuture,
          innerWidget: isLoading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CupertinoActivityIndicator(
                    color: _circleColor,
                  ),
                )
              : EcFlatTextWidget(
                  key: ValueKey<String>(btnText),
                  text: btnText,
                  radius: radius,
                  style: context.label1.copyWith(
                    color: _textColor,
                  ),
                ),
        ),
      ),
    );
  }
}
