import 'package:isar/isar.dart';

part 'spare_part_draft.g.dart';

@collection
class SparePartDraft {
  Id id = Isar.autoIncrement;

  String? customer;
  String? machine;
  String? technician;
  String? date;
  String? notes;

  List<SparePartDraftItem>? items;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

@embedded
class SparePartDraftItem {
  String? partName;
  String? partNumber;
  String? qty;
  String? remark;
  String? imagePath; // Lokasi penyimpanan foto lokal
}