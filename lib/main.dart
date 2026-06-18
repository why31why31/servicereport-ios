import 'package:flutter/material.dart'; 
import 'package:flutter/services.dart'; 
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart'; 
import 'package:share_plus/share_plus.dart'; 
import 'package:image_picker/image_picker.dart'; 
import 'service_report.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart'; 
import 'dart:io';
import 'dart:convert'; 
import 'package:http/http.dart' as http; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [LocalReportSchema],
    directory: dir.path,
  );

  runApp(MyApp(isar: isar));
}

class MyApp extends StatelessWidget {
  final Isar isar;
  const MyApp({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finpac Service Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        primaryColor: const Color(0xFF0068C9), 
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0068C9), 
          background: const Color(0xFFF8F9FA),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF0068C9), width: 1.5),
          ),
        ),
      ),
      home: MainNavigationContainer(isar: isar), 
    );
  }
}

class MainNavigationContainer extends StatefulWidget {
  final Isar isar;
  const MainNavigationContainer({super.key, required this.isar});

  @override
  State<MainNavigationContainer> createState() => _MainNavigationContainerState();
}

class _MainNavigationContainerState extends State<MainNavigationContainer> {
  int _currentIndex = 0;
  LocalReport? _selectedReportToEdit; 
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _refreshPages();
  }

  void _refreshPages() {
    _pages = [
      FormReportOfflinePage(
        isar: widget.isar, 
        loadReportData: _selectedReportToEdit,
        onClearLoad: () {
          setState(() {
            _selectedReportToEdit = null;
            _refreshPages();
          });
        },
      ),
      HistoryAndDraftPage(
        isar: widget.isar,
        onLoadDraft: (report) {
          setState(() {
            _selectedReportToEdit = report; 
            _currentIndex = 0; 
            _refreshPages();
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF0068C9),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _refreshPages(); 
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.edit_document), label: 'Form Entry'),
          BottomNavigationBarItem(icon: Icon(Icons.history_toggle_off), label: 'History & Drafts'),
        ],
      ),
    );
  }
}

class ActionBlockModel {
  List<File> imageFiles = []; 
  String sizeLabel = 'Medium'; 
  final TextEditingController textController = TextEditingController();

  Future<String> toJsonString() async {
    List<String> base64Images = [];
    for (var file in imageFiles) {
      final bytes = await file.readAsBytes();
      base64Images.add(base64Encode(bytes));
    }
    return jsonEncode({
      'text': textController.text,
      'size': sizeLabel,
      'images': base64Images,
    });
  }

  static Future<ActionBlockModel> fromJsonString(String jsonStr) async {
    final block = ActionBlockModel();
    final map = jsonDecode(jsonStr);
    block.textController.text = map['text'] ?? '';
    block.sizeLabel = map['size'] ?? 'Medium';

    if (map['images'] != null) {
      final tempDir = await getTemporaryDirectory();
      List<dynamic> base64Images = map['images'];
      for (int i = 0; i < base64Images.length; i++) {
        final bytes = base64Decode(base64Images[i]);
        final tempFile = File('${tempDir.path}/draft_img_${DateTime.now().millisecondsSinceEpoch}_$i.jpg');
        await tempFile.writeAsBytes(bytes);
        block.imageFiles.add(tempFile);
      }
    }
    return block;
  }
}

class FormReportOfflinePage extends StatefulWidget {
  final Isar isar;
  final LocalReport? loadReportData; 
  final VoidCallback onClearLoad;

  const FormReportOfflinePage({
    super.key, 
    required this.isar, 
    this.loadReportData, 
    required this.onClearLoad
  });

  @override
  State<FormReportOfflinePage> createState() => _FormReportOfflinePageState();
}

class _FormReportOfflinePageState extends State<FormReportOfflinePage> {
  final _formKey = GlobalKey<FormState>();
  
  final _cbController = TextEditingController();
  final _cuController = TextEditingController();
  final _mwController = TextEditingController();
  final _tyController = TextEditingController();
  final _snController = TextEditingController();
  final _prController = TextEditingController();
  final _fuLegacyController = TextEditingController(); 
  final _dateController = TextEditingController();
  final _gDriveController = TextEditingController(); 
  
