import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:signature/signature.dart';
import 'report_model.dart';
import 'pdf_service.dart';

class MainScreen extends StatefulWidget {
  final Isar isar;
  const MainScreen({super.key, required this.isar});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _completeByCtrl = TextEditingController();
  final _customerCtrl = TextEditingController();
  final _machineCtrl = TextEditingController();
  final _dateCtrl = TextEditingController();
  final _meetWithCtrl = TextEditingController();
  final _typeCtrl = TextEditingController();
  final _serialNoCtrl = TextEditingController();

  final SignatureController _techSignCtrl = SignatureController(penStrokeWidth: 3, penColor: Colors.black);
  final SignatureController _custSignCtrl = SignatureController(penStrokeWidth: 3, penColor: Colors.black);

  @override
  void dispose() {
    _completeByCtrl.dispose();
    _customerCtrl.dispose();
    _machineCtrl.dispose();
    _dateCtrl.dispose();
    _meetWithCtrl.dispose();
    _typeCtrl.dispose();
    _serialNoCtrl.dispose();
    _techSignCtrl.dispose();
    _custSignCtrl.dispose();
    super.dispose();
  }

  Future<void> _saveAndExport() async {
    if (_formKey.currentState!.validate()) {
      final techSign = await _techSignCtrl.toPngBytes();
      final custSign = await _custSignCtrl.toPngBytes();

      if (techSign == null || custSign == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mohon lengkapi tanda tangan teknisi dan customer!')),
        );
        return;
      }

      final report = ServiceReport()
        ..completeBy = _completeByCtrl.text
        ..customer = _customerCtrl.text
        ..machine = _machineCtrl.text
        ..date = _dateCtrl.text
        ..meetWith = _meetWithCtrl.text
        ..type = _typeCtrl.text
        ..serialNo = _serialNoCtrl.text
        ..technicianSignature = techSign
        ..customerSignature = custSign;

      await widget.isar.writeTxn(() async {
        await widget.isar.serviceReports.put(report);
      });

      await PdfService.generateAndOpenPdf(report);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil disimpan dan PDF berhasil dibuat!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Data Servis PT. Finpac Anugerah Indonesia')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(controller: _completeByCtrl, decoration: const InputDecoration(labelText: 'Complete by'), validator: (v) => v!.isEmpty ? 'Wajib diisi' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _customerCtrl, decoration: const InputDecoration(labelText: 'Customer'), validator: (v) => v!.isEmpty ? 'Wajib diisi' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _machineCtrl, decoration: const InputDecoration(labelText: 'Machine'), validator: (v) => v!.isEmpty ? 'Wajib diisi' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _dateCtrl, decoration: const InputDecoration(labelText: 'Date (YYYY-MM-DD)'), validator: (v) => v!.isEmpty ? 'Wajib diisi' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _meetWithCtrl, decoration: const InputDecoration(labelText: 'Meet with'), validator: (v) => v!.isEmpty ? 'Wajib diisi' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _typeCtrl, decoration: const InputDecoration(labelText: 'Type'), validator: (v) => v!.isEmpty ? 'Wajib diisi' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _serialNoCtrl, decoration: const InputDecoration(labelText: 'Serial No'), validator: (v) => v!.isEmpty ? 'Wajib diisi' : null),
              const SizedBox(height: 20),

              const Text('Tanda Tangan Teknisi:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Signature(controller: _techSignCtrl, height: 120, backgroundColor: Colors.white),
              ),
              const SizedBox(height: 20),

              const Text('Tanda Tangan Customer:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Signature(controller: _custSignCtrl, height: 120, backgroundColor: Colors.white),
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveAndExport,
                  child: const Text('Simpan & Cetak PDF', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}