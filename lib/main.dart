import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _arusController = TextEditingController();
  final _teganganController = TextEditingController();
  final _kapasitasController = TextEditingController();

  // Variabel untuk hasil perhitungan
  String _hasil = '';
  String _daya = '';

  // Fungsi untuk menghitung Flight Time
  void _hitungFlightTime() {
    double kapasitas = double.tryParse(_kapasitasController.text) ?? 0;
    double tegangan = double.tryParse(_teganganController.text) ?? 0;
    double arus = double.tryParse(_arusController.text) ?? 0;

    // Rumus perhitungan Flight Time
    if (tegangan != 0 && arus != 0) {
      double flightTime = (kapasitas / (tegangan * arus)) * 0.7;
      double Watt = (arus * tegangan);
      setState(() {
        _hasil = flightTime
            .toStringAsFixed(2); // Menampilkan hasil dengan 2 angka desimal
        _daya = Watt
         .toStringAsFixed(2); // Menampilkan hasil daya dengan 2 angka desimal
        
      });
    } else {
      setState(() {
        _hasil = 'Input tidak valid';
        _daya = 'Input tidak valid';
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Terbang"),
        backgroundColor: const Color.fromARGB(255, 154, 188, 16),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Form Input Arus
            TextFormField(
              controller: _arusController,
              decoration: InputDecoration(
                labelText: 'Masukkan Arus (A)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            // Form Input Tegangan
            TextFormField(
              controller: _teganganController,
              decoration: InputDecoration(
                labelText: 'Masukkan Tegangan (V)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            // Form Input Kapasitas Baterai
            TextFormField(
              controller: _kapasitasController,
              decoration: InputDecoration(
                labelText: 'Kapasitas Baterai (mAh)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 40),

            // Tombol untuk menghitung
            ElevatedButton(
              onPressed: _hitungFlightTime,
              child: Text('Hitung Flight Time'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              ),
            ),
            SizedBox(height: 40),

            // Menampilkan hasil perhitungan
            Text(
              'Hasil Dari Perhitungan Flight Time: $_hasil Menit dan dayanya $_daya Watt',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ));
  }
}