  String _selectedMachine = 'Siebler';
  String _selectedStatus = 'Done';
  bool _isSyncing = false; 
  int? _activeDraftId; 

  final String _googleSheetsUrl = "https://script.google.com/macros/s/AKfycbxfsxh32nXy93tMGqXzdWN7g4p3zDnPYZFrlqGGR9tsSYAzEwI92cE041Cm17kBdMKohw/exec";

  final List<String> _machines = ["Siebler", "Noack", "Kilian", "Romaco", "Promatic", "MG2", "Truking", "FrymaKoruma", "Stephan", "Other Machine"];
  final List<String> _statuses = ["Continue", "Pending", "Done"];

  final List<ActionBlockModel> _actionBlocks = [];
  final ImagePicker _picker = ImagePicker();

  final SignatureController _technicianSigController = SignatureController(penStrokeWidth: 2.5, penColor: const Color(0xFF0F172A));
  final SignatureController _customerSigController = SignatureController(penStrokeWidth: 2.5, penColor: const Color(0xFF0F172A));

  @override
  void initState() {
    super.initState();
    _checkAndLoadIncomingDraft();
  }

  Future<void> _checkAndLoadIncomingDraft() async {
    if (widget.loadReportData != null) {
      final data = widget.loadReportData!;
      
      setState(() {
        _activeDraftId = data.id;
        _cbController.text = data.completeBy ?? '';
        _cuController.text = data.customerName ?? '';
        _mwController.text = data.meetWith ?? '';
        _dateController.text = data.date ?? DateTime.now().toString().split(' ')[0];
        _tyController.text = data.machineType ?? '';
        _snController.text = data.serialNo ?? '';
        _prController.text = data.problemDescription ?? '';
        _fuLegacyController.text = data.actionTaken?.split('\n=== CHRONOLOGICAL')[0] ?? ''; 
        
        if (_machines.contains(data.machine)) _selectedMachine = data.machine!;
        if (_statuses.contains(data.status)) _selectedStatus = data.status!;
      });

      if (data.savedActionBlocks != null && data.savedActionBlocks!.isNotEmpty) {
        _actionBlocks.clear();
        for (var jsonStr in data.savedActionBlocks!) {
          final block = await ActionBlockModel.fromJsonString(jsonStr);
          _actionBlocks.add(block);
        }
        setState(() {}); 
      }

    } else {
      _dateController.text = DateTime.now().toString().split(' ')[0];
      _activeDraftId = null;
    }
  }

