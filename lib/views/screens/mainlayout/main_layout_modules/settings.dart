import 'package:eval/models/user_model.dart';
import 'package:eval/shared/icon_broken.dart';
import 'package:eval/utilities/routing/routes.dart';
import 'package:eval/views/screens/mainlayout/cubit/cubit.dart';
import 'package:eval/views/screens/mainlayout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsModule extends StatelessWidget {
  const SettingsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);

        UserModel? user = appCubit.userModel;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 170,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://wallpaperaccess.com/full/2576098.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      CircleAvatar(
                        radius: 64.0,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: const CircleAvatar(
                          radius: 60.0,
                          backgroundImage: NetworkImage(
                              'https://wallpaperaccess.com/full/3037916.png'),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      //'Hamza Nasser',
                      user!.name ?? 'Eval user',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                Text(
                  user.bio ?? '',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                'Likes',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                '5',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                'Posts',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                '50k',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                'Followers',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                '1',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                'Following',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () {}, child: const Text('Add post'))),
                    const SizedBox(
                      width: 3,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.editProfileScreenRoute);
                        },
                        child: const Icon(IconBroken.Edit))
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.red,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.blue,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.grey,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
