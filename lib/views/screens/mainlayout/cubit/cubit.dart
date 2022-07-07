import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eval/models/user_model.dart';
import 'package:eval/shared/constants.dart';
import 'package:eval/views/screens/mainlayout/cubit/states.dart';
import 'package:eval/views/screens/mainlayout/main_layout_modules/chats.dart';
import 'package:eval/views/screens/mainlayout/main_layout_modules/home.dart';
import 'package:eval/views/screens/mainlayout/main_layout_modules/new_post.dart';
import 'package:eval/views/screens/mainlayout/main_layout_modules/settings.dart';
import 'package:eval/views/screens/mainlayout/main_layout_modules/useres.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(AppCubitInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  final PageStorageBucket bucket = PageStorageBucket();

  //we are going to use PageStorage() to presist the pages states
  final List<Widget> screens = [
    const HomeModule(
      key: PageStorageKey('HomePage'),
    ),
    const ChatsModule(
      key: PageStorageKey('ChatsPage'),
    ),
    const NewPostModule(
      key: PageStorageKey('NewpostPage'),
    ),
    const UsersModule(
      key: PageStorageKey('UsersPage'),
    ),
    const SettingsModule(
      key: PageStorageKey('SettingsPage'),
    )
  ];
  List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  int currentIndex = 0;
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppCubitChangeBottomNavBar());
  }

  static UserModel? userModel;
  Future<void> getUserData() async {
    emit(AppCubitGetUserDataLoadingState());
    try {
      var model = await FirebaseFirestore.instance
          .collection('users')
          .doc(Constants.uId)
          .get();
      print(Constants.uId);
      emit(AppCubitGetUserDataSuccessState());

      userModel = UserModel.formJson(model.data());
    } on FirebaseException catch (e) {
      print(e.code);
      emit(AppCubitGetUserDataErrorState());
    }
  }

  File? pickedProfileImage;
  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedProfileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(AppCubitPickProfileImageSuccessState());
    } else {
      print('No Image Selected');
      emit(AppCubitPickProfileImageErrorPhotoState());
    }
  }

  File? pickedCoverImage;
  Future<void> pickCoverImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      pickedCoverImage = File(pickedfile.path);
      emit(AppCubitPickCoverImageSuccessState());
    } else {
      print('No Image Selected');
      emit(AppCubitPickCoverImageErrorPhotoState());
    }
  }

  final storageRef = FirebaseStorage.instance.ref();
  String? profileImageUrl;
  String? coverImageUrl;
  Future<void> uploadImage(File? image, {required String imageCase}) async {
    try {
      emit(AppCubitUploadImageLoadingState());

      if (image != null) {
        var value = await storageRef
            .child('users/${Uri.file(image.path).pathSegments.last}')
            .putFile(image);
        switch (imageCase) {
          case 'profile':
            profileImageUrl = await value.ref.getDownloadURL();
            await FirebaseFirestore.instance
                .collection('users')
                .doc(Constants.uId)
                .update({'profilePhoto': profileImageUrl});
            userModel!.profilePhoto = profileImageUrl;
            break;
          case 'cover':
            coverImageUrl = await value.ref.getDownloadURL();
            await FirebaseFirestore.instance
                .collection('users')
                .doc(Constants.uId)
                .update({'coverPhoto': coverImageUrl});
            userModel!.coverPhoto = coverImageUrl;

            break;
          default:
            break;
        }
        emit(AppCubitUploadImageSuccessState());
      }
    } on FirebaseException catch (e) {
      print(e.code);
      emit(AppCubitUploadImageErrorState());
    }
  }
}
