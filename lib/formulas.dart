import 'package:angles/angles.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart';

const double angleC = 90;
double sidea = 0;
double sideb = 0;
double sidec = 0;
double angleA = 0;
double angleB = 0;
double wingTriangleA = 0;
double wingTriangleB = 0;
double baseTriangleA = 0;
double baseTriangleB = 0;
double wingTriangle90 = 0;
double baseTriangle90 = 0;

// CONOCEMOS CATETOS A Y B ASI COMO ANGULO C (90º)
void abC(double sidea, double sideb, double trayHeight, double trayWidth) {
  sidea = sidea;
  sideb = sideb;

  // CALCULAMOS CATETO C
  sidec = math.sqrt(math.pow(sidea, 2) +
      math.pow(sideb, 2) -
      (2 * sidea * sideb) * (Angle.degrees(angleC).cos));

  // CALCULAMOS ANGULOS A Y B
  angleA = degrees(math.acos(sideb / sidec));
  angleB = angleC - angleA;

  // CALCULAMOS TRIANGULOS PARA REALIZAR LOS GIROS
  // GIRO SOBRE ALA
  double turningDegreesA = angleA / 2;
  wingTriangleA = (math.sin(radians(turningDegreesA)) *
      trayHeight /
      (math.sin(radians(angleC - turningDegreesA)))) *
      2;

  double turninDegreesB = angleB / 2;
  wingTriangleB = (math.sin(radians(turninDegreesB)) *
      trayHeight /
      (math.sin(radians(angleC - turningDegreesA)))) *
      2;

  // GIRO SOBRE BASE
  baseTriangleA = (math.sin(radians(turningDegreesA)) *
      trayWidth /
      (math.sin(radians(angleC - turningDegreesA)))) *
      2;

  baseTriangleB = (math.sin(radians(turninDegreesB)) *
      trayWidth /
      (math.sin(radians(angleC - turningDegreesA)))) *
      2;
}

// CONOCEMOS ANGULOS A Y B Y EL AVANCE ( CATETO C)
void knowAngleAangleBsideC(angleA, sidec, trayHeight, trayWidth) {
  if (angleA < 90) {
    angleA = angleA;
    angleB = angleC - angleA;
  } else if (angleA >= 90) {
    angleA = 180 - angleA;
    angleB = angleA - angleC;
  } else if (angleA > 180) {
    angleA = 270 - angleA;
  }

  sidec = sidec;

  //angleB = angleC - angleA;
  //sidea = (sidec * math.sin(radians(angleA))) / math.sin(radians(angleC));
  sidea = (sidec * Angle.degrees(angleA).sin / const Angle.degrees(angleC).sin);
  sideb = (sidea * Angle.degrees(angleB).sin / Angle.degrees(angleA).sin);

  // GIRO SOBRE ALA
  double turningDegreesA = angleA / 2;
  wingTriangleA = ((Angle.degrees(turningDegreesA).sin) *
      trayHeight) /
      (((Angle.degrees(angleC - turningDegreesA).sin)) *
          2);

  double turningDegreesB = angleB / 2;
  wingTriangleB = (math.sin(radians(turningDegreesB)) *
      trayHeight /
      (math.sin(radians(angleC - turningDegreesA)))) *
      2;

  // GIRO SOBRE BASE
  baseTriangleA = (math.sin(radians(turningDegreesA)) *
      trayWidth /
      (math.sin(radians(angleC - turningDegreesA)))) *
      2;

  baseTriangleB = (math.sin(radians(turningDegreesB)) *
      trayWidth /
      (math.sin(radians(angleC - turningDegreesA)))) *
      2;
}

// CURVAS 90º
void rightAngled(double trayHeight, double trayWidth) {
  //GIRO 90 GRADOS
  double wingTriangle90temp =
  (((math.sin(radians(45)) * trayHeight) / math.sin(radians(45))) * 2);
  wingTriangle90 = wingTriangle90temp - (wingTriangle90temp * 0.02);

  double baseTriangle90temp =
  (math.sin(radians(45)) * trayWidth / math.sin(radians(45)) * 2);
  baseTriangle90 = baseTriangle90temp - (baseTriangle90temp * 0.02);
}