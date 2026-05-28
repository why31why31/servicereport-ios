import 'dart:io';
import 'dart:typed_data'; // <-- Pustaka tambahan untuk membaca Uint8List
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'report_model.dart';

class PdfService {
  static Future<void> generateAndOpenPdf(ServiceReport report) async {
    final pdf = pw.Document();

    // Mengonversi List<int> dari Isar menjadi Uint8List yang diminta oleh paket PDF
    final techSignImage = pw.MemoryImage(Uint8List.fromList(report.technicianSignature));
    final custSignImage = pw.MemoryImage(Uint8List.fromList(report.customerSignature));

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        header: (pw.Context context) {
          if (context.pageNumber == 1) {
            return pw.Column(
              children: [
                pw.Center(
                  child: pw.Text(
                    'PT. FINPAC ANUGERAH INDONESIA',
                    style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Center(
                  child: pw.Text('Laporan Analisa Teknis & Hasil Servis Lapangan'),
                ),
                pw.Divider(thickness: 2),
                pw.SizedBox(height: 20),
              ],
            );
          }
          return pw.SizedBox.shrink();
        },
        build: (pw.Context context) {
          return [
            pw.Text('DATA SERVICE REPORT', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            
            // Menggunakan Bullet poin standar PDF untuk menyusun data input servis Anda
            pw.Bullet(text: 'Complete by: ${report.completeBy}'),
            pw.Bullet(text: 'Customer: ${report.customer}'),
            pw.Bullet(text: 'Machine: ${report.machine}'),
            pw.Bullet(text: 'Date: ${report.date}'),
            pw.Bullet(text: 'Meet with: ${report.meetWith}'),
            pw.Bullet(text: 'Type: ${report.type}'),
            pw.Bullet(text: 'Serial No: ${report.serialNo}'),
            
            pw.SizedBox(height: 40),
            pw.Divider(),
            pw.SizedBox(height: 20),

            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  children: [
                    pw.Text('Dibuat Oleh (Teknisi):'),
                    pw.SizedBox(height: 10),
                    pw.Container(
                      width: 120,
                      height: 60,
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: PdfColors.grey),
                      ),
                      child: pw.Image(techSignImage, fit: pw.BoxFit.cover),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(report.completeBy, style: pw.TextStyle(decoration: pw.TextDecoration.underline)),
                  ],
                ),
                pw.Column(
                  children: [
                    pw.Text('Disetujui Oleh (Customer):'),
                    pw.SizedBox(height: 10),
                    pw.Container(
                      width: 120,
                      height: 60,
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: PdfColors.grey),
                      ),
                      child: pw.Image(custSignImage, fit: pw.BoxFit.cover),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(report.meetWith, style: pw.TextStyle(decoration: pw.TextDecoration.underline)),
                  ],
                ),
              ],
            ),
          ];
        },
      ),
    );

    final outputDir = await getExternalStorageDirectory();
    final file = File("${outputDir!.path}/Service_Report_${DateTime.now().millisecondsSinceEpoch}.pdf");
    await file.writeAsBytes(await pdf.save());

    await OpenFile.open(file.path);
  }
}