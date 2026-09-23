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
import 'spare_part_page.dart';
import 'spare_part_draft.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final dir = await getApplicationDocumentsDirectory();
  
  final isar = await Isar.open(
    [
      LocalReportSchema, 
      SparePartDraftSchema,
    ],
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
  SparePartDraft? _selectedPartDraftToEdit;
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
        onLoadPartDraft: (partDraft) {
          setState(() {
            _selectedPartDraftToEdit = partDraft;
            _currentIndex = 2; 
            _refreshPages();
          });
        },
      ),
      SparePartRecommendationPage(
        isar: widget.isar,
        loadDraftData: _selectedPartDraftToEdit,
        onClearLoad: () {
          setState(() {
            _selectedPartDraftToEdit = null;
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
        type: BottomNavigationBarType.fixed,
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
          BottomNavigationBarItem(icon: Icon(Icons.build_circle_outlined), label: 'Part List'),
        ],
      ),
    );
  }
}

class ActionBlockModel {
  List<File> imageFiles = []; 
  double imageSize = 130.0;
  final TextEditingController textController = TextEditingController();

  Future<String> toJsonString() async {
    List<String> base64Images = [];
    for (var file in imageFiles) {
      final bytes = await file.readAsBytes();
      base64Images.add(base64Encode(bytes));
    }
    return jsonEncode({
      'text': textController.text,
      'size': imageSize,
      'images': base64Images,
    });
  }