  @override
  void didUpdateWidget(covariant FormReportOfflinePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.loadReportData != oldWidget.loadReportData) {
      _checkAndLoadIncomingDraft();
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020), 
      lastDate: DateTime(2035),  
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF0068C9), 
              onPrimary: Colors.white,
              onSurface: Color(0xFF31333F),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(' ')[0]; 
      });
    }
  }

  void _resetEntireForm() {
    _formKey.currentState?.reset();
    _cbController.clear();
    _cuController.clear();
    _mwController.clear();
    _tyController.clear();
    _snController.clear();
    _prController.clear();
    _fuLegacyController.clear();
    _gDriveController.clear();
    _technicianSigController.clear();
    _customerSigController.clear();
    _actionBlocks.clear();
    widget.onClearLoad();
    setState(() {
      _activeDraftId = null;
      _dateController.text = DateTime.now().toString().split(' ')[0];
    });
  }

  Future<pw.Document> _buildActivePdfDocument() async {
    final pdf = pw.Document();
    final techSigBytes = await _technicianSigController.toPngBytes();
    final custSigBytes = await _customerSigController.toPngBytes();

    pw.MemoryImage? pdfLogo;
    try {
      final bytecode = await rootBundle.load('assets/logo_finpac.png');
      final imageBytes = bytecode.buffer.asUint8List();
      pdfLogo = pw.MemoryImage(imageBytes);
    } catch (e) {
      pdfLogo = null;
    }

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.only(left: 35, right: 35, top: 50, bottom: 50), 
        header: (pw.Context context) {
          if (context.pageNumber != 1) return pw.Container(); 
          return pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 20),
            alignment: pw.Alignment.center, 
            child: pdfLogo != null 
                ? pw.Container(width: 220, height: 75, child: pw.Image(pdfLogo, fit: pw.BoxFit.contain))
                : pw.SizedBox(height: 50),
          );
        },
        footer: (pw.Context context) {
          return pw.Container(
            alignment: pw.Alignment.centerRight,
            padding: const pw.EdgeInsets.only(top: 10),
            child: pw.Text("Page ${context.pageNumber}", style: pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
          );
        },
        build: (pw.Context context) => [
          pw.Container(
            width: double.infinity,
            decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFF2B82C9)),
            padding: const pw.EdgeInsets.symmetric(vertical: 6),
            alignment: pw.Alignment.center,
            child: pw.Text("SERVICE REPORT", style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, color: PdfColors.white, letterSpacing: 0.5)),
          ),
          pw.SizedBox(height: 12),
          // --- TABEL 1 (Technician, Date, Customer, Meet with) ---
          pw.Table(
            columnWidths: {
              0: const pw.FixedColumnWidth(65), // Technician, Customer
              1: const pw.FlexColumnWidth(1.2), // Input text
              2: const pw.FixedColumnWidth(10), // Jarak Kosong (Spacer)
              3: const pw.FixedColumnWidth(60), // Date, Meet with
              4: const pw.FlexColumnWidth(1.0)  // Input text
            },
            border: null, 
            defaultVerticalAlignment: pw.TableCellVerticalAlignment.bottom, 
            children: [
              pw.TableRow(children: [
                // Label Technician
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text("Technician:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                // Input Technician (Latar Abu + Garis Bawah Tipis)
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text(_cbController.text, style: pw.TextStyle(fontSize: 9.5))),
                pw.SizedBox(width: 10), // Kolom Jarak
                // Label Date
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text("Date:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                // Input Date (Latar Abu + Garis Bawah Tipis)
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text(_dateController.text, style: pw.TextStyle(fontSize: 9.5))),
              ]),
              // Baris kosong untuk memberi spasi
              pw.TableRow(children: [
                pw.SizedBox(height: 10), pw.SizedBox(height: 10), pw.SizedBox(height: 10), pw.SizedBox(height: 10), pw.SizedBox(height: 10),
              ]),
              pw.TableRow(children: [
                // Label Customer
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text("Customer:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                // Input Customer (Latar Abu + Garis Bawah Tipis)
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text(_cuController.text, style: pw.TextStyle(fontSize: 9.5))),
                pw.SizedBox(width: 10), // Kolom Jarak
                // Label Meet with
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text("Meet with:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                // Input Meet with (Latar Abu + Garis Bawah Tipis)
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text(_mwController.text, style: pw.TextStyle(fontSize: 9.5))),
              ]),
            ],
          ),
          
          pw.SizedBox(height: 10),
          
          // --- TABEL 2 (Machine, Type, S/N) ---
          pw.Table(
            columnWidths: {
              0: const pw.FixedColumnWidth(55), // Machine
              1: const pw.FlexColumnWidth(1.2), // Input text
              2: const pw.FixedColumnWidth(10), // Jarak Kosong (Spacer)
              3: const pw.FixedColumnWidth(35), // Type
              4: const pw.FlexColumnWidth(0.9), // Input text
              5: const pw.FixedColumnWidth(10), // Jarak Kosong (Spacer)
              6: const pw.FixedColumnWidth(25), // S/N
              7: const pw.FlexColumnWidth(0.8)  // Input text
            },
            border: null, 
            defaultVerticalAlignment: pw.TableCellVerticalAlignment.bottom,
            children: [
              pw.TableRow(children: [
                // Label Machine
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text("Machine:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                // Input Machine (Latar Abu + Garis Bawah Tipis)
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text(_selectedMachine, style: pw.TextStyle(fontSize: 9.5))),
                pw.SizedBox(width: 10), // Kolom Jarak
                // Label Type
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text("Type:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                // Input Type (Latar Abu + Garis Bawah Tipis)
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text(_tyController.text, style: pw.TextStyle(fontSize: 9.5))),
                pw.SizedBox(width: 10), // Kolom Jarak
                // Label S/N
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text("S/N:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                // Input S/N (Latar Abu + Garis Bawah Tipis)
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4), child: pw.Text(_snController.text, style: pw.TextStyle(fontSize: 9.5))),
              ]),
            ],
          ),
          pw.SizedBox(height: 18),

          pw.Text("PROBLEM DESCRIPTION", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10, color: PdfColors.black)),
          pw.Container(margin: const pw.EdgeInsets.only(top: 2, bottom: 6), height: 0.8, color: PdfColors.black), 
          pw.Text(_prController.text, style: pw.TextStyle(fontSize: 9.5, lineSpacing: 1.3)),
          pw.SizedBox(height: 18),

          pw.Text("FOLLOW UP ACTION", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10, color: PdfColors.black)),
          pw.Container(margin: const pw.EdgeInsets.only(top: 2, bottom: 6), height: 0.8, color: PdfColors.black),
          
          if (_fuLegacyController.text.isNotEmpty) ...[
            pw.Text(_fuLegacyController.text, style: pw.TextStyle(fontSize: 9.5, lineSpacing: 1.3)),
            pw.SizedBox(height: 10),
          ],
          
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start, 
            children: List.generate(_actionBlocks.length, (index) {
              final block = _actionBlocks[index];
              double targetHeight = 130; 
              if (block.sizeLabel == 'Small') targetHeight = 80;
              if (block.sizeLabel == 'Large') targetHeight = 220;

              return pw.Container(
                margin: const pw.EdgeInsets.only(bottom: 12),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start, 
                  children: [
                    if (block.imageFiles.isNotEmpty) 
                      pw.Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: block.imageFiles.map((img) {
                          return pw.Container(
                            height: targetHeight, 
                            child: pw.Image(pw.MemoryImage(img.readAsBytesSync()), fit: pw.BoxFit.contain),
                          );
                        }).toList(),
                      ),
                    if (block.imageFiles.isNotEmpty) pw.SizedBox(height: 4),
                    if (block.textController.text.isNotEmpty)
                      pw.Text(
                        block.textController.text,
                        style: pw.TextStyle(fontSize: 9.5, lineSpacing: 1.3, fontStyle: pw.FontStyle.italic),
                      ),
                  ],
                ),
              );
            }),
          ),

          pw.Spacer(), 
          // ========================================================
          
          pw.Container(
            padding: const pw.EdgeInsets.only(top: 10, left: 30, right: 30),
            decoration: const pw.BoxDecoration(border: pw.Border(top: pw.BorderSide(color: PdfColors.grey400, width: 0.5))),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Service Technician,", style: pw.TextStyle(fontSize: 9, fontStyle: pw.FontStyle.italic)),
                    pw.SizedBox(height: 35),
                    if (techSigBytes != null) pw.Container(width: 100, height: 40, child: pw.Image(pw.MemoryImage(techSigBytes))),
                    pw.SizedBox(height: 4),
                    pw.Text(_cbController.text.isNotEmpty ? _cbController.text : "...........................", style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Customer,", style: pw.TextStyle(fontSize: 9, fontStyle: pw.FontStyle.italic)),
                    pw.SizedBox(height: 35),
                    if (custSigBytes != null) pw.Container(width: 100, height: 40, child: pw.Image(pw.MemoryImage(custSigBytes))),
                    pw.SizedBox(height: 4),
                    pw.Text(_mwController.text.isNotEmpty ? _mwController.text : "...........................", style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return pdf;
  }

  void _openRealPrintPreviewPage() async {
    if (_cbController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ Technician Name is required to preview document!'), backgroundColor: Colors.red),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF0068C9),
            title: const Text("Live PDF Composition", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          body: PdfPreview(
            build: (format) async {
              final pdfDoc = await _buildActivePdfDocument();
              return pdfDoc.save();
            },
            allowPrinting: false, 
            allowSharing: false,  
            canChangeOrientation: false,
            canChangePageFormat: false,
            initialPageFormat: PdfPageFormat.a4,
            pdfFileName: "Draft_Composition.pdf",
          ),
        ),
      ),
    );
  }

  Future<void> _syncToGoogleSheets() async {
    if (!_formKey.currentState!.validate()) return;

    if (_googleSheetsUrl.isEmpty || _googleSheetsUrl.contains("MASUKKAN_URL")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('⚠️ Please insert your Apps Script Deployment URL first!'), backgroundColor: Colors.orange),
      );
      return;
    }

    setState(() {
      _isSyncing = true;
    });

    String namaHari = "Monday";
    try {
      DateTime parsedDate = DateTime.parse(_dateController.text);
      List<String> hariEnglish = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
      namaHari = hariEnglish[parsedDate.weekday % 7];
    } catch (e) {
      namaHari = "-";
    }

    String blockLogsText = "";
    for (var b in _actionBlocks) {
      if (b.textController.text.isNotEmpty) {
        blockLogsText += "\n- ${b.textController.text} (${b.imageFiles.length} images annexed)";
      }
    }
    String gabunganAction = "${_fuLegacyController.text}$blockLogsText".trim();

    final Map<String, dynamic> reportData = {
      "date": _dateController.text,
      "day": namaHari, 
      "customer": _cuController.text,
      "machine": _selectedMachine,
      "machineType": _tyController.text,
      "serialNo": _snController.text,
      "problemDescription": _prController.text,
      "actionTaken": gabunganAction, 
      "completeBy": _cbController.text,
      "status": _selectedStatus,
      "serviceReportLink": _gDriveController.text, 
    };

    try {
      final response = await http.post(
        Uri.parse(_googleSheetsUrl),
        body: jsonEncode(reportData),
      );

      if (response.statusCode == 200 || response.statusCode == 302) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('🚀 Success! Data & GDrive link integrated into Spreadsheet.'), backgroundColor: Color(0xFF097969)),
        );
        
        if (_activeDraftId != null) {
          final existing = await widget.isar.localReports.get(_activeDraftId!);
          if (existing != null) {
            await widget.isar.writeTxn(() async {
              existing.isSynced = true; 
              await widget.isar.localReports.put(existing);
            });
          }
        }
      } else {
        throw Exception("Server return code: ${response.statusCode}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Sync failed: $e'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() {
        _isSyncing = false;
      });
    }
  }

  void _addNewActionBlock() {
    setState(() {
      _actionBlocks.add(ActionBlockModel());
    });
  }

  void _removeActionBlock(int index) {
    setState(() {
      _actionBlocks[index].textController.dispose();
      _actionBlocks.removeAt(index);
    });
  }

  void _pickBlockImage(int index, ImageSource source) async {
    if (source == ImageSource.gallery) {
      final List<XFile> pickedFiles = await _picker.pickMultiImage(
        imageQuality: 35, 
      );
      if (pickedFiles.isNotEmpty) {
        setState(() {
          _actionBlocks[index].imageFiles.addAll(
            pickedFiles.map((file) => File(file.path))
          ); 
        });
      }
    } else {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 35, 
      );
      if (pickedFile != null) {
        setState(() {
          _actionBlocks[index].imageFiles.add(File(pickedFile.path)); 
        });
      }
    }
  }

  void _saveDataLokal() async {
    if (_formKey.currentState!.validate()) {
      final techSigBytes = await _technicianSigController.toPngBytes();
      final custSigBytes = await _customerSigController.toPngBytes();
      
      List<String> blocksJsonList = [];
      String blockLogsText = "";
      for (var b in _actionBlocks) {
        blocksJsonList.add(await b.toJsonString()); 
        blockLogsText += "\n- [Photo Block Logs (${b.sizeLabel}) - Total photos: ${b.imageFiles.length}]: ${b.textController.text}";
      }

      final newReport = LocalReport()
        ..completeBy = _cbController.text
        ..customerName = _cuController.text
        ..machine = _selectedMachine
        ..date = _dateController.text 
        ..meetWith = _mwController.text
        ..machineType = _tyController.text
        ..serialNo = _snController.text
        ..problemDescription = _prController.text
        ..actionTaken = "${_fuLegacyController.text}\n=== CHRONOLOGICAL PHOTO LOGS ===$blockLogsText"
        ..status = _selectedStatus
        ..technicianSignatureBase64 = techSigBytes != null ? techSigBytes.toString() : null
        ..customerSignatureBase64 = custSigBytes != null ? custSigBytes.toString() : null
        ..savedActionBlocks = blocksJsonList 
        ..isSynced = false;

      if (_activeDraftId != null) {
        newReport.id = _activeDraftId!; 
      }

      await widget.isar.writeTxn(() async {
        await widget.isar.localReports.put(newReport);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('💾 Draft Saved with Photos!'), backgroundColor: Color(0xFF097969)),
      );
    }
  }

  void _generatePdfReport() async {
    final pdfDoc = await _buildActivePdfDocument();
    try {
      final output = await getApplicationDocumentsDirectory();
      String customerName = _cuController.text.trim().replaceAll(RegExp(r'[^\w\s\-]'), '');
      if (customerName.isEmpty) customerName = "Customer";
      
      final file = File("${output.path}/Report_${customerName}_${_dateController.text}.pdf");
      await file.writeAsBytes(await pdfDoc.save());

      await Share.shareXFiles([XFile(file.path)]);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('❌ Failed to execute PDF output: $e')));
    }
  }

  Widget _buildStreamlitLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 12),
      child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF31333F))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, 
        backgroundColor: const Color(0xFF0068C9), 
        elevation: 0,
        centerTitle: true, 
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), 
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.asset(
                'assets/logo_aplikasi.png', 
                height: 40,  
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => 
                    const Text('⚠️ Logo error', style: TextStyle(color: Colors.red, fontSize: 10)),
              ),
            ),
            Text(
              _activeDraftId == null ? 'Service Report Input Portal' : 'Editing Draft Active (#${_activeDraftId})', 
              style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)
            ),
          ],
        ),
        actions: [
          if (_activeDraftId != null)
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: _resetEntireForm,
              tooltip: 'Clear/Reset Draft',
            )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              _buildStreamlitLabel("Complete by *"),
              TextFormField(controller: _cbController, validator: (v) => v!.isEmpty ? 'This field is required' : null),
              
              _buildStreamlitLabel("Customer"),
              TextFormField(controller: _cuController),

              _buildStreamlitLabel("Meet with"),
              TextFormField(controller: _mwController),

              _buildStreamlitLabel("Date"),
              TextFormField(
                controller: _dateController,
                readOnly: true, 
                onTap: () => _selectDate(context), 
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month, color: Color(0xFF0068C9)), 
                ),
              ),

              _buildStreamlitLabel("Machine"),
              DropdownButtonFormField(
                value: _selectedMachine,
                items: _machines.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
                onChanged: (v) => setState(() => _selectedMachine = v.toString()),
              ),
              
              _buildStreamlitLabel("Machine Type"),
              TextFormField(controller: _tyController),
              
              _buildStreamlitLabel("Serial No"),
              TextFormField(controller: _snController),
              
              const SizedBox(height: 15),

              Card(
                color: Colors.white,
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStreamlitLabel("Problem Description"),
                      TextFormField(controller: _prController, maxLines: 4),
                      
                      _buildStreamlitLabel("Action Taken / Follow Up"),
                      TextFormField(controller: _fuLegacyController, maxLines: 6, decoration: const InputDecoration(hintText: "")),
                      
                      const SizedBox(height: 15),
                      const Text("📸 Attachments:", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0068C9))),
                      const Divider(color: Color(0xFFE0E0E0)),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _actionBlocks.length,
                        itemBuilder: (context, index) {
                          final block = _actionBlocks[index];
                          double previewHeight = 110;
                          if (block.sizeLabel == 'Small') previewHeight = 70;
                          if (block.sizeLabel == 'Large') previewHeight = 170;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8F9FA),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFFE2E8F0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Photo Block #${index + 1} (${block.imageFiles.length} Photos)", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xFF31333F))),
                                    IconButton(
                                      icon: const Icon(Icons.delete_forever, color: Colors.red, size: 20),
                                      onPressed: () => _removeActionBlock(index),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                
                                if (block.imageFiles.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: block.imageFiles.map((file) {
                                        return Container(
                                          height: previewHeight,
                                          width: 100, 
                                          decoration: BoxDecoration(
                                            border: Border.all(color: const Color(0xFFCBD5E1)),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(4),
                                            child: Image.file(file, fit: BoxFit.cover),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE2E8F0), elevation: 0),
                                      icon: const Icon(Icons.add_a_photo, size: 14, color: Colors.black87),
                                      label: const Text("Add Photo", style: TextStyle(fontSize: 11, color: Colors.black87)),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (ctx) => SafeArea(
                                            child: Wrap(
                                              children: [
                                                ListTile(
                                                  leading: const Icon(Icons.camera_alt),
                                                  title: const Text('Camera'),
                                                  onTap: () { Navigator.pop(ctx); _pickBlockImage(index, ImageSource.camera); },
                                                ),
                                                ListTile(
                                                  leading: const Icon(Icons.photo_library),
                                                  title: const Text('Phone Gallery'),
                                                  onTap: () { Navigator.pop(ctx); _pickBlockImage(index, ImageSource.gallery); },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Row(
                                      children: ['Small', 'Medium', 'Large'].map((size) {
                                        bool isSelected = block.sizeLabel == size;
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 2),
                                          child: ChoiceChip(
                                            label: Text(size, style: TextStyle(fontSize: 10, color: isSelected ? Colors.white : Colors.black87)),
                                            selected: isSelected,
                                            selectedColor: const Color(0xFF0068C9),
                                            backgroundColor: const Color(0xFFE2E8F0),
                                            onSelected: (bool selected) {
                                              if (selected) {
                                                setState(() {
                                                  block.sizeLabel = size; 
                                                });
                                              }
                                            },
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: block.textController,
                                  maxLines: 2,
                                  decoration: const InputDecoration(
                                    hintText: "Type specific explanation for this photo block...",
                                    hintStyle: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      OutlinedButton.icon(
                        onPressed: _addNewActionBlock,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF0068C9), width: 1.5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        icon: const Icon(Icons.add, color: Color(0xFF0068C9)),
                        label: const Text('➕ ADD NEW PHOTO BLOCK', style: TextStyle(color: Color(0xFF0068C9), fontWeight: FontWeight.bold, fontSize: 13)),
                      ),

                      const SizedBox(height: 12),
                      _buildStreamlitLabel("Status"),
                      DropdownButtonFormField(
                        value: _selectedStatus,
                        items: _statuses.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                        onChanged: (v) => setState(() => _selectedStatus = v.toString()),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 15),

              Card(
                color: Colors.white,
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("✍️ SIGNATURE", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0068C9))),
                      const Divider(color: Color(0xFFE0E0E0)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Service Technician", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 6),
                                Container(
                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xFFCBD5E1)), borderRadius: BorderRadius.circular(6)),
                                  child: Signature(controller: _technicianSigController, height: 150, backgroundColor: const Color(0xFFF8F9FA)),
                                ),
                                TextButton(onPressed: () => _technicianSigController.clear(), child: const Text("Reset Signature", style: TextStyle(color: Colors.red, fontSize: 11))),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Customer", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 6),
                                Container(
                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xFFCBD5E1)), borderRadius: BorderRadius.circular(6)),
                                  child: Signature(controller: _customerSigController, height: 150, backgroundColor: const Color(0xFFF8F9FA)),
                                ),
                                TextButton(onPressed: () => _customerSigController.clear(), child: const Text("Reset Signature", style: TextStyle(color: Colors.red, fontSize: 11))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 25),

              OutlinedButton.icon(
                onPressed: _openRealPrintPreviewPage,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  side: const BorderSide(color: Color(0xFF0068C9), width: 1.8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                icon: const Icon(Icons.picture_in_picture, color: Color(0xFF0068C9)),
                label: const Text('🔍PRINT PREVIEW', style: TextStyle(color: Color(0xFF0068C9), fontWeight: FontWeight.bold, fontSize: 14)),
              ),

              const SizedBox(height: 12),

              ElevatedButton.icon(
                onPressed: _generatePdfReport,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0068C9), 
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
                label: const Text('🚀 GENERATE & SHARE PDF REPORT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              
              const SizedBox(height: 15),

              _buildStreamlitLabel("Link Google Drive PDF"),
              TextField(
                controller: _gDriveController,
                decoration: const InputDecoration(
                  hintText: "Paste Google Drive PDF file share link here...",
                  hintStyle: TextStyle(fontSize: 12),
                  suffixIcon: Icon(Icons.link, color: Color(0xFF0068C9)),
                ),
              ),

              const SizedBox(height: 15),
              
              _isSyncing 
                ? const Center(child: Padding(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()))
                : ElevatedButton.icon(
                    onPressed: _syncToGoogleSheets,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F172A), 
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    icon: const Icon(Icons.cloud_upload, color: Colors.white),
                    label: const Text('🚀 SYNC DATA TO GOOGLE SHEETS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  ),

              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _saveDataLokal,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  side: const BorderSide(color: Color(0xFF0068C9), width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                icon: const Icon(Icons.save, color: Color(0xFF0068C9)),
                label: const Text('💾 SAVE DRAFT', style: TextStyle(color: Color(0xFF0068C9), fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryAndDraftPage extends StatefulWidget {
  final Isar isar;
  final Function(LocalReport) onLoadDraft; 

  const HistoryAndDraftPage({super.key, required this.isar, required this.onLoadDraft});

  @override
  State<HistoryAndDraftPage> createState() => _HistoryAndDraftPageState();
}

class _HistoryAndDraftPageState extends State<HistoryAndDraftPage> {
  List<LocalReport> _allLocalReports = [];
  List<LocalReport> _filteredReports = [];
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadHistoryFromIsar();
  }

  Future<void> _loadHistoryFromIsar() async {
    final reports = await widget.isar.localReports.where().findAll();
    final reversedReports = reports.reversed.toList();
    setState(() {
      _allLocalReports = reversedReports;
      _filteredReports = reversedReports;
    });
  }

  void _runSearchFilter(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredReports = _allLocalReports;
      });
      return;
    }

    final lowerCaseQuery = query.toLowerCase();
    setState(() {
      _filteredReports = _allLocalReports.where((report) {
        final custName = (report.customerName ?? '').toLowerCase();
        final machName = (report.machine ?? '').toLowerCase();
        final techName = (report.completeBy ?? '').toLowerCase();
        return custName.contains(lowerCaseQuery) || machName.contains(lowerCaseQuery) || techName.contains(lowerCaseQuery);
      }).toList();
    });
  }

  Future<void> _deleteReport(int id) async {
    await widget.isar.writeTxn(() async {
      await widget.isar.localReports.delete(id);
    });
    _loadHistoryFromIsar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('🗑️ Report successfully deleted from storage.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Reports & Drafts Storage', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0F172A), 
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _runSearchFilter,
              decoration: InputDecoration(
                hintText: "Search by Customer, Machine or Tech...",
                prefixIcon: const Icon(Icons.search, color: Color(0xFF0068C9)),
                suffixIcon: _searchController.text.isNotEmpty 
                    ? IconButton(icon: const Icon(Icons.clear), onPressed: () { _searchController.clear(); _runSearchFilter(''); }) 
                    : null,
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _filteredReports.isEmpty
                  ? const Center(child: Text("No local reports or drafts found.", style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      itemCount: _filteredReports.length,
                      itemBuilder: (context, index) {
                        final report = _filteredReports[index];
                        final bool isSynced = report.isSynced;

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.grey[200]!)),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: isSynced ? const Color(0xFFE6F4EA) : const Color(0xFFFFF7ED),
                              child: Icon(
                                isSynced ? Icons.cloud_done : Icons.edit_note, 
                                color: isSynced ? const Color(0xFF137333) : const Color(0xFFC2410C)
                              ),
                            ),
                            title: Text(report.customerName?.isNotEmpty == true ? report.customerName! : 'Unknown Customer', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            subtitle: Text("Machine: ${report.machine ?? '-'} | Date: ${report.date ?? '-'}\nStatus: ${report.status ?? '-'}", style: const TextStyle(fontSize: 11)),
                            trailing: Wrap(
                              spacing: 4,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.open_in_new, color: Color(0xFF0068C9), size: 20),
                                  onPressed: () => widget.onLoadDraft(report), 
                                  tooltip: 'Load Data to Form',
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Delete Report", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                        content: const Text("Are you sure you want to permanently delete this report from device?", style: TextStyle(fontSize: 12)),
                                        actions: [
                                          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("CANCEL")),
                                          TextButton(onPressed: () { Navigator.pop(ctx); _deleteReport(report.id); }, child: const Text("DELETE", style: TextStyle(color: Colors.red))),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}