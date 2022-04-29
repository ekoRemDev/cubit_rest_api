import 'package:bloc/bloc.dart';
import 'package:cubit_rest_api/models/failure_model.dart';
import 'package:cubit_rest_api/models/post_model.dart';
import 'package:cubit_rest_api/repository/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {
  final ApiRepository apiRepository;

  PostFetchCubit({required this.apiRepository}) : super(PostFetchInitial());

  Future<void> fetchPostApi() async {
    emit(PostFetchLoading());

    try {
      final List<Post>? postList = await apiRepository.getPostList();
      emit(PostFetchLoaded(postList: postList ?? []));
    } on Failure catch (e) {
      emit(PostFetchError(failure: e));
    } catch (e) {
      print('Error $e');
    }
  }
}