  static Future<ActionBlockModel> fromJsonString(String jsonStr) async {
    final block = ActionBlockModel();
    final map = jsonDecode(jsonStr);
    block.textController.text = map['text'] ?? '';
    
    var savedSize = map['size'];
    if (savedSize is String) {
      if (savedSize == 'Small') block.imageSize = 80.0;
      else if (savedSize == 'Large') block.imageSize = 220.0;
      else block.imageSize = 130.0;
    } else if (savedSize is num) {
      block.imageSize = savedSize.toDouble();
    } else {
      block.imageSize = 130.0;
    }

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

  List<String> _selectedTechnicians = [];
  final List<String> _techniciansList = [
    "Asep Wahyu",
    "Rangga W",
    "Wahyu",
    "Ali Akbar",
    "Karim"
  ];

  String? _selectedCustomer;
  bool _isCustomCustomer = false;

  final List<String> _customerList = [
    "PT Kalbe Farma",
    "PT Dankos Laboratories Tbk",
    "PT Hexpharm Jaya",
    "PT Darya Varia Citeureup",
    "PT Darya Varia Gn.Putri",
    "PT Medifarma Laboratories",
    "PT Dexa Medica",
    "PT Ferron",
    "PT Mahakam Beta Farma",
    "PT Supra Ferbindo Farma",
    "PT Tempo Scan Pacific",
    "PT Abbot Indonesia",
    "PT Actavis",
    "PT Bayer Indonesia Tbk",
    "PT Bernofarma",
    "PT Bio Farma",
    "PT Bufa Aneka",
    "PT Pratapa Nirmala (Fahrenheit)",
    "PT First Medifarma",
    "PT Henson Farma",
    "PT Indofarma",
    "PT Interbat",
    "PT Ikapharmindo Putramas",
    "PT Kimia Farma",
    "PT Konimex",
    "PT Lapi Laboratories",
    "PT Meiji Indonesia",
    "PT Meprofarm",
    "PT Merck Indonesia",
    "PT Mersifarma",
    "PT Otsuka Indonesia",
    "PT Otto Pharma",
    "PT Pfizer Indonesia Tbk",
    "PT Phapros",
    "PT Pharos Indonesia",
    "PT Pyridam",
    "PT Saka Farma Laboratories",
    "PT Sanbe Farma",
    "PT Caprifarmindo",
    "PT Combiphar",
    "PT Takeda Indonesia",
    "PT Tanabe Indonesia",
    "PT Tropica Mas Pharmaceuticals",
    "PT Zenith Pharmaceutical",
    "Other (Type manually)"
  ];

  final String _googleSheetsUrl = "https://script.google.com/macros/s/AKfycbxfsxh32nXy93tMGqXzdWN7g4p3zDnPYZFrlqGGR9tsSYAzEwI92cE041Cm17kBdMKohw/exec";

  final List<String> _machines = ["Siebler", "Noack", "Kilian", "Romaco", "Macofar", "Promatic", "MG2", "Truking", "FrymaKoruma", "Stephan", "Other Machine"];
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
        _selectedTechnicians = data.completeBy?.isNotEmpty == true ? data.completeBy!.split('/') : [];
        _cuController.text = data.customerName ?? '';
        _mwController.text = data.meetWith ?? '';
        _dateController.text = data.date ?? _formatDate(DateTime.now());
        _tyController.text = data.machineType ?? '';
        _snController.text = data.serialNo ?? '';
        _prController.text = data.problemDescription ?? '';
        _fuLegacyController.text = data.actionTaken?.split('\n=== CHRONOLOGICAL')[0] ?? ''; 
        
        if (_machines.contains(data.machine)) _selectedMachine = data.machine!;
        if (_statuses.contains(data.status)) _selectedStatus = data.status!;

        if (data.customerName != null && data.customerName!.isNotEmpty) {
          if (_customerList.contains(data.customerName)) {
            _selectedCustomer = data.customerName;
            _isCustomCustomer = false;
          } else {
            _selectedCustomer = 'Other (Type manually)';
            _isCustomCustomer = true;
          }
        } else {
          _selectedCustomer = null;
          _isCustomCustomer = false;
        }
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
      _dateController.text = _formatDate(DateTime.now());
      _activeDraftId = null;
      _selectedCustomer = null;
      _isCustomCustomer = false;
      _selectedTechnicians.clear();
      _cbController.clear();
    }
  }

  void _showTechnicianMultiSelectDialog() async {
    List<String> tempSelected = List.from(_selectedTechnicians);

    await showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Select Technician(s)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _techniciansList.map((tech) {
                    final isChecked = tempSelected.contains(tech);
                    return CheckboxListTile(
                      title: Text(tech, style: const TextStyle(fontSize: 14)),
                      value: isChecked,
                      activeColor: const Color(0xFF0068C9),
                      onChanged: (bool? checked) {
                        setDialogState(() {
                          if (checked == true) {
                            tempSelected.add(tech);
                          } else {
                            tempSelected.remove(tech);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text("CANCEL"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0068C9)),
                  onPressed: () {
                    setState(() {
                      _selectedTechnicians = tempSelected;
                      _cbController.text = _selectedTechnicians.join('/');
                    });
                    Navigator.pop(ctx);
                  },
                  child: const Text("OK", style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void didUpdateWidget(covariant FormReportOfflinePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.loadReportData != oldWidget.loadReportData) {
      _checkAndLoadIncomingDraft();
    }
  }

  String _formatDate(DateTime d) {
    return "${d.day.toString().padLeft(2, '0')}-${d.month.toString().padLeft(2, '0')}-${d.year}";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      ),
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
        String startStr = _formatDate(picked.start);
        String endStr = _formatDate(picked.end);

        if (picked.start.year == picked.end.year &&
            picked.start.month == picked.end.month &&
            picked.start.day == picked.end.day) {
          _dateController.text = startStr;
        } else {
          _dateController.text = "$startStr to $endStr";
        }
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
    _selectedTechnicians.clear();
    widget.onClearLoad();
    setState(() {
      _activeDraftId = null;
      _dateController.text = _formatDate(DateTime.now());
      _selectedCustomer = null;
      _isCustomCustomer = false;
    });
  }

  Future<pw.Document> _buildActivePdfDocument() async {
    final fontRegular = await PdfGoogleFonts.robotoRegular();
    final fontBold = await PdfGoogleFonts.robotoBold();
    final fontItalic = await PdfGoogleFonts.robotoItalic();

    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: fontRegular,
        bold: fontBold,
        italic: fontItalic,
      ),
    );

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
        margin: const pw.EdgeInsets.only(left: 35, right: 35, top: 35, bottom: 40), 
        header: (pw.Context context) {
          if (context.pageNumber != 1) {
            return pw.SizedBox(height: 40); 
          }
          return pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 6),
            alignment: pw.Alignment.center, 
            child: pdfLogo != null 
                ? pw.Container(width: 220, height: 70, child: pw.Image(pdfLogo, fit: pw.BoxFit.contain))
                : pw.SizedBox(height: 40),
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
            padding: const pw.EdgeInsets.symmetric(vertical: 5),
            alignment: pw.Alignment.center,
            child: pw.Text("SERVICE REPORT", style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold, color: PdfColors.white, letterSpacing: 0.5)),
          ),
          
          pw.SizedBox(height: 8), 
          
          pw.Table(
            columnWidths: {
              0: const pw.FixedColumnWidth(65), 
              1: const pw.FlexColumnWidth(1.2), 
              2: const pw.FixedColumnWidth(10), 
              3: const pw.FixedColumnWidth(60), 
              4: const pw.FlexColumnWidth(1.0)  
            },
            border: null, 
            defaultVerticalAlignment: pw.TableCellVerticalAlignment.bottom, 
            children: [
              pw.TableRow(children: [
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text("Technician:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text(_cbController.text, style: pw.TextStyle(fontSize: 9.5))),
                pw.SizedBox(width: 10), 
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text("Date:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text(_dateController.text, style: pw.TextStyle(fontSize: 9.5))),
              ]),
              pw.TableRow(children: [
                pw.SizedBox(height: 8), pw.SizedBox(height: 8), pw.SizedBox(height: 8), pw.SizedBox(height: 8), pw.SizedBox(height: 8),
              ]),
              pw.TableRow(children: [
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text("Customer:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text(_cuController.text, style: pw.TextStyle(fontSize: 9.5))),
                pw.SizedBox(width: 10), 
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text("Meet with:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text(_mwController.text, style: pw.TextStyle(fontSize: 9.5))),
              ]),
            ],
          ),
          
          pw.SizedBox(height: 8), 
          
          pw.Table(
            columnWidths: {
              0: const pw.FixedColumnWidth(55), 
              1: const pw.FlexColumnWidth(1.2), 
              2: const pw.FixedColumnWidth(10), 
              3: const pw.FixedColumnWidth(35), 
              4: const pw.FlexColumnWidth(0.9), 
              5: const pw.FixedColumnWidth(10), 
              6: const pw.FixedColumnWidth(30), 
              7: const pw.FlexColumnWidth(0.8)  
            },
            border: null, 
            defaultVerticalAlignment: pw.TableCellVerticalAlignment.bottom,
            children: [
              pw.TableRow(children: [
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text("Machine:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text(_selectedMachine, style: pw.TextStyle(fontSize: 9.5))),
                pw.SizedBox(width: 10), 
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text("Type:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text(_tyController.text, style: pw.TextStyle(fontSize: 9.5))),
                pw.SizedBox(width: 10), 
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text("S/N:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4), child: pw.Text(_snController.text, style: pw.TextStyle(fontSize: 9.5))),
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
              double targetHeight = block.imageSize; 

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
          
          pw.Container(
            padding: const pw.EdgeInsets.only(top: 10, left: 30, right: 30),
            decoration: const pw.BoxDecoration(border: pw.Border(top: pw.BorderSide(color: PdfColors.grey400, width: 0.5))),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center, 
                  children: [
                    pw.Text("Service Technician,", style: pw.TextStyle(fontSize: 9.5, fontStyle: pw.FontStyle.italic)),
                    pw.SizedBox(height: 15),
                    
                    if (techSigBytes != null) 
                      pw.Container(width: 100, height: 40, child: pw.Image(pw.MemoryImage(techSigBytes)))
                    else 
                      pw.SizedBox(height: 40), 
                      
                    pw.SizedBox(height: 10), 
                    pw.Text(_cbController.text.isNotEmpty ? _cbController.text : "...........................", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center, 
                  children: [
                    pw.Text("Customer,", style: pw.TextStyle(fontSize: 9.5, fontStyle: pw.FontStyle.italic)),
                    pw.SizedBox(height: 15), 
                    
                    if (custSigBytes != null) 
                      pw.Container(width: 100, height: 40, child: pw.Image(pw.MemoryImage(custSigBytes)))
                    else 
                      pw.SizedBox(height: 40), 
                      
                    pw.SizedBox(height: 10), 
                    pw.Text(_mwController.text.isNotEmpty ? _mwController.text : "...........................", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold)),
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
      String firstDatePart = _dateController.text.split(' to ')[0];
      List<String> parts = firstDatePart.split('-');

      if (parts.length == 3) {
        int day = int.parse(parts[0]);
        int month = int.parse(parts[1]);
        int year = int.parse(parts[2]);

        DateTime parsedDate = DateTime(year, month, day);
        List<String> hariEnglish = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        namaHari = hariEnglish[parsedDate.weekday % 7];
      }
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
        blockLogsText += "\n- [Photo Block Logs (Size: ${b.imageSize.toInt()}px) - Total photos: ${b.imageFiles.length}]: ${b.textController.text}";
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
              TextFormField(
                controller: _cbController,
                readOnly: true,
                onTap: _showTechnicianMultiSelectDialog,
                decoration: const InputDecoration(
                  hintText: "Select Technician(s)",
                  suffixIcon: Icon(Icons.arrow_drop_down, color: Color(0xFF0068C9)),
                ),
                validator: (v) => v!.isEmpty ? 'This field is required' : null,
              ),
              
              _buildStreamlitLabel("Customer"),
              DropdownButtonFormField<String>(
                isExpanded: true,
                value: _selectedCustomer,
                decoration: const InputDecoration(
                  hintText: "Select Customer",
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                items: _customerList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontSize: 13)),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCustomer = newValue;
                    if (newValue == 'Other (Type manually)') {
                      _isCustomCustomer = true;
                      _cuController.clear();
                    } else {
                      _isCustomCustomer = false;
                      _cuController.text = newValue ?? '';
                    }
                  });
                },
              ),
              if (_isCustomCustomer) ...[
                const SizedBox(height: 8),
                TextFormField(
                  controller: _cuController,
                  decoration: const InputDecoration(
                    hintText: "Enter customer name manually",
                    prefixIcon: Icon(Icons.edit, size: 18),
                  ),
                ),
              ],

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
                          double previewHeight = block.imageSize;

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
                                          width: previewHeight * 0.8,
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
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("Image Size: ${block.imageSize.toInt()} px", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF0068C9))),
                                          SizedBox(
                                            height: 25,
                                            child: SliderTheme(
                                              data: SliderTheme.of(context).copyWith(
                                                trackHeight: 3.0,
                                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7.0),
                                                overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
                                              ),
                                              child: Slider(
                                                value: block.imageSize,
                                                min: 60.0,
                                                max: 280.0,
                                                activeColor: const Color(0xFF0068C9),
                                                inactiveColor: const Color(0xFFCBD5E1),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    block.imageSize = newValue;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                      const SizedBox(height: 15),
                      
                      const Text("Service Technician", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFCBD5E1)), borderRadius: BorderRadius.circular(6)),
                        child: Signature(controller: _technicianSigController, height: 200, backgroundColor: const Color(0xFFF8F9FA)),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: () => _technicianSigController.clear(), child: const Text("Reset Signature", style: TextStyle(color: Colors.red, fontSize: 12))),
                      ),
                      
                      const SizedBox(height: 10),
                      const Divider(color: Color(0xFFE0E0E0)),
                      const SizedBox(height: 15),

                      const Text("Customer", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFCBD5E1)), borderRadius: BorderRadius.circular(6)),
                        child: Signature(controller: _customerSigController, height: 200, backgroundColor: const Color(0xFFF8F9FA)),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: () => _customerSigController.clear(), child: const Text("Reset Signature", style: TextStyle(color: Colors.red, fontSize: 12))),
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
  final Function(SparePartDraft)? onLoadPartDraft;

  const HistoryAndDraftPage({
    super.key,
    required this.isar,
    required this.onLoadDraft,
    this.onLoadPartDraft,
  });

  @override
  State<HistoryAndDraftPage> createState() => _HistoryAndDraftPageState();
}

class _HistoryAndDraftPageState extends State<HistoryAndDraftPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Reports & Drafts Storage', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0F172A), 
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF0068C9),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Service Reports'),
            Tab(text: 'Part Lists'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ServiceReportDraftListView(
            isar: widget.isar,
            onLoadDraft: widget.onLoadDraft,
          ),
          SparePartDraftListView(
            isar: widget.isar,
            onLoadDraft: (partDraft) {
              widget.onLoadPartDraft?.call(partDraft);
            },
          ),
        ],
      ),
    );
  }
}

