import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:image_crop_and_upload_on_server/Image_Picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
class ApiService with ChangeNotifier{
  ImagePick image = ImagePick();
  Future<void> uploadImage(String imagePath) async {
    // File paths = File(image.pickedfile.toString());
     // imageFile = image.pickedfile??File('$paths');
    print(imagePath);
    var request = http.MultipartRequest('POST', Uri.parse('https://terraasri-r2nr.onrender.com/getFileUrl'));
    request.files.add(
      await http.MultipartFile.fromPath(
        'files',
        imagePath,
      ),
    );

    var response = await request.send().timeout(Duration(seconds: 25));
    var streamResponse = await http.Response.fromStream(response);
    print(streamResponse);
    if (response.statusCode == 200) {
      debugPrint(response.statusCode.toString());
      debugPrint('Image uploaded successfully');
      debugPrint(response.statusCode.toString());
    } else {
      debugPrint('Image upload failed');
    }
    notifyListeners();
  }

  // Future<void> selectImage() async {
  //   final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   if (imageFile == null) return; // User canceled image selection
  //
  //   await uploadImage(File(imageFile.path));
  //   notifyListeners();
  // }

}