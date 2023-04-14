import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';
import 'dart:math' as math;

import '../themes/theme_utils.dart';
import '../utils/strings.dart';

class RocketBlock extends StatelessWidget {
  const RocketBlock(
      {super.key,
      required this.contentMargin,
      required this.rocketMargin,
      required this.takeoffWidth});

  final double contentMargin;
  final double rocketMargin;
  final double takeoffWidth;

  Widget _footerBlock(BuildContext context) {
    final theme = Theme.of(context);
    final styleTitle = theme.textTheme.titleLarge
        ?.copyWith(fontWeight: FontWeight.w300, height: 1.3, fontSize: 14);
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      alignment: Alignment.bottomRight,
      child: Text(
        Strings.footerText,
        textAlign: TextAlign.end,
        style: styleTitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const bottomMargin = 15.0;
    const colorHeightBase = 13.0;
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              const ColorLine(
                  color: Color(0xFFB71D77), height: colorHeightBase),
              ColorLine(
                  color: theme.colorScheme.defaultBackgroundWindowsColor,
                  height: colorHeightBase),
              const ColorLine(
                  color: Color(0xFFB71D77), height: colorHeightBase * 3),
              const ColorLine(
                  color: Color(0xFFEA55A1), height: colorHeightBase),
              const ColorLine(
                  color: Color(0xFFB71D77), height: colorHeightBase),
              const ColorLine(
                  color: Color(0xFFEA55A1), height: colorHeightBase * 3),
              const ColorLine(
                  color: Color(0xFFFF7081), height: colorHeightBase),
              const ColorLine(
                  color: Color(0xFFEA55A1), height: colorHeightBase),
              const ColorLine(
                  color: Color(0xFFFF7081), height: colorHeightBase * 3),
              const ColorLine(color: Colors.white, height: colorHeightBase),
              const ColorLine(
                  color: Color(0xFFFF7081), height: colorHeightBase),
              const ColorLine(color: Colors.white, height: colorHeightBase * 3),
            ],
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 85 + bottomMargin),
              child: Transform.translate(
                  offset: Offset(165 + rocketMargin, 0),
                  child: Ship(size: 40, width: takeoffWidth))),
          Container(
              padding: EdgeInsets.fromLTRB(
                  0 + rocketMargin, 0, 0, 30 + bottomMargin),
              child: const Smoke(size: 120.0)),
          Container(
              padding: EdgeInsets.fromLTRB(
                  210 + rocketMargin, 0, 0, 15 + bottomMargin),
              child: const Smoke(size: 110.0)),
          Container(
              padding: EdgeInsets.fromLTRB(
                  80 + rocketMargin, 0, 0, 0 + bottomMargin),
              child: const Smoke(size: 170.0)),
          Container(
              padding: EdgeInsets.fromLTRB(
                  140 + rocketMargin, 0, 0, 60 + bottomMargin),
              child: const Smoke(size: 50.0)),
          Container(
              padding: EdgeInsets.fromLTRB(
                  30 + rocketMargin, 0, 0, 20 + bottomMargin),
              child: const Smoke(size: 60.0)),
          Container(
              padding: EdgeInsets.fromLTRB(
                  230 + rocketMargin, 0, 0, 0 + bottomMargin),
              child: const Smoke(size: 60.0)),
          Container(
              padding: EdgeInsets.fromLTRB(
                  310 + rocketMargin, 0, 0, 0 + bottomMargin),
              child: const Smoke(size: 60.0)),
          Container(
            padding: EdgeInsets.fromLTRB(
                contentMargin, 0, contentMargin, colorHeightBase * 21),
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [ThemeUtils().getDefaultShadow(context)],
                            color: theme.colorScheme.defaultBlockBackground),
                        child: _footerBlock(context)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorLine extends StatelessWidget {
  const ColorLine({super.key, required this.color, required this.height});

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: color,
      padding: const EdgeInsets.fromLTRB(70, 0, 0, 200),
    );
  }
}

class Ship extends StatelessWidget {
  const Ship({super.key, required this.size, required this.width});

  final double size;
  final double width;