class ServiceReportDraftListView extends StatelessWidget {
  final Isar isar;
  final Function(LocalReport) onLoadDraft;

  const ServiceReportDraftListView({
    super.key,
    required this.isar,
    required this.onLoadDraft,
  });

  Future<List<LocalReport>> _getReports() async {
    final reports = await isar.localReports.where().findAll();
    return reports.reversed.toList();
  }

  Future<void> _deleteReport(BuildContext context, int id) async {
    await isar.writeTxn(() async {
      await isar.localReports.delete(id);
    });
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Draft Service Report berhasil dihapus.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LocalReport>>(
      future: _getReports(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final reports = snapshot.data ?? [];
        if (reports.isEmpty) {
          return const Center(
            child: Text('Belum ada draft Service Report tersimpan.', style: TextStyle(color: Colors.grey)),
          );
        }

        return ListView.builder(
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              elevation: 1,
              child: ListTile(
                title: Text(
                  report.customerName?.isNotEmpty == true ? report.customerName! : 'Tanpa Nama Customer',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Machine: ${report.machine ?? '-'}\nTeknisi: ${report.completeBy ?? '-'} | Tanggal: ${report.date ?? '-'}',
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_document, color: Color(0xFF0068C9)),
                      tooltip: 'Buka / Edit Draft',
                      onPressed: () => onLoadDraft(report),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      tooltip: 'Hapus Draft',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Hapus Draft'),
                            content: const Text('Apakah Anda yakin ingin menghapus draft ini?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                  _deleteReport(context, report.id);
                                },
                                child: const Text('Hapus', style: TextStyle(color: Colors.red)),
                              ),
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
        );
      },
    );
  }
}

