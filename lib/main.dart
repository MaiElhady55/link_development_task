import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_development_task/app.dart';
import 'package:link_development_task/core/bloc_observer.dart';
import 'package:link_development_task/core/di/service_loctor.dart';
import 'package:link_development_task/features/layout/presentation/view_models/layout_cubit/layout_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => getIt<LayoutCubit>(),
    )
  ], child: const MyApp()));
}
