import 'package:eval/models/user_model.dart';
import 'package:eval/shared/constants.dart';
import 'package:eval/shared/icon_broken.dart';
import 'package:eval/views/screens/mainlayout/cubit/cubit.dart';
import 'package:eval/views/screens/mainlayout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: const [
                  Card(
                    elevation: 5,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: NetworkImage(
                          'https://wallpaperaccess.com/full/2576098.jpg'),
                    ),
                  ),
                ],
              ),
              buildPostItem(context),
              buildPostItem(context),
              buildPostItem(context),

              // ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemBuilder: (context, index){
              //   return buildPostItem(context);
              // },
              //   itemCount: 10,
              // ),
            ],
          ),
        );
      },
    );
  }
}

Widget buildPostItem(BuildContext context) {
  UserModel? user = AppCubit.userModel;
  return Padding(
    padding: const EdgeInsets.all(Constants.defaultPadding / 4),
    child: Card(
      //clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(Constants.defaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://wallpaperaccess.com/full/3037916.png',
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            //'Eval',
                            user!.name ?? 'Eval user',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Icon(
                            Icons.check_circle,
                            size: 14,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                      Text(
                        //'NasserJr',
                        user.tagLine ?? '',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                )
              ],
            ),
            const Divider(),
            const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
            GestureDetector(
              child: Wrap(
                children: [
                  Text(
                    '#Flutter ',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).primaryColor, fontSize: 13.0),
                  ),
                  Text(
                    '#Flutter ',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).primaryColor, fontSize: 13.0),
                  ),
                  Text(
                    '#Flutter ',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).primaryColor, fontSize: 13.0),
                  ),
                  Text(
                    '#Flutter ',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).primaryColor, fontSize: 13.0),
                  ),
                  Text(
                    '#Flutter ',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).primaryColor, fontSize: 13.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: Constants.defaultPadding / 4),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.wallpapersden.com/image/download/neon-hd-valorant-nightmare_bWlnZ2mUmZqaraWkpJRnamZprWZpZ2k.jpg'),
                  ),
                  borderRadius:
                      BorderRadius.circular(Constants.defaultRadius / 2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Constants.defaultPadding / 4),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            '100 Likes',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            IconBroken.Chat,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            '100 Comments',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              height: 0,
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://wallpaperaccess.com/full/3037916.png',
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    'Write a comment...',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        IconBroken.Heart,
                        size: 20,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Like'),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.amber)),
                  child: Row(
                    children: const [
                      Icon(
                        IconBroken.Chat,
                        size: 20,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Comment'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
