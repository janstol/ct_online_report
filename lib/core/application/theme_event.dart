import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeLoadEvent extends ThemeEvent {
  @override
  List<Object> get props => null;
}

class ThemeChangedEvent extends ThemeEvent {
  final ThemeMode themeMode;

  const ThemeChangedEvent(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}
