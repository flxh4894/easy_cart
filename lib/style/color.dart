import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String? hexString) {
    if (hexString != null) {
      return Color(colorBuffer(hexString));
    } else {
      return Colors.white;
    }
  }

  static int colorBuffer(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return int.parse(buffer.toString(), radix: 16);
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  Color toConst() => this;
}

class ModeSystem extends ColorSwatch<String> {
  ModeSystem(int primary) : super(primary, {'toast': Color(primary)});

  Color get toast => this['toast']!;
}

class StateOverlayColor extends OverlayColor {
  StateOverlayColor({
    required int selected,
    required int pressed,
    required int enabled,
  }) : super(
          selected: selected,
          pressed: pressed,
        );

  Color get enabled => this['enabled']!;
}

class OverlayColor extends ColorSwatch<String> {
  OverlayColor({
    required int selected,
    required int pressed,
  }) : super(
          selected,
          {
            'selected': Color(selected),
            'pressed': Color(pressed),
          },
        );

  Color get selected => this['selected']!;
  Color get pressed => this['pressed']!;
}

abstract class ModeStateOverlay {
  OverlayColor get white;
  OverlayColor get black;
}

abstract class ColorModeMap {
  Color get navigationIc;
  Color get surfaceColor;
  ModeSystem get system;
  MaterialColor get grayScale;
  ModeStateOverlay get stateOverlay;
  Color get bgColor;
  Color get bgColorOverlay;
}

class LightStateOverlay extends ModeStateOverlay {
  @override
  OverlayColor get white => OverlayColor(
        selected: 0x4DFFFFFF,
        pressed: 0x33FFFFFF,
      );
  @override
  OverlayColor get black => OverlayColor(
        selected: 0x140C1064,
        pressed: 0x1A0C1064,
      );
}

class LightColorMode extends ColorModeMap {
  @override
  Color get navigationIc => const Color(0xFF9F9DB0);
  @override
  Color get surfaceColor => const Color(0xFFFFFFFF);
  @override
  ModeSystem get system => ModeSystem(0xB3151422);
  @override
  MaterialColor get grayScale => const MaterialColor(
        0xFF6F6F85,
        <int, Color>{
          100: Color(0xFFF3F3FA),
          200: Color(0xFFE5E7F2),
          300: Color(0xFFC7CADB),
          400: Color(0xFFA4A6B8),
          500: Color(0xFF8B8EA2),
          600: Color(0xFF6F6F85),
          700: Color(0xFF454456),
          800: Color(0xFF292636),
          900: Color(0xFF151422),
        },
      );

  @override
  ModeStateOverlay get stateOverlay => LightStateOverlay();
  @override
  Color get bgColor => const Color(0xFFF3F3FA);
  @override
  Color get bgColorOverlay => const Color(0x80F3F3FA);
}

class DarkStateOverlay extends ModeStateOverlay {
  @override
  OverlayColor get white => OverlayColor(
        selected: 0x1FFFFFFF,
        pressed: 0x14FFFFFF,
      );
  @override
  OverlayColor get black => OverlayColor(
        selected: 0x52000000,
        pressed: 0x33000000,
      );
}

class DarkColorMode extends ColorModeMap {
  @override
  Color get navigationIc => const Color(0xFFBABECF);
  @override
  Color get surfaceColor => const Color(0xFF1C1A2B);
  @override
  ModeSystem get system => ModeSystem(0x1AFFFFFF);
  @override
  MaterialColor get grayScale => const MaterialColor(
        0xFFF8E8E8E,
        <int, Color>{
          100: Color(0xFF24223C),
          200: Color(0xFF2F2E48),
          300: Color(0xFF484B64),
          400: Color(0xFF737692),
          500: Color(0xFF9FA2BB),
          600: Color(0xFFBFC1D5),
          700: Color(0xFFD5D8E8),
          800: Color(0xFFEBECF3),
          900: Color(0xFFFCFCFF),
        },
      );

  @override
  ModeStateOverlay get stateOverlay => DarkStateOverlay();
  @override
  Color get bgColor => const Color(0xFF24223C);
  @override
  Color get bgColorOverlay => const Color(0x8024223C);
}

class System extends ColorSwatch<String> {
  const System(int primary, Map<String, Color> swatch) : super(primary, swatch);

  Color get dim => this['dim']!;
  Color get error => this['error']!;
  Color get noti => this['noti']!;
}

class EasyCartColorMap {
  static final EasyCartColorMap _instance = EasyCartColorMap._internal();
  factory EasyCartColorMap() => _instance;
  EasyCartColorMap._internal();

