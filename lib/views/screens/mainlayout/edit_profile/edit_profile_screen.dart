import 'dart:io';

import 'package:eval/shared/constants.dart';
import 'package:eval/shared/icon_broken.dart';
import 'package:eval/utilities/extensions/fade_extinsion.dart';
import 'package:eval/views/screens/mainlayout/cubit/cubit.dart';
import 'package:eval/views/screens/mainlayout/cubit/states.dart';
import 'package:eval/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        File? profileImage = AppCubit.get(context).pickedProfileImage;
        File? coverImage = AppCubit.get(context).pickedCoverImage;
        final editBioController =
            TextEditingController(text: AppCubit.userModel!.bio);
        final editphoneController =
            TextEditingController(text: AppCubit.userModel!.phone);
        final editnameController =
            TextEditingController(text: AppCubit.userModel!.name);
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit profile',
                    style: Theme.of(context).textTheme.headline5)
                .fadeInList(6, false),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            leading: InkWell(
              child: const Icon(IconBroken.Arrow___Left, color: Colors.black)
                  .fadeInList(5, false),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Constants.defaultPadding),
                child: Column(
                  children: [
                    if (state is AppCubitUploadImageLoadingState ||
                        state is AppCubitUpdateUserDataLoadingState)
                      const LinearProgressIndicator(),
                    SizedBox(
                      height: 220,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: [
                                Container(
                                  height: 170,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: coverImage == null
                                              ? NetworkImage(
                                                  AppCubit.userModel!
                                                          .coverPhoto ??
                                                      'https://wallpaperaccess.com/full/3037916.png',
                                                )
                                              : FileImage(coverImage)
                                                  as ImageProvider,
                                          fit: BoxFit.cover)),
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        AppCubit.get(context).pickCoverImage();
                                      },
                                      child: Container(
                                          height: 170,
                                          decoration: BoxDecoration(
                                            color: Colors.black.withAlpha(150),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Edit cover photo',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                const Icon(
                                                  IconBroken.Camera,
                                                  size: 19,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 64.0,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 60.0,
                                  child: profileImage == null
                                      ? ClipOval(
                                          child: Image.network(
                                            AppCubit.userModel!.profilePhoto ??
                                                'https://wallpaperaccess.com/full/3037916.png',
                                            height: double.infinity,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : ClipOval(
                                          child: Image.file(
                                            profileImage,
                                            fit: BoxFit.cover,
                                            height: double.infinity,
                                            width: double.infinity,
                                          ),
                                        ),
                                ),
                                CircleAvatar(
                                  radius: 60.0,
                                  backgroundColor: Colors.black.withAlpha(150),
                                ),
                                InkWell(
                                  onTap: () {
                                    AppCubit.get(context).pickProfileImage();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Add Photo',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      const Icon(
                                        IconBroken.Camera,
                                        size: 19,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ).fadeInList(0, false),
                    const SizedBox(
                      height: Constants.defaultPadding,
                    ),
                    TextFormField(
                      controller: editnameController,
                      decoration: const InputDecoration(label: Text('Name')),
                    ).fadeInList(1, false),
                    const SizedBox(
                      height: Constants.defaultPadding / 2,
                    ),
                    TextFormField(
                      controller: editBioController,
                      decoration: const InputDecoration(label: Text('Bio')),
                    ).fadeInList(2, false),
                    const SizedBox(
                      height: Constants.defaultPadding / 2,
                    ),
                    TextFormField(
                      controller: editphoneController,
                      decoration: const InputDecoration(label: Text('Phone')),
                    ).fadeInList(3, false),
                    const SizedBox(
                      height: Constants.defaultPadding / 2,
                    ),
                    MainButton(
                        text: 'Submit',
                        onTap: () {
                          if (profileImage != null) {
                            AppCubit.get(context).uploadImage(profileImage,
                                imageCase: 'profile');
                          }
                          if (coverImage != null) {
                            AppCubit.get(context)
                                .uploadImage(coverImage, imageCase: 'cover');
                          }
                          AppCubit.get(context).updateUserData(
                              name: editnameController.text,
                              phone: editphoneController.text,
                              bio: editBioController.text);
                        }).fadeInList(4, true)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
