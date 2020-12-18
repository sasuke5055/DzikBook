import 'package:dzikbook/providers/posts.dart';
import 'package:dzikbook/providers/user_data.dart';
import 'package:dzikbook/widgets/navbar.dart';
import 'package:flutter/material.dart';

import 'package:dzikbook/widgets/add_post.dart';
import 'package:dzikbook/widgets/post.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static final routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Posts>(context, listen: false).restart();
    Provider.of<Posts>(context, listen: false).loadMore(type: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var postsProvider = Provider.of<Posts>(context, listen: true);
    Provider.of<UserData>(context, listen: false).getUserData();

    return Scaffold(
        appBar: buildNavBar(
            context: context,
            title: "Dzikbook",
            routeName: ProfileScreen.routeName),
        body: ListView.builder(
          itemCount: postsProvider.hasMore
              ? postsProvider.wallPostsCount + 1
              : postsProvider.wallPostsCount,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) return AddPost();
            if (index >= postsProvider.wallPostsCount) {
              if (!postsProvider.isLoading) {
                postsProvider.loadMore(type: 0);
              }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: 24,
                    width: 24,
                  ),
                ),
              );
            }

            return Post(
              userId: postsProvider.wallPosts[index - 1].userId,
              description: postsProvider.wallPosts[index - 1].description,
              id: postsProvider.wallPosts[index - 1].id,
              timeTaken: postsProvider.wallPosts[index - 1].timeTaken,
              userName: postsProvider.wallPosts[index - 1].userName,
              comments: postsProvider.wallPosts[index - 1].comments,
              likes: postsProvider.wallPosts[index - 1].likes,
              hasImage: postsProvider.wallPosts[index - 1].hasImage,
              userImg: postsProvider.wallPosts[index - 1].userImg,
              loadedImg: postsProvider.wallPosts[index - 1].hasImage
                  ? postsProvider.wallPosts[index - 1].loadedImg
                  : null,
              hasTraining: postsProvider.wallPosts[index - 1].hasTraining,
              traning: postsProvider.wallPosts[index - 1].loadedTraining,
              hasReacted: postsProvider.wallPosts[index - 1].hasReacted,
            );
          },
        ));
  }
}
