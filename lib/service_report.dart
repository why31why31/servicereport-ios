import 'package:isar/isar.dart';

part 'service_report.g.dart';

@collection
class LocalReport {
  Id id = Isar.autoIncrement; // ID otomatis dari Isar

  late String completeBy;
  late String customerName;
  late String machine;
  late String date;
  late String meetWith;
  late String machineType;
  late String serialNo;
  late String problemDescription;
  late String actionTaken;
  late String status;
  
  String? technicianSignatureBase64; // Menyimpan gambar TTD sebagai teks aman
  String? customerSignatureBase64;
  
  @Index()
  bool isSynced = false; // Penanda apakah data sudah dikirim ke Google Sheets
}