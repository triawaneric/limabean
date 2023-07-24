import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:limabean/home/data/meat_repository.dart';
import 'package:meta/meta.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetPostsEvent) {
        if (state.hasReachedMax) return;
        try {
          if (state.status == HomeStatus.loading) {
            final posts = await MeatRepository().getData();
            return posts.isEmpty
                ? emit(state.copyWith(
                status: HomeStatus.success, hasReachedMax: true))
                : emit(state.copyWith(
                status: HomeStatus.success,
                posts: posts,
                hasReachedMax: false));
          } else {
            final posts = await MeatRepository().getData();
            posts.isEmpty
                ? emit(state.copyWith(hasReachedMax: true))
                : emit(state.copyWith(
                status: HomeStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false));
          }
        } catch (e) {
          emit(state.copyWith(
              status: HomeStatus.error, errorMessage: "failed to fetch posts"));
        }
      }
    }, transformer: droppable());

  }
}