  // Common Color
  final System _system = const System(0xFFF2392D, <String, Color>{
    'dim': Color(0x80000000),
    'error': Color(0xFFF2392D),
    'noti': Color(0xFFFE4848),
  });
  final Color _primary = const Color(0xFFFE4864);
  final Color _white = const Color(0xFFFFFFFF);
  final StateOverlayColor _stateOverlay = StateOverlayColor(
    selected: 0x1AFE4864,
    pressed: 0x1FFE4864,
    enabled: 0x14FE4864,
  );
  // Mode Color
  final Map<String, ColorModeMap> _colorModeMap = {
    'light': LightColorMode(),
    'dark': DarkColorMode(),
  };
  // Theme
  final List<Color> _sirenColor = const [Color(0xFF4F6BFF), Color(0xFFFF766D)];
  final Revenue _revenue = const Revenue(0xFF3F8CFF, {
    "minus": Color(0xFF3F8CFF),
    "plus": Color(0xFFFF4141),
  });
  final ModelColor _model = const ModelColor(0xFFFE4864, {
    "eight": Color(0xFFFE4864),
    "six": Color(0xFF9859FF),
    "four": Color(0xFF3577F6),
  });
  final BenchmarkColor _benchmark = const BenchmarkColor(0xFF2E68FD, {
    "snp500": Color(0xFFDEE5FE),
    "kospi": Color(0xFFFFE4D9),
  });
  final AssetsColor _assets = AssetsColor();
  final LabelColor _label = const LabelColor(0xFF9E3EFF, {
    "report": Color(0xFF9E3EFF),
    "investment": Color(0xFFE74B70),
    "guide": Color(0xFF2A8DE9),
    "event": Color(0xFFFE9F48),
    "contents": Color(0xFF00D88A),
  });

  final Color _kakao = const Color(0xFFFFDB1C);
  final Color _kb = const Color(0xFFFED700);

  final SirenColor _siren = const SirenColor(0xFFFF766D, {
    "crisis": Color(0xFFFF766D),
    "crisisOverlay": Color(0xFFFFEFEE),
  });

  // Method
  System get system => _system;
  Color get primary => _primary;
  Color get white => _white;
  OverlayColor get stateOverlay => _stateOverlay;

  // bool get isDark => OllyThemeMode.isDark; // Check Mode
  // ColorModeMap get _colorMap =>
  //     OllyThemeMode.isDark ? _colorModeMap['dark']! : _colorModeMap['light']!;
  ColorModeMap get _colorMap => _colorModeMap['light']!;
  Color get navigationIc => _colorMap.navigationIc;
  Color get surfaceColor => _colorMap.surfaceColor;
  ModeSystem get modeSystem => _colorMap.system;
  MaterialColor get gray => _colorMap.grayScale;
  ModeStateOverlay get modeStateOverlay => _colorMap.stateOverlay;
  Color get bgColor => _colorMap.bgColor;
  Color get bgColorOverlay => _colorMap.bgColorOverlay;
  List<Color> get sirenColor => _sirenColor;
  Revenue get revenue => _revenue;
  ModelColor get model => _model;
  BenchmarkColor get benchmark => _benchmark;
  AssetsColor get assets => _assets;
  LabelColor get label => _label;
  Color get kakao => _kakao;
  Color get kb => _kb;
  SirenColor get siren => _siren;
}

class Revenue extends ColorSwatch<String> {
  const Revenue(int primary, Map<String, Color> swatch)
      : super(primary, swatch);

  Color get minus => this['minus']!;
  Color get plus => this['plus']!;
}

class ModelColor extends ColorSwatch<String> {
  const ModelColor(int primary, Map<String, Color> swatch)
      : super(primary, swatch);

  Color get eight => this['eight']!;
  Color get six => this['six']!;
  Color get four => this['four']!;
}

class BenchmarkColor extends ColorSwatch<String> {
  const BenchmarkColor(int primary, Map<String, Color> swatch)
      : super(primary, swatch);

  Color get snp500 => this['snp500']!;
  Color get kospi => this['kospi']!;
}

class AssetsColor {
  Color get disabled => const Color(0x339EA0AE);
  Color get risklessTinted => const Color(0xCC4B49C6);
  Color get riskless => const Color(0xFF4B49C6);
  Color get riskyTinted => const Color(0xCCFF536E);
  Color get risky => const Color(0xFFFF536E);

  RisklessColor get risklessAssets => const RisklessColor(0xFF4B49C6, {
        'fi': Color(0xFF7A85EB),
        'cash': Color(0xFF4B49C6),
      });
  RiskyColor get riskyAssets => const RiskyColor(0xFFFF536E, {
        'dm': Color(0xFFFF536E),
        'em': Color(0xFFFF87A4),
        'ai': Color(0xFFFFB4C6),
        'fx': Color(0xFFFFD9EB),
      });
}

class RisklessColor extends ColorSwatch<String> {
  const RisklessColor(int primary, Map<String, Color> swatch)
      : super(primary, swatch);

  Color get fi => this['fi']!;
  Color get cash => this['cash']!;
}

class RiskyColor extends ColorSwatch<String> {
  const RiskyColor(int primary, Map<String, Color> swatch)
      : super(primary, swatch);

  Color get dm => this['dm']!;
  Color get em => this['em']!;
  Color get ai => this['ai']!;
  Color get fx => this['fx']!;
}

class LabelColor extends ColorSwatch<String> {
  const LabelColor(int primary, Map<String, Color> swatch)
      : super(primary, swatch);

  Color get report => this['report']!;
  Color get investment => this['investment']!;
  Color get guide => this['guide']!;
  Color get event => this['event']!;
  Color get contents => this['contents']!;
}

class SirenColor extends ColorSwatch<String> {
  const SirenColor(int primary, Map<String, Color> swatch)
      : super(primary, swatch);

  Color get crisis => this['crisis']!;
  Color get crisisOverlay => this['crisisOverlay']!;
}
