import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_crop_and_upload_on_server/Api_Service/api_service.dart';
import 'package:image_crop_and_upload_on_server/Screen/bottom_screen.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Image_Picker/image_picker.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImagePick controller =ImagePick();
  BottomScreen bottom = BottomScreen();
  ApiService api = ApiService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Provider.of<ImagePick>(context , listen: false);
    BottomScreen bottom = BottomScreen();
    bottom = Provider.of<BottomScreen>(context , listen: false);
    api = Provider.of<ApiService>(context , listen: false);
    // controller.cropImage(cropAspectRatio: CropAspectRatio(ratioX: 16, ratioY: 9), imageSource: ImageSource.gallery);
    // controller.cammeraImage(cropAspectRatio: CropAspectRatio(ratioX: 16, ratioY: 9), imageSource: ImageSource.camera);
  }
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ImagePick>();
    final bottomSheet = context.watch<BottomScreen>();
    final apiService = context.watch<ApiService>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomSheet.bottomScreen(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Image picker and compresser'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Provider.of<ImagePick>(context,listen: false).pickedfile!=
                null?Image(image: FileImage(Provider.of<ImagePick>(context,listen: false).pickedfile??File("path")),):
                const Text('No Pic',style: TextStyle(fontWeight: FontWeight.bold,fontSize:25),)
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: ()async{
                // print('${provider.pickedfile}???????????????????????????????');
                //
                // await apiService.uploadImage(File(provider.pickedfile!.path));
                // apiService.uploadImage(File(provider.pickedfile!.path));
               await provider.selectImage(context);
              },
              child: Text('Upload')
          )
        ],
      ),
    );
  }
}

