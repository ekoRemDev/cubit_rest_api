import 'package:cubit_rest_api/cubit/post_fetch_cubit.dart';
import 'package:cubit_rest_api/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Rest API'),
      ),
      body: BlocBuilder<PostFetchCubit, PostFetchState>(
        builder: (context, state) {
          if (state is PostFetchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostFetchError) {
            return Text(state.failure.message);
          } else if (state is PostFetchLoaded) {
            final postList = state.postList;
            return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  final Post singlePost = postList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        singlePost.id.toString(),
                      ),
                    ),
                    title: Text(singlePost.title),
                    subtitle: Text(singlePost.body),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
