/// flutter:
///   fonts:
///    - family:  CustomIcons
///      fonts:
///       - asset: fonts/CustomIcons.ttf
///
///
///
import 'package:flutter/widgets.dart';

class CustomIcons {
  CustomIcons._();

  static const _kFontFam = 'CustomIcons';

  static const IconData lightmode = const IconData(
    0xe000,
    fontFamily: _kFontFam,
  );
  static const IconData darkmode = const IconData(
    0xe001,
    fontFamily: _kFontFam,
  );
  static const IconData close = const IconData(
    0xe002,
    fontFamily: _kFontFam,
  );
  static const IconData menu = const IconData(
    0xe003,
    fontFamily: _kFontFam,
  );
  static const IconData back = const IconData(
    0xe004,
    fontFamily: _kFontFam,
  );
  static const IconData share = const IconData(
    0xe005,
    fontFamily: _kFontFam,
  );
  static const IconData unliked = const IconData(
    0xe006,
    fontFamily: _kFontFam,
  );
  static const IconData liked = const IconData(
    0xe007,
    fontFamily: _kFontFam,
  );
  static const IconData go = const IconData(
    0xe008,
    fontFamily: _kFontFam,
  );
  static const IconData remove = const IconData(
    0xe009,
    fontFamily: _kFontFam,
  );
}
