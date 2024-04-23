import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gellary/core/usable_functions/api_service_helper.dart';
import 'package:gellary/core/utils/app_routes_utils/app_router.dart';
import 'package:gellary/features/home/data/models/gallery_model.dart';
import 'package:gellary/features/home/data/repository/home_interface.dart';
import 'package:image_picker/image_picker.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._interface) : super(const HomeInitial());

  final HomeInterface _interface;

  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> logout(BuildContext context) async {
    await _interface.logout();
    if (context.mounted) {
      AppNavigator.navigateToLoginScreen(context);
    }
  }

  Future<void> getImages(BuildContext context) async {
    emit(const HomeGetDataLoading());
    StackTrace stackTrace = StackTrace.current;
    ApiResponse apiResponse =
        await _interface.getImages(stackTrace: stackTrace);
    if (apiResponse.statusCode == 200) {
      GalleryResponse response =
          GalleryResponse.fromJson(apiResponse.response!.data);
      emit(HomeGetDataSuccessful(response));
    } else {
      if (context.mounted) ApiChecker.checkApi(apiResponse, context);
      emit(const HomeGetDataFailed());
    }
  }

  Future<void> _uploadImage(BuildContext context) async {
    final formData = FormData();
    formData.files.add(MapEntry(
      'img',
      await MultipartFile.fromFile(
        _image!.path,
        filename: _image!.path.split('/').last,
      ),
    ));
    StackTrace stackTrace = StackTrace.current;
    ApiResponse apiResponse = await _interface.uploadImage(
      data: formData,
      stackTrace: stackTrace,
      contentType: 'multipart/form-data',
    );
    if (apiResponse.statusCode == 200 &&
        apiResponse.response!.data['status'] == 'success') {
      if (context.mounted) {
        Navigator.pop(context);
        await getImages(context);
      }
    }
  }

  Future<void> pickImage(bool fromCamera, BuildContext context) async {
    if (fromCamera) {
      _image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      _image = await _picker.pickImage(source: ImageSource.gallery);
    }
    if (_image != null) {
      if (context.mounted) {
        await _uploadImage(context);
      }
    } else {
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }
}
