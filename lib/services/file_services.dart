import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class TFileServices{
  TFileServices._();

  static void pickFile() async{
    String fileText = '';
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'pdf']
    );
    if(result != null && result.files.single.path != null){
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    }
    File file = File(result!.files.single.path!);
    fileText = file.path;
  }

  static void pickMultipleFiles() async{
    String fileText = '';
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'pdf'],
      allowMultiple: true,
    );
    if(result != null){
      List<File> files = result.paths.map((path) => File(path!)).toList();
      fileText = files.toString();
    }
  }

  static void pickDirectory() async{
    String fileText = '';
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if(selectedDirectory != null){
      fileText = selectedDirectory;
    }
  }

  static void saveAs() async{
    if(kIsWeb || Platform.isIOS || Platform.isAndroid) return;
    String? outputFile = await FilePicker.platform.saveFile();
  }

  // static void saveOnFirebase() async{
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   if(result != null){
  //     Uint8List fileBytes =
  //   }
  // }
}