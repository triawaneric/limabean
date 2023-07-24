import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limabean/home/view/home_screen.dart';

import 'helper/bloc_observer.dart';
import 'home/bloc/home_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc()..add(GetPostsEvent()),
        child: const MaterialApp(
          home: HomeScreen(),
        ));
  }
}