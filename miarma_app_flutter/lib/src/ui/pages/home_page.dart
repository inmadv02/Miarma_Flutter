import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:miarma_app_flutter/src/models/get-post-dto.dart';
import 'package:miarma_app_flutter/src/posts/post_bloc.dart';
import 'package:miarma_app_flutter/src/repository/constants.dart';
import 'package:miarma_app_flutter/src/repository/posts_repository/post_repository.dart';
import 'package:miarma_app_flutter/src/repository/posts_repository/posts_repository_impl.dart';

import '../../../widgets/error_page.dart';
import '../../../widgets/home_app_bar.dart';
import '../../../widgets/shimmer_horizontal_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PostRepository postRepository;
  late PostBloc following_posts;

  @override
  void initState() {
    postRepository = PostRepositoryImpl();
    following_posts = PostBloc(postRepository)
      ..add(FetchPostsWithType(Constants.public));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PostBloc(postRepository)
          ..add(FetchPostsWithType(Constants.public));
      },
      child: Scaffold(appBar: HomeAppBar(), body: _publicPosts(context)),
    );
  }

  Widget _publicPosts(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PublicPostsFetchError) {
          return ErrorPage(
            message: state.message,
            retry: () {
              context
                  .watch<PostBloc>()
                  .add(FetchPostsWithType(Constants.public));
            },
          );
        } else if (state is PublicPostsFetched) {
          return _postsView(context, state.posts);
        } else {
          return const Text('Not support');
        }
      },
    );
  }

  Widget _postsView(BuildContext context, List<GetPostDTO> posts) {
    return BlocBuilder<PostBloc, PostState>(
      bloc: following_posts,
      builder: (context, state) {
        if (state is PostInitial) {
          return const ShimmerHorizontalList();
        } else if (state is PublicPostsFetchError) {
          return ErrorPage(
            message: state.message,
            retry: () {
              context
                  .watch<PostBloc>()
                  .add(FetchPostsWithType(Constants.public));
            },
          );
        } else if (state is PublicPostsFetched) {
          return _postsLists(context, state.posts);
        } else {
          return const Text('Not supported');
        }
      },
    );
  }

  Widget _postsLists(BuildContext context, List<GetPostDTO> posts) {
    final contentHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: contentHeight,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _postItem(context, posts[index]);
        },
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.transparent,
          width: 6.0,
        ),
        itemCount: posts.length,
      ),
    );
  }

  Widget _postItem(BuildContext ctx, GetPostDTO postDTO) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(64, 200, 200, 200))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.08,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          postDTO.fotoPerfil.toString())))),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(postDTO.nickname,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700)))
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.more_vert)),
                  ],
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(postDTO.urlFoto1, fit: BoxFit.cover)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: SvgPicture.asset('assets/icons/heart.svg')),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SvgPicture.asset('assets/icons/comment.svg'),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: SvgPicture.asset('assets/icons/share.svg')),
                    ],
                  )),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/bookmark.svg'),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(postDTO.likes.toString() + ' likes',
                  style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 20),
              child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                      text: postDTO.nickname,
                      children: <TextSpan>[
                    TextSpan(
                        text: ' ' + postDTO.texto,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ])),
            )
          ],
        ));
  }
}
