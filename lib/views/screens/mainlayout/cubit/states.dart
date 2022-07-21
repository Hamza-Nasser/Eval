abstract class AppCubitStates {}

class AppCubitInitialState extends AppCubitStates {}

class AppCubitChangeBottomNavBar extends AppCubitStates {}

// Get user
class AppCubitGetUserDataLoadingState extends AppCubitStates {}

class AppCubitGetUserDataSuccessState extends AppCubitStates {}

class AppCubitGetUserDataErrorState extends AppCubitStates {}

// Pick profile Image
class AppCubitPickProfileImageSuccessState extends AppCubitStates {}

class AppCubitPickProfileImageErrorPhotoState extends AppCubitStates {}

// Pick cover Image
class AppCubitPickCoverImageSuccessState extends AppCubitStates {}

class AppCubitPickCoverImageErrorPhotoState extends AppCubitStates {}

// Upload Image to firebase storage
class AppCubitUploadImageLoadingState extends AppCubitStates {}

class AppCubitUploadImageSuccessState extends AppCubitStates {}

class AppCubitUploadImageErrorState extends AppCubitStates {}

// Update user data
class AppCubitUpdateUserDataLoadingState extends AppCubitStates {}

class AppCubitUpdateUserDataSuccessState extends AppCubitStates {}

class AppCubitUpdateUserDataErrorState extends AppCubitStates {}
