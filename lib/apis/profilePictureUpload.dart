import 'dart:io';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:get/route_manager.dart';
import '../Components/snackBar.dart';
import 'hiveStorage.dart';
import 'authCall.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

final uploader = FlutterUploader();
File _image;
final picker = ImagePicker();

Future getImageFromCamera() async {
  final pickedFile = await picker.getImage(source: ImageSource.camera);
  _image = File(pickedFile.path);
  uploadProfilePic(_image);
}

Future getImageFromGallary() async {
  final pickedFile = await picker.getImage(source: ImageSource.gallery);
  _image = File(pickedFile.path);
  uploadProfilePic(_image);
}

uploadProfilePic(_image) async {
  var userToken = await HiveCalls().getUserToken();
  
  final String filename = basename(_image.path);
  final String savedDir = dirname(_image.path);
  Get.back();
  showCustomSnackBar('uploading ...');
  await uploader.enqueue(
      url: "$baseUrl/Picture", //required: url to upload to
      files: [
        FileItem(filename: filename, savedDir: savedDir, fieldname: "avater")
      ], // required: list of files that you want to upload
      method: UploadMethod.POST, // HTTP method  (POST or PUT or PATCH)
      headers: {
        'Authorization': 'Bearer $userToken',
      },
      // data: {"avater": '$filename .jpg'}, // any data you want to send in upload request
      showNotification:
          true, // send local notification (android only) for upload status
      tag: "uploading Image"); // unique tag for upload task

  uploader.progress.listen((progress) {
 
    print(
        "progress: ${progress.status.description} progress no: ${progress.progress}");
        
  }, onDone: (){
    print('done!!');
  });

  uploader.result.listen((result) {
       
       if(result.status.description == "Completed"){
         print('done');
       }
      
      

    print(result);
  }, onError: (ex, stacktrace) {
    // ... code to handle error
    showCustomSnackBar('upload failed');
    print(ex);
    print(stacktrace);
  }, );
}

_deleteImageChache() async{
String url = await HiveCalls().getProfilePhoto();
// await CachedNetworkImage
}