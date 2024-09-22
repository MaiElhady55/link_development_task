part of 'layout_cubit.dart';

sealed class LayoutState extends Equatable {
  const LayoutState();

  @override
  List<Object> get props => [];
}

final class LayoutInitial extends LayoutState {}

final class ChangeIndexState extends LayoutState {
  final int index;

  const ChangeIndexState(this.index);

  @override
  List<Object> get props => [index];
}
