import 'package:flutter/material.dart';

const FAMILY = "Poppins";
const L_SPACING = 2.0;
const W_SPACING = 3.0;

final TextStyle bold = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.white,
    fontSize: 32,
    fontFamily: FAMILY,
    fontWeight: FontWeight.w700,
    letterSpacing: L_SPACING,
    wordSpacing: W_SPACING);

final TextStyle light = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.white,
    fontSize: 22,
    fontFamily: FAMILY,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    wordSpacing: 0);
