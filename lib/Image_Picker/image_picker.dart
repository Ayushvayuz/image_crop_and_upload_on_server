import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_crop_and_upload_on_server/Api_Service/api_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImagePick with ChangeNotifier{
  // ApiService api = ApiService();
    File? pickedfile;
  Future<XFile?>cammeraImage({
    required CropAspectRatio cropAspectRatio ,
    required ImageSource imageSource,
  })async{
    XFile? pickImage = await ImagePicker().pickImage(source: imageSource);
    if(pickImage==null) return null;
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickImage.path,
        aspectRatio: cropAspectRatio,
        compressQuality: 90,
        compressFormat: ImageCompressFormat.jpg
    );
    pickedfile=File(croppedFile!.path);
    if(croppedFile==null) return null;
    return XFile(croppedFile.path);
  }
Future<XFile?>cropImage({
    required CropAspectRatio cropAspectRatio ,
    required ImageSource imageSource
})async{
    XFile? pickImage = await ImagePicker().pickImage(source: imageSource);
    if(pickImage==null) return null;
    print("$pickImage >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickImage.path,
      aspectRatio: cropAspectRatio,
      compressQuality: 90,
      compressFormat: ImageCompressFormat.jpg
    );
    debugPrint('${croppedFile!.path.toString()}>>>>>>>>>>>>>>.>');
    pickedfile=File(croppedFile!.path);
    if(croppedFile==null) return null;
    return XFile(croppedFile.path);
}

    Future<void> selectImage(context) async {
      final imageFile = await pickedfile;
      print(imageFile);
      if (imageFile == null) return debugPrint('Error happening here??????????');
      // await Provider.of<ApiService>(context,listen: false).uploadImage(File(imageFile.path));
      Provider.of<ApiService>(context,listen: false).uploadImage(imageFile.path);

      debugPrint("Successfully uploaded");
    }


}