import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/constants.dart';

class CreateCustomizeStore extends StatefulWidget {
  const CreateCustomizeStore({super.key});

  @override
  State<CreateCustomizeStore> createState() => _CreateCustomizeStoreState();
}

class _CreateCustomizeStoreState extends State<CreateCustomizeStore> {
  File? _croppedImage;

  Future<void> _pickAndCropImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        final CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              lockAspectRatio: true,
            ),
            IOSUiSettings(
              title: 'Crop Image',
              aspectRatioLockEnabled: true,
            ),
          ],
        );

        if (croppedFile != null) {
          setState(() {
            _croppedImage = File(croppedFile.path);
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking or cropping image: $e')),
      );
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickAndCropImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickAndCropImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteImage() {
    setState(() {
      _croppedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Store Logo', style: kFormLabelText),
          const SizedBox(height: 10),
          DottedBorder(
            color: const Color(0xFFE3E3E3),
            strokeWidth: 2,
            dashPattern: const [6, 3],
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            child: _croppedImage != null
                ? Container(
                    height: 174,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.file(
                          _croppedImage!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        IconButton(
                          icon: const Icon(Iconsax.trash, color: Colors.black),
                          onPressed: _deleteImage,
                          tooltip: 'Delete Image',
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 174,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: _showImageSourceDialog,
                          icon: const Icon(
                            Iconsax.document_upload,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Upload a logo (80px by 80px)',
                          style: kCustomizeHint,
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
