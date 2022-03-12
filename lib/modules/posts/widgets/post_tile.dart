import 'package:flutter/material.dart';

import '../../../common/formatters/date_format.dart';
import '../../register_user/domain/models/register_user_model.dart';
import '../domain/models/post_model.dart';

class PostTile extends StatelessWidget {
  final PostModel post;
  final UserModel loggedUser;
  const PostTile({Key? key, required this.post, required this.loggedUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "${post.user?.profilePicture}",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "@${post.user?.username}",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        formatData(post.createdAt, format: 'dd/MM/y HH:mm'),
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "${post.content}",
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            if (loggedUser.username == post.user?.username)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.amber,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
