part of 'home_bloc.dart';


enum HomeStatus { loading, success, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<dynamic> posts;
  final bool hasReachedMax;
  final String errorMessage;

  const HomeState(
      {this.status = HomeStatus.loading,
        this.hasReachedMax = false,
        this.posts = const [],
        this.errorMessage = ""});

  HomeState copyWith({
    HomeStatus? status,
    List<dynamic>? posts,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, posts, hasReachedMax, errorMessage];
}