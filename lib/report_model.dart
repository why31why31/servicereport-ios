import 'package:isar/isar.dart';

// Menandakan bahwa ini adalah file yang akan digenerate otomatis oleh Isar
part 'report_model.g.dart';

@collection
class ServiceReport {
  Id id = Isar.autoIncrement; // ID otomatis untuk database

  late String completeBy;
  late String customer;
  late String machine;
  late String date;
  late String meetWith;
  late String type;
  late String serialNo;

  // Menggunakan `@ignore` atau tipe `List<int>` standar Isar untuk menampung data tanda tangan byte
  late List<int> technicianSignature;
  late List<int> customerSignature;
}