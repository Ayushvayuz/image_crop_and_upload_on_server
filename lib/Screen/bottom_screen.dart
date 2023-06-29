
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_crop_and_upload_on_server/Image_Picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BottomScreen with ChangeNotifier{
   bottomScreen(context){
     return showModalBottomSheet(
        context: context,
        builder: (_)=>Container(
          height: MediaQuery.of(context).size.height/3,
          width: MediaQuery.of(context).size.width,
          child: Column(
      children: [
          SizedBox(height: 40,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: ()async{
                 await  Provider.of<ImagePick>(context,listen : false).cammeraImage(
                      cropAspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
                      imageSource: ImageSource.camera,);
                   notifyListeners();
                  }, child: Text('Camera',style: TextStyle(fontSize: 30),)
            ),
          ),
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: ()async{
                 await Provider.of<ImagePick>(context ,listen: false).cropImage(
                      cropAspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
                      imageSource: ImageSource.gallery);
                  notifyListeners();
                }, child: Text('Gallery',style: TextStyle(fontSize: 30),)
            ),
          )
      ],
    ),
        ));
    notifyListeners();
  }
}