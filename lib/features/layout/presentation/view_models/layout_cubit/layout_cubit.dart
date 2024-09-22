import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:link_development_task/core/app_constants/app_images.dart';
import 'package:link_development_task/features/cart/presentation/views/cart_view.dart';
import 'package:link_development_task/features/home/presentation/views/home_view.dart';
import 'package:link_development_task/features/layout/data/models/bottom_nav_bar_model.dart';
import 'package:link_development_task/features/more/presentation/views/more_view.dart';
import 'package:link_development_task/features/sections/presentation/views/sections_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  List<Widget> pages = const [
    HomeView(),
    SectionsView(),
    CartView(),
    MoreView(),
  ];

  List<BottomNavBarModel> bottomTabs = [
    BottomNavBarModel(title: "الرئيسية", image: AppImages.home),
    BottomNavBarModel(title: "الاقسام", image: AppImages.menu),
    BottomNavBarModel(title: "السلة", image: AppImages.box),
    BottomNavBarModel(title: "المزيد", image: AppImages.list),
  ];

  int currentIndex = 0;
  void onPageChange(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(ChangeIndexState(currentIndex));
    }
  }
}
