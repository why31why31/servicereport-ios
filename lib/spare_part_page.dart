import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'spare_part_draft.dart';

class SparePartItemModel {
  final TextEditingController partNameController = TextEditingController();
  final TextEditingController partNumberController = TextEditingController();
  final TextEditingController qtyController = TextEditingController(text: '1');
  final TextEditingController remarkController = TextEditingController();
  XFile? imageFile;
  
  double imageSize = 70.0; 

  void dispose() {
    partNameController.dispose();
    partNumberController.dispose();
    qtyController.dispose();
    remarkController.dispose();
  }
}

class SparePartRecommendationPage extends StatefulWidget {
  final Isar? isar;
  final SparePartDraft? loadDraftData;
  final VoidCallback? onClearLoad;

  const SparePartRecommendationPage({
    super.key,
    this.isar,
    this.loadDraftData,
    this.onClearLoad,
  });

  @override
  State<SparePartRecommendationPage> createState() => _SparePartRecommendationPageState();
}

class _SparePartRecommendationPageState extends State<SparePartRecommendationPage> {
  final _customerController = TextEditingController();
  final _meetWithController = TextEditingController();
  final _machineController = TextEditingController();
  final _machineTypeController = TextEditingController();
  final _serialNoController = TextEditingController();
  final _technicianController = TextEditingController();
  final _dateController = TextEditingController();
  final _notesController = TextEditingController();

  final List<SparePartItemModel> _partItems = [];
  final ImagePicker _picker = ImagePicker();
  int? _currentDraftId;

  // Multi-select Teknisi
  List<String> _selectedTechnicians = [];
  final List<String> _techniciansList = [
    "Asep Wahyu",
    "Rangga W",
    "Wahyu",
    "Ali Akbar",
    "Karim"
  ];

  // Dropdown Customer & Machine
  String? _selectedCustomer;
  bool _isCustomCustomer = false;

  String? _selectedMachine;
  bool _isCustomMachine = false;

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

  final List<String> _machineList = [
    "Kilian",
    "Siebler",
    "Macofar",
    "Noack",
    "Promatic",
    "Romaco",
    "Truking",
    "MG2",
    "FrymaKoruma",
    "Stephan",
    "TrukingFrewitt",
    "Lytzen",
    "Other (Type manually)"
  ];

  @override
  void initState() {
    super.initState();
    _loadExistingDraftData();
  }

