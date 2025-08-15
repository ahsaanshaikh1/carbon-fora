import 'dart:io';

class FilePickerM {
  final List<File> files;
  final List<String> names;
  final File? file;
  final String? name;
  final List<String> mimeTypes;
  final String mimeType;
  final List<String> extensions;
  final String extension;
  final List<String> sizes;
  final String size;

  FilePickerM({
    required this.files,
    required this.names,
    this.file,
    this.name,
    required this.mimeTypes,
    required this.mimeType,
    required this.extensions,
    required this.extension,
    required this.sizes,
    required this.size,
  });
}
