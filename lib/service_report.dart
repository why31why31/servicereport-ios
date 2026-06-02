import 'package:isar/isar.dart';
part 'service_report.g.dart';

@collection
class LocalReport {
  Id id = Isar.autoIncrement;

  String? date;
  String? customerName;
  String? machine;
  String? machineType;
  String? serialNo;
  String? problemDescription;
  String? actionTaken;
  String? completeBy;
  String? meetWith;
  String? status;
  String? technicianSignatureBase64;
  String? customerSignatureBase64;
  bool isSynced = false;
  
  // Laci untuk menyimpan blok foto draf
  List<String>? savedActionBlocks; 
}