class SparePartDraftListView extends StatelessWidget {
  final Isar isar;
  final Function(SparePartDraft) onLoadDraft;

  const SparePartDraftListView({
    super.key,
    required this.isar,
    required this.onLoadDraft,
  });

  Future<List<SparePartDraft>> _getDrafts() async {
    return await isar.sparePartDrafts.where().sortByUpdatedAtDesc().findAll();
  }

  Future<void> _deleteDraft(BuildContext context, int id) async {
    await isar.writeTxn(() async {
      await isar.sparePartDrafts.delete(id);
    });
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Draft Part List berhasil dihapus.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SparePartDraft>>(
      future: _getDrafts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final drafts = snapshot.data ?? [];
        if (drafts.isEmpty) {
          return const Center(
            child: Text('Belum ada draft Part List tersimpan.', style: TextStyle(color: Colors.grey)),
          );
        }

        return ListView.builder(
          itemCount: drafts.length,
          itemBuilder: (context, index) {
            final draft = drafts[index];
            final itemLength = draft.items?.length ?? 0;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              elevation: 1,
              child: ListTile(
                title: Text(
                  draft.customer?.isNotEmpty == true ? draft.customer! : 'Tanpa Nama Customer',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Machine: ${draft.machine ?? '-'}\nTotal Part: $itemLength item | Tanggal: ${draft.date ?? '-'}',
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_document, color: Color(0xFF0068C9)),
                      tooltip: 'Buka / Edit Draft',
                      onPressed: () => onLoadDraft(draft),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      tooltip: 'Hapus Draft',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Hapus Draft'),
                            content: const Text('Apakah Anda yakin ingin menghapus draft ini?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                  _deleteDraft(context, draft.id);
                                },
                                child: const Text('Hapus', style: TextStyle(color: Colors.red)),
                              ),
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
        );
      },
    );
  }
}