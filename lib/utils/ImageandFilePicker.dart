import 'dart:io';
import 'package:file_picker/file_picker.dart';

class ImageandFilePicker {
  Future<File?> getImageFromGallery() async {
    FilePickerResult? imageResult =
    await FilePicker.platform.pickFiles(type: FileType.image);

    if (imageResult != null) {
      return File(imageResult.files.first.path!);
    }
  }
}