  @override
  Widget build(BuildContext context) {
    String shipJson =
        '{"size":{"width":533.984375,"height":343.5703125},"nodes":[{"pos":{"dx":53.39857319836509,"dy":0},"prev":{"dx":53.39640202452291,"dy":12.144830585820651}},{"pos":{"dx":293.6910670040869,"dy":51.535831939562}},{"pos":{"dx":507.06064330488334,"dy":105.58167235092503}},{"pos":{"dx":533.0842845344233,"dy":107.13070366165209}},{"pos":{"dx":533.984375,"dy":239.25894868883586}},{"pos":{"dx":506.2066482603071,"dy":240.5234342343715}},{"pos":{"dx":293.6910670040869,"dy":292.0347806283981}},{"pos":{"dx":53.397487611443985,"dy":343.57061256795987},"next":{"dx":53.39640202452291,"dy":331.42578198213926}},{"pos":{"dx":37.756713114927635,"dy":311.17863636760626},"prev":{"dx":47.76654825183706,"dy":319.76586121967733},"next":{"dx":27.746877978018233,"dy":302.59141151553524}},{"pos":{"dx":0,"dy":297.7615176313894},"prev":{"dx":14.156053450795175,"dy":297.7615176313894}},{"pos":{"dx":0,"dy":45.80909493657065},"next":{"dx":14.156053450795175,"dy":45.80909493657065}},{"pos":{"dx":37.756713114927635,"dy":32.39197620035373},"prev":{"dx":27.746877978018233,"dy":40.97920105242471},"next":{"dx":47.76654825183706,"dy":23.80379113081072}}]}';
    String fireJson =
        '{"size":{"width":600,"height":600},"nodes":[{"pos":{"dx":0,"dy":420.96999999999986}},{"pos":{"dx":61.89499999999992,"dy":180.18499999999946}},{"pos":{"dx":301.35749999999973,"dy":0}},{"pos":{"dx":600,"dy":299.1699999999997}},{"pos":{"dx":418.215,"dy":541.2649999999999}},{"pos":{"dx":180.39000000000007,"dy":599.28}},{"pos":{"dx":298.5750000000008,"dy":479.12250000000006}},{"pos":{"dx":361.5800000000013,"dy":450.42499999999933}},{"pos":{"dx":359.7450000000015,"dy":302.8506249999978}},{"pos":{"dx":446.22250000000133,"dy":157.2684374999969}},{"pos":{"dx":299.68000000000103,"dy":237.62624999999719}},{"pos":{"dx":149.11,"dy":239.78749999999715}},{"pos":{"dx":119.95500000000003,"dy":299.6787499999984}}]}';
    DynamicPath? shipPath = parseDynamicPath(jsonDecode(shipJson));
    DynamicPath? firePath = parseDynamicPath(jsonDecode(fireJson));
    ShapeBorder shipShape = PathShapeBorder(path: shipPath!!);
    ShapeBorder fireShape = PathShapeBorder(path: firePath!!);

    BoxShadow boxShadow = BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 7,
      offset: const Offset(5, 5), // changes position of shadow
    );

    Decoration shipDecoration = ShapeDecoration(
        shape: shipShape, shadows: [boxShadow], color: Colors.grey);
    Decoration fireDecoration = ShapeDecoration(
        shape: fireShape, shadows: [boxShadow], color: Colors.redAccent);
    Decoration smokeDecoration = ShapeDecoration(
        shape: shipShape, shadows: [boxShadow], color: Colors.white);
    //

    double height = 430;
    double diagonalShip = math.sqrt(math.pow(height, 2) + math.pow(width, 2));
    double rotationShip = math.asin(height / diagonalShip);

    return Stack(
      children: [
        Container(
          height: height,
          width: diagonalShip - size * 3.2,
          alignment: Alignment.bottomLeft,
          child: Transform.rotate(
            alignment: Alignment.bottomLeft,
            angle: -rotationShip,
            child: Transform.translate(
              offset: Offset(0, size / 2),
              child: Container(
                height: size, width: diagonalShip - size * 3.2,
                decoration: smokeDecoration,
                child: const SizedBox(),
              ),
            ),
          ),
        ),
        Container(
          height: height,
          width: width,
          alignment: Alignment.bottomLeft,
          child: Transform.rotate(
            alignment: Alignment.bottomLeft,
            angle: -rotationShip,
            child: Transform.translate(
              offset: Offset(0 + diagonalShip - size * 3, size / 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.rotate(
                    angle: (math.pi / 4),
                    child: Container(
                        decoration: fireDecoration,
                        child: SizedBox(height: size, width: size)),
                  ),
                  Transform.translate(
                    offset: const Offset(-8, 0),
                    child: Container(
                        decoration: shipDecoration,
                        child: SizedBox(height: size, width: size)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Smoke extends StatelessWidget {
  const Smoke({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(5, 5), // changes position of shadow
            ),
          ],
        ),
        child: SizedBox(height: size, width: size));
  }
}
