part of 'drawer_cubit.dart';

abstract class DrawerState {}

class HomeInitial extends DrawerState {}
class SelectedItemState extends DrawerState {}
class VideoPlayerLoadingState extends DrawerState {}
class VideoPlayerInitializedState extends DrawerState {}
class VideoPlayerErrorState extends DrawerState {}
class LanguageChangedState extends DrawerState {}

class ThemeChangedState extends DrawerState {}
class SwitchChangedState extends DrawerState {}