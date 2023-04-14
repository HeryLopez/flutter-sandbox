import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';
import 'dart:math' as math;

import '../themes/theme_utils.dart';
import '../utils/json_shapes_utils.dart';
import '../utils/strings.dart';
import 'footer/color_line.dart';
import 'footer/sphere.dart';

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

  Widget _getSphere(double size, double leftMargin, double bottomMargin) {
    return Container(
      padding: EdgeInsets.fromLTRB(leftMargin, 0, 0, bottomMargin),
      child: Sphere(
        size: size,
        gradientStops: const [0.5, 1],
        gradientColors: [Colors.white, Colors.grey.shade200],
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
              child: Ship(size: 40, width: takeoffWidth),
            ),
          ),
          _getSphere(120.0, 0 + rocketMargin, 30 + bottomMargin),
          _getSphere(110.0, 210 + rocketMargin, 15 + bottomMargin),
          _getSphere(170.0, 80 + rocketMargin, 0 + bottomMargin),
          _getSphere(50.0, 140 + rocketMargin, 60 + bottomMargin),
          _getSphere(60.0, 30 + rocketMargin, 20 + bottomMargin),
          _getSphere(60.0, 230 + rocketMargin, 0 + bottomMargin),
          _getSphere(60.0, 310 + rocketMargin, 0 + bottomMargin),
          Container(
            padding: EdgeInsets.fromLTRB(
              contentMargin,
              0,
              contentMargin,
              colorHeightBase * 21,
            ),
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
                        color: theme.colorScheme.defaultBlockBackground,
                      ),
                      child: _footerBlock(context),
                    ),
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

class Ship extends StatelessWidget {
  const Ship({super.key, required this.size, required this.width});

  final double size;
  final double width;

  LinearGradient _getShipGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.white, Colors.grey.shade800],
    );
  }

  LinearGradient _getSmokeGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.5, 1],
      colors: [Colors.white, Colors.grey.shade500],
    );
  }

  LinearGradient _getFireGradient() {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [0.2, 0.4, 0.8],
      colors: [Colors.yellow, Colors.orange, Colors.red],
    );
  }

  BoxShadow _getShadow() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 7,
      offset: const Offset(5, 5), // changes position of shadow
    );
  }

  @override
  Widget build(BuildContext context) {
    DynamicPath? shipPath =
        parseDynamicPath(jsonDecode(JsonShapesUtils.shipJson));
    DynamicPath? firePath =
        parseDynamicPath(jsonDecode(JsonShapesUtils.fireJson));
    ShapeBorder shipShape = PathShapeBorder(path: shipPath!);
    ShapeBorder fireShape = PathShapeBorder(path: firePath!);

    Decoration shipDecoration = ShapeDecoration(
        gradient: _getShipGradient(),
        shape: shipShape,
        shadows: [_getShadow()]);
    Decoration fireDecoration = ShapeDecoration(
        gradient: _getFireGradient(),
        shape: fireShape,
        shadows: [_getShadow()]);
    Decoration smokeDecoration = ShapeDecoration(
        gradient: _getSmokeGradient(),
        shape: shipShape,
        shadows: [_getShadow()]);

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
                height: size,
                width: diagonalShip - size * 3.2,
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