  @override
  void didUpdateWidget(covariant SparePartRecommendationPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.loadDraftData != oldWidget.loadDraftData) {
      _loadExistingDraftData();
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
              primary: Color(0xFF2563EB),
              onPrimary: Colors.white,
              onSurface: Color(0xFF1E293B),
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

  void _loadExistingDraftData() {
    if (widget.loadDraftData != null) {
      final draft = widget.loadDraftData!;
      _currentDraftId = draft.id;
      _technicianController.text = draft.technician ?? '';
      _selectedTechnicians = draft.technician?.isNotEmpty == true ? draft.technician!.split('/') : [];
      _dateController.text = draft.date ?? _formatDate(DateTime.now());
      _notesController.text = draft.notes ?? '';

      if (draft.customer != null && draft.customer!.isNotEmpty) {
        if (_customerList.contains(draft.customer)) {
          _selectedCustomer = draft.customer;
          _isCustomCustomer = false;
        } else {
          _selectedCustomer = 'Other (Type manually)';
          _isCustomCustomer = true;
        }
        _customerController.text = draft.customer!;
      } else {
        _selectedCustomer = null;
        _isCustomCustomer = false;
        _customerController.text = '';
      }

      if (draft.machine != null && draft.machine!.isNotEmpty) {
        if (_machineList.contains(draft.machine)) {
          _selectedMachine = draft.machine;
          _isCustomMachine = false;
        } else {
          _selectedMachine = 'Other (Type manually)';
          _isCustomMachine = true;
        }
        _machineController.text = draft.machine!;
      } else {
        _selectedMachine = null;
        _isCustomMachine = false;
        _machineController.text = '';
      }

      for (var item in _partItems) {
        item.dispose();
      }
      _partItems.clear();

      if (draft.items != null && draft.items!.isNotEmpty) {
        for (var savedItem in draft.items!) {
          final newItem = SparePartItemModel();
          newItem.partNameController.text = savedItem.partName ?? '';
          newItem.partNumberController.text = savedItem.partNumber ?? '';
          newItem.qtyController.text = savedItem.qty ?? '1';
          newItem.remarkController.text = savedItem.remark ?? '';
          if (savedItem.imagePath != null && savedItem.imagePath!.isNotEmpty) {
            final file = File(savedItem.imagePath!);
            if (file.existsSync()) {
              newItem.imageFile = XFile(savedItem.imagePath!);
            }
          }
          _partItems.add(newItem);
        }
      } else {
        _addNewPartItem();
      }
    } else {
      _dateController.text = _formatDate(DateTime.now());
      if (_partItems.isEmpty) {
        _addNewPartItem();
      }
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
                      activeColor: const Color(0xFF2563EB),
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
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2563EB)),
                  onPressed: () {
                    setState(() {
                      _selectedTechnicians = tempSelected;
                      _technicianController.text = _selectedTechnicians.join('/');
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
  void dispose() {
    _customerController.dispose();
    _meetWithController.dispose();
    _machineController.dispose();
    _machineTypeController.dispose();
    _serialNoController.dispose();
    _technicianController.dispose();
    _dateController.dispose();
    _notesController.dispose();
    for (var item in _partItems) {
      item.dispose();
    }
    super.dispose();
  }

  void _addNewPartItem() {
    setState(() {
      _partItems.add(SparePartItemModel());
    });
  }

  void _removePartItem(int index) {
    if (_partItems.length <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('At least 1 part item is required!')),
      );
      return;
    }
    setState(() {
      _partItems[index].dispose();
      _partItems.removeAt(index);
    });
  }

  Future<void> _pickImage(int index, ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source, imageQuality: 70);
      if (pickedFile != null) {
        setState(() {
          _partItems[index].imageFile = pickedFile;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
      }
    }
  }

  void _showImagePickerOptions(int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Color(0xFF2563EB)),
                title: const Text('Take Photo with Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(index, ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Color(0xFF2563EB)),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(index, ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _resetForm() {
    setState(() {
      _currentDraftId = null;
      _customerController.clear();
      _meetWithController.clear();
      _machineController.clear();
      _machineTypeController.clear();
      _serialNoController.clear();
      _technicianController.clear();
      _notesController.clear();
      _selectedTechnicians.clear();
      _dateController.text = _formatDate(DateTime.now());
      _selectedCustomer = null;
      _isCustomCustomer = false;
      _selectedMachine = null;
      _isCustomMachine = false;

      for (var item in _partItems) {
        item.dispose();
      }
      _partItems.clear();
      _addNewPartItem();
    });
    widget.onClearLoad?.call();
  }

  Future<void> _saveDraft() async {
    if (widget.isar == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('⚠️ Isar Database is not initialized.')),
      );
      return;
    }

    if (_customerController.text.trim().isEmpty &&
        _partItems.every((item) => item.partNameController.text.trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('⚠️ Enter customer name or at least 1 part name to save draft.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      final draftItems = _partItems.map((item) {
        return SparePartDraftItem()
          ..partName = item.partNameController.text.trim()
          ..partNumber = item.partNumberController.text.trim()
          ..qty = item.qtyController.text.trim()
          ..remark = item.remarkController.text.trim()
          ..imagePath = item.imageFile?.path;
      }).toList();

      final draft = SparePartDraft()
        ..id = _currentDraftId ?? Isar.autoIncrement
        ..customer = _customerController.text.trim()
        ..machine = _machineController.text.trim()
        ..technician = _technicianController.text.trim()
        ..date = _dateController.text.trim()
        ..notes = _notesController.text.trim()
        ..items = draftItems
        ..createdAt = widget.loadDraftData?.createdAt ?? DateTime.now()
        ..updatedAt = DateTime.now();

      await widget.isar!.writeTxn(() async {
        await widget.isar!.sparePartDrafts.put(draft);
      });

      setState(() {
        _currentDraftId = draft.id;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_currentDraftId != null ? '✅ Draft updated successfully!' : '✅ Draft saved successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save draft: $e'), backgroundColor: Colors.red),
        );
      }
    }
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

    pw.MemoryImage? pdfLogo;
    try {
      final bytecode = await rootBundle.load('assets/logo_finpac.png');
      final imageBytes = bytecode.buffer.asUint8List();
      pdfLogo = pw.MemoryImage(imageBytes);
    } catch (e) {
      pdfLogo = null;
    }

    List<pw.MemoryImage?> itemImages = [];
    for (var item in _partItems) {
      if (item.imageFile != null) {
        try {
          final file = File(item.imageFile!.path);
          if (file.existsSync()) {
            final bytes = file.readAsBytesSync();
            itemImages.add(pw.MemoryImage(bytes));
          } else {
            itemImages.add(null);
          }
        } catch (_) {
          itemImages.add(null);
        }
      } else {
        itemImages.add(null);
      }
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
        build: (pw.Context context) {
          return [
            pw.Container(
              width: double.infinity,
              decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFF2B82C9)),
              padding: const pw.EdgeInsets.symmetric(vertical: 5),
              alignment: pw.Alignment.center,
              child: pw.Text("SPARE PART RECOMMENDATION LIST", style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold, color: PdfColors.white, letterSpacing: 0.5)),
            ),
            
            pw.SizedBox(height: 8), 

            pw.Table(
              columnWidths: {
                0: const pw.FixedColumnWidth(70), 
                1: const pw.FlexColumnWidth(1.2), 
                2: const pw.FixedColumnWidth(10), 
                3: const pw.FixedColumnWidth(80), 
                4: const pw.FlexColumnWidth(1.0)  
              },
              border: null, 
              defaultVerticalAlignment: pw.TableCellVerticalAlignment.bottom, 
              children: [
                pw.TableRow(children: [
                  pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text("Technician:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                  pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text(_technicianController.text, style: pw.TextStyle(fontSize: 9.5))),
                  pw.SizedBox(width: 10), 
                  pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text("Date:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                  pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text(_dateController.text, style: pw.TextStyle(fontSize: 9.5))),
                ]),
                pw.TableRow(children: [
                  pw.SizedBox(height: 8), pw.SizedBox(height: 8), pw.SizedBox(height: 8), pw.SizedBox(height: 8), pw.SizedBox(height: 8),
                ]),
                
                pw.TableRow(children: [
                  pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text("Customer:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                  pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text(_customerController.text, style: pw.TextStyle(fontSize: 9.5))),
                  pw.SizedBox(width: 10), 
                  pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text("Requested by:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                  pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text(_meetWithController.text, style: pw.TextStyle(fontSize: 9.5))),
                ]),
              ],
            ),
            pw.SizedBox(height: 8),

            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text("Machine:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                pw.Expanded(
                  flex: 2,
                  child: pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text(_machineController.text, style: pw.TextStyle(fontSize: 9.5))),
                ),
                pw.SizedBox(width: 10),

                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text("Type:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                pw.Expanded(
                  flex: 2,
                  child: pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text(_machineTypeController.text, style: pw.TextStyle(fontSize: 9.5))),
                ),
                pw.SizedBox(width: 10),

                pw.Container(color: const PdfColor.fromInt(0xFFF0F4F8), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text("S/N:", style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold))),
                pw.Expanded(
                  flex: 2,
                  child: pw.Container(decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF0F4F8), border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black, width: 0.4))), padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 4), child: pw.Text(_serialNoController.text, style: pw.TextStyle(fontSize: 9.5))),
                ),
              ],
            ),            
            pw.SizedBox(height: 18),

            pw.Text("RECOMMENDED SPARE PARTS", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10, color: PdfColors.black)),
            pw.Container(margin: const pw.EdgeInsets.only(top: 2, bottom: 6), height: 0.8, color: PdfColors.black),
            pw.SizedBox(height: 6),
            
            pw.Column(
              children: List.generate(_partItems.length, (index) {
                final item = _partItems[index];
                final img = itemImages[index];

                return pw.Container(
                  margin: const pw.EdgeInsets.only(bottom: 12),
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("${index + 1}.", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9.5)),
                      pw.SizedBox(width: 8),
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              item.partNameController.text.isEmpty ? "Item #${index + 1}" : item.partNameController.text,
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9.5),
                            ),
                            pw.SizedBox(height: 3),
                            pw.Row(
                              children: [
                                pw.Text("Part No: ${item.partNumberController.text.isEmpty ? '-' : item.partNumberController.text}", style: const pw.TextStyle(fontSize: 9.5)),
                                pw.SizedBox(width: 15),
                                pw.Text("Qty: ${item.qtyController.text.isEmpty ? '1' : item.qtyController.text}", style: const pw.TextStyle(fontSize: 9.5)),
                              ],
                            ),
                            if (item.remarkController.text.isNotEmpty) ...[
                              pw.SizedBox(height: 3),
                              pw.Text("Remarks: ${item.remarkController.text}", style: pw.TextStyle(fontSize: 9.5, color: PdfColors.grey800, fontStyle: pw.FontStyle.italic)),
                            ],
                          ],
                        ),
                      ),
                      if (img != null) ...[
                        pw.SizedBox(width: 8),
                        pw.Container(
                          height: item.imageSize,
                          child: pw.Image(img, fit: pw.BoxFit.contain),
                        ),
                      ],
                    ],
                  ),
                );
              }),
            ),

            if (_notesController.text.isNotEmpty) ...[
              pw.SizedBox(height: 18),
              pw.Text("ADDITIONAL NOTES", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10, color: PdfColors.black)),
              pw.Container(margin: const pw.EdgeInsets.only(top: 2, bottom: 6), height: 0.8, color: PdfColors.black),
              pw.Text(_notesController.text, style: pw.TextStyle(fontSize: 9.5, lineSpacing: 1.3)),
            ],
          ];
        },
      ),
    );
    return pdf;
  }

  void _openPrintPreviewPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF0F172A),
            title: const Text("Print Preview - Spare Part List", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          body: PdfPreview(
            build: (format) async {
              final pdfDoc = await _buildActivePdfDocument();
              return pdfDoc.save();
            },
            allowPrinting: true,
            allowSharing: true,
            canChangeOrientation: false,
            canChangePageFormat: false,
            initialPageFormat: PdfPageFormat.a4,
            pdfFileName: "Part_List_${_customerController.text}_${_dateController.text}.pdf",
          ),
        ),
      ),
    );
  }

  Future<void> _generateAndSharePdf() async {
    try {
      final pdfDoc = await _buildActivePdfDocument();
      final output = await getApplicationDocumentsDirectory();
      String customerName = _customerController.text.trim().replaceAll(RegExp(r'[^\w\s\-]'), '');
      if (customerName.isEmpty) customerName = "Customer";

      final file = File("${output.path}/PartList_${customerName}_${_dateController.text}.pdf");
      await file.writeAsBytes(await pdfDoc.save());

      await Share.shareXFiles([XFile(file.path)], text: 'Spare Part Recommendation List - $customerName');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to generate PDF: $e')));
    }
  }

  Future<void> _sharePartListSummary() async {
    if (_customerController.text.isEmpty && _partItems.every((item) => item.partNameController.text.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('⚠️ Enter customer name and at least 1 part name!'), backgroundColor: Colors.orange),
      );
      return;
    }

    StringBuffer summary = StringBuffer();
    summary.writeln("🛠️ *SPARE PART RECOMMENDATION LIST*");
    summary.writeln("=================================");
    summary.writeln("👤 Customer: ${_customerController.text.isEmpty ? '-' : _customerController.text}");
    summary.writeln("⚙️ Machine Brand: ${_machineController.text.isEmpty ? '-' : _machineController.text}");
    if (_machineTypeController.text.isNotEmpty) summary.writeln("🏷️ Machine Type: ${_machineTypeController.text}");
    if (_serialNoController.text.isNotEmpty) summary.writeln("🔢 Serial No: ${_serialNoController.text}");
    summary.writeln("👨‍🔧 Technician: ${_technicianController.text.isEmpty ? '-' : _technicianController.text}");
    summary.writeln("📅 Date: ${_dateController.text}");
    summary.writeln("\n📋 *RECOMMENDED PARTS:*");

    List<XFile> imagesToShare = [];
    int counter = 1;

    for (var item in _partItems) {
      String name = item.partNameController.text.trim();
      if (name.isNotEmpty) {
        summary.writeln("$counter. *$name*");
        if (item.partNumberController.text.isNotEmpty) summary.writeln("   - Part No: ${item.partNumberController.text}");
        summary.writeln("   - Qty: ${item.qtyController.text}");
        if (item.remarkController.text.isNotEmpty) summary.writeln("   - Remarks: ${item.remarkController.text}");
        if (item.imageFile != null) {
          imagesToShare.add(item.imageFile!);
          summary.writeln("   - 📷 [Photo Attached]");
        }
        counter++;
      }
    }

    if (_notesController.text.isNotEmpty) {
      summary.writeln("\n📝 *Additional Notes:*");
      summary.writeln(_notesController.text.trim());
    }

    if (imagesToShare.isNotEmpty) {
      await Share.shareXFiles(imagesToShare, text: summary.toString());
    } else {
      await Share.share(summary.toString());
    }
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 10),
      child: Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF334155))),
    );
  }

  // ===========================================================================
  // HELPER METODE UNTUK UI MODERN
  // ===========================================================================

  InputDecoration _buildModernInput({required String hintText, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
      fillColor: const Color(0xFFF1F5F9),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5)),
    );
  }

  Widget _buildModernSectionCard({required String title, required IconData icon, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [BoxShadow(color: Color(0x08000000), blurRadius: 10, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: const Color(0xFF2563EB).withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, color: const Color(0xFF2563EB), size: 20),
              ),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: Text(_currentDraftId != null ? 'Edit Part List Draft (#$_currentDraftId)' : 'Spare Part Recommendation', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _resetForm,
            tooltip: 'Reset Form',
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // KARTU 1: VISIT INFORMATION
            // ==========================================
            _buildModernSectionCard(
              title: "Visit Information",
              icon: Icons.assignment_outlined,
              children: [
                // 1. Complete by *
                _buildLabel("Complete by *"),
                TextFormField(
                  controller: _technicianController,
                  readOnly: true,
                  onTap: _showTechnicianMultiSelectDialog,
                  decoration: _buildModernInput(
                    hintText: "Select Technician(s)",
                    suffixIcon: const Icon(Icons.arrow_drop_down, color: Color(0xFF2563EB)),
                  ),
                ),

                // 2. Customer
                _buildLabel("Customer"),
                DropdownButtonFormField<String>(
                  value: _customerList.contains(_selectedCustomer) ? _selectedCustomer : null,
                  isExpanded: true,
                  decoration: _buildModernInput(hintText: "Select Customer"),
                  items: _customerList.map((cust) {
                    return DropdownMenuItem<String>(
                      value: cust,
                      child: Text(cust, style: const TextStyle(fontSize: 13)),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedCustomer = val;
                      if (val == 'Other (Type manually)') {
                        _isCustomCustomer = true;
                        _customerController.clear();
                      } else {
                        _isCustomCustomer = false;
                        _customerController.text = val ?? '';
                      }
                    });
                  },
                ),
                if (_isCustomCustomer) ...[
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _customerController,
                    decoration: _buildModernInput(hintText: "Type customer name manually"),
                  ),
                ],

                // 3. Meet with
                _buildLabel("Meet with"),
                TextFormField(
                  controller: _meetWithController,
                  decoration: _buildModernInput(hintText: "Contact person name"),
                ),

                // 4. Date
                _buildLabel("Date"),
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: _buildModernInput(
                    hintText: "Select Date Range",
                    suffixIcon: const Icon(Icons.calendar_month, color: Color(0xFF2563EB)),
                  ),
                ),

                // 5. Machine
                _buildLabel("Machine"),
                DropdownButtonFormField<String>(
                  value: _machineList.contains(_selectedMachine) ? _selectedMachine : null,
                  isExpanded: true,
                  decoration: _buildModernInput(hintText: "Select Machine Brand"),
                  items: _machineList.map((m) {
                    return DropdownMenuItem<String>(
                      value: m,
                      child: Text(m, style: const TextStyle(fontSize: 13)),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedMachine = val;
                      if (val == 'Other (Type manually)') {
                        _isCustomMachine = true;
                        _machineController.clear();
                      } else {
                        _isCustomMachine = false;
                        _machineController.text = val ?? '';
                      }
                    });
                  },
                ),
                if (_isCustomMachine) ...[
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _machineController,
                    decoration: _buildModernInput(hintText: "Type machine brand manually"),
                  ),
                ],

                // 6. Machine Type
                _buildLabel("Machine Type"),
                TextFormField(
                  controller: _machineTypeController,
                  decoration: _buildModernInput(hintText: "e.g., S 250 S / Perfecta"),
                ),

                // 7. Serial No
                _buildLabel("Serial No"),
                TextFormField(
                  controller: _serialNoController,
                  decoration: _buildModernInput(hintText: "e.g., SN-2026-XXXX"),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ==========================================
            // KARTU 2: SPARE PART LIST
            // ==========================================
            _buildModernSectionCard(
              title: "Spare Part List (${_partItems.length} Items)",
              icon: Icons.build_outlined,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _partItems.length,
                  itemBuilder: (context, index) {
                    final item = _partItems[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Item #${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF0F172A))),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                                onPressed: () => _removePartItem(index),
                              ),
                            ],
                          ),
                          _buildLabel("Part Name / Description *"),
                          TextFormField(controller: item.partNameController, decoration: _buildModernInput(hintText: "Component / Spare part name")),
                          Row(
                            children: [
                              Expanded(flex: 2, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildLabel("Part No / Article"), TextFormField(controller: item.partNumberController, decoration: _buildModernInput(hintText: "Part code"))])),
                              const SizedBox(width: 10),
                              Expanded(flex: 1, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildLabel("Qty"), TextFormField(controller: item.qtyController, keyboardType: TextInputType.number, decoration: _buildModernInput(hintText: "1"))])),
                            ],
                          ),
                          _buildLabel("Remarks / Reason for Replacement"),
                          TextFormField(controller: item.remarkController, decoration: _buildModernInput(hintText: "e.g., Worn out, Cracked, Spare needed")),
                          _buildLabel("Part Photo"),
                          item.imageFile == null
                              ? OutlinedButton.icon(
                                  onPressed: () => _showImagePickerOptions(index),
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(44),
                                    side: const BorderSide(color: Color(0xFFCBD5E1)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  icon: const Icon(Icons.add_a_photo_outlined, size: 18, color: Color(0xFF2563EB)),
                                  label: const Text("Add Part Photo", style: TextStyle(color: Color(0xFF2563EB), fontSize: 12, fontWeight: FontWeight.w600)),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File(item.imageFile!.path),
                                        height: 140,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    
                                    Row(
                                      children: [
                                        const Icon(Icons.photo_size_select_large, size: 16, color: Color(0xFF64748B)),
                                        const SizedBox(width: 6),
                                        Text("PDF Size: ${item.imageSize.toInt()}px", style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF2563EB))),
                                        Expanded(
                                          child: SliderTheme(
                                            data: SliderTheme.of(context).copyWith(
                                              trackHeight: 2.0,
                                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                                            ),
                                            child: Slider(
                                              value: item.imageSize,
                                              min: 50.0,
                                              max: 200.0,
                                              activeColor: const Color(0xFF2563EB),
                                              inactiveColor: const Color(0xFFCBD5E1),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item.imageSize = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextButton.icon(
                                            onPressed: () => _showImagePickerOptions(index),
                                            icon: const Icon(Icons.refresh, size: 16),
                                            label: const Text("Change Photo", style: TextStyle(fontSize: 12)),
                                          ),
                                        ),
                                        Expanded(
                                          child: TextButton.icon(
                                            onPressed: () => setState(() => item.imageFile = null),
                                            style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
                                            icon: const Icon(Icons.delete, size: 16),
                                            label: const Text("Remove Photo", style: TextStyle(fontSize: 12)),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: _addNewPartItem,
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    side: const BorderSide(color: Color(0xFF2563EB)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.add_circle_outline, color: Color(0xFF2563EB)),
                  label: const Text('➕ ADD PART ITEM', style: TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ==========================================
            // KARTU 3: ADDITIONAL NOTES
            // ==========================================
            _buildModernSectionCard(
              title: "Additional Notes",
              icon: Icons.note_alt_outlined,
              children: [
                _buildLabel("General Remarks"),
                TextFormField(
                  controller: _notesController,
                  maxLines: 3,
                  decoration: _buildModernInput(hintText: "Add specific instructions for purchasing/sales team..."),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ==========================================
            // ACTION BUTTONS
            // ==========================================
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _saveDraft,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      side: const BorderSide(color: Color(0xFF2563EB)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.save_outlined, color: Color(0xFF2563EB)),
                    label: Text(_currentDraftId != null ? 'UPDATE DRAFT' : 'SAVE DRAFT', style: const TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _openPrintPreviewPage,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      side: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.picture_in_picture, color: Color(0xFF2563EB)),
                    label: const Text('PRINT PREVIEW', style: TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: _generateAndSharePdf,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
              label: const Text('🚀 GENERATE & SHARE PDF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: _sharePartListSummary,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F172A),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.share, color: Colors.white),
              label: const Text('📲 SHARE TEXT SUMMARY